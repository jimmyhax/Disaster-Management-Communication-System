//-----------------------------------------------------------------
// A DotNetOpenAuth client for logging in to Google using OAuth2.
// Reference: https://developers.google.com/accounts/docs/OAuth2
// ----------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using DotNetOpenAuth.AspNet.Clients;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text;
using DotNetOpenAuth.AspNet;
using System.Net.Http;
using System.Threading.Tasks;

namespace DotNetOpenAuth.ApplicationBlock {

    //http://johnnycode.com/2012/02/23/consuming-your-own-asp-net-web-api-rest-service/

    public class BaseClientResponse{
        public string ErrorException{get;set;}
        public string Content { get; set; }
    }

    public class BaseClient
    {
        protected readonly string _endpoint;

        public BaseClient(string endpoint)
        {
            _endpoint = endpoint;
        }

        public BaseClientResponse Get()
        {
            using (var httpClient = new HttpClient())
            {
                BaseClientResponse result = new BaseClientResponse();
                Task responseTask = null;

                httpClient.GetAsync(_endpoint).ContinueWith((requestTask) =>
                {
                    responseTask = requestTask;
                    HttpResponseMessage response = requestTask.Result;

                    response.EnsureSuccessStatusCode();

                    response.Content.ReadAsStringAsync().ContinueWith((readTask) =>
                    {
                        result.Content = readTask.Result;
                    });
                });

                // HACK: My version of the await keyword
                while (responseTask == null || !responseTask.IsCompleted || result == null) { }

                return result;
            }
        }
    }

    public class GoogleOAuth2CustomClient : OAuth2Client
    {
        #region Constants and Fields

        /// <summary>
        /// The authorization endpoint.
        /// </summary>
        private const string AuthorizationEndpoint = "https://accounts.google.com/o/oauth2/auth";

        /// <summary>
        /// The token endpoint.
        /// </summary>
        private const string TokenEndpoint = "https://accounts.google.com/o/oauth2/token";

        /// <summary>
        /// The _app id.
        /// </summary>
        private readonly string _clientId;

        /// <summary>
        /// The _app secret.
        /// </summary>
        private readonly string _clientSecret;

        #endregion


        public GoogleOAuth2CustomClient (string clientId, string clientSecret)
            : base("Google")
        {
            if (string.IsNullOrWhiteSpace(clientId)) throw new ArgumentNullException("clientId");
            if (string.IsNullOrWhiteSpace(clientSecret)) throw new ArgumentNullException("clientSecret");

            this._clientId = clientId;
            this._clientSecret = clientSecret;
        }

        protected override Uri GetServiceLoginUrl(Uri returnUrl)
        {
            StringBuilder serviceUrl = new StringBuilder();

            serviceUrl.AppendFormat("{0}?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile", AuthorizationEndpoint);
            serviceUrl.Append("&state=google");
            serviceUrl.AppendFormat("&redirect_uri={0}", returnUrl.ToString());
            serviceUrl.Append("&response_type=code");
            serviceUrl.AppendFormat("&client_id={0}", _clientId);

            return new Uri(serviceUrl.ToString());

        }

        protected override IDictionary<string, string> GetUserData(string accessToken)
        {
            BaseClient client = new BaseClient("https://www.googleapis.com" + String.Format("/oauth2/v1/userinfo?access_token={0}", accessToken));
            IDictionary<String, String> extraData = new Dictionary<String, String>();

            var response = client.Get();
            if (null != response.ErrorException)
            {
                return null;
            }
            else
            {
                try
                {
                    var json = JObject.Parse(response.Content);

                    string firstName = (string)json["given_name"];
                    string lastName = (string)json["family_name"];
                    string emailAddress = (string)json["email"];
                    string id = (string)json["id"];

                    extraData = new Dictionary<String, String>
                {
                    {"accesstoken", accessToken}, 
                    {"name", String.Format("{0} {1}", firstName, lastName)},
                    {"firstname", firstName},
                    {"lastname", lastName},
                    {"email", emailAddress},
                    {"id", id}                                           
                };
                }
                catch (Exception ex)
                {

                    return null;
                }
                return extraData;
            }

        }

        protected override string QueryAccessToken(Uri returnUrl, string authorizationCode)
        {
            StringBuilder postData = new StringBuilder();
            postData.AppendFormat("client_id={0}", this._clientId);
            postData.AppendFormat("&redirect_uri={0}", HttpUtility.UrlEncode(returnUrl.ToString()));
            postData.AppendFormat("&client_secret={0}", this._clientSecret);
            postData.AppendFormat("&grant_type={0}", "authorization_code");
            postData.AppendFormat("&code={0}", authorizationCode);


            string response = "";
            string accessToken = "";

            var webRequest = (HttpWebRequest)WebRequest.Create(TokenEndpoint);

            webRequest.Method = "POST";
            webRequest.ContentType = "application/x-www-form-urlencoded";

            try
            {

                using (Stream s = webRequest.GetRequestStream())
                {
                    using (StreamWriter sw = new StreamWriter(s))
                        sw.Write(postData.ToString());
                }

                using (WebResponse webResponse = webRequest.GetResponse())
                {
                    using (StreamReader reader = new StreamReader(webResponse.GetResponseStream()))
                    {
                        response = reader.ReadToEnd();
                    }
                }

                var json = JObject.Parse(response);
                accessToken = (string)json["access_token"];
            }
            catch (Exception ex)
            {

                return null;
            }

            return accessToken;

        }

        public override AuthenticationResult VerifyAuthentication(HttpContextBase context, Uri returnPageUrl)
        {

            string code = context.Request.QueryString["code"];
            if (string.IsNullOrEmpty(code))
            {
                return AuthenticationResult.Failed;
            }

            string accessToken = this.QueryAccessToken(returnPageUrl, code);
            if (accessToken == null)
            {
                return AuthenticationResult.Failed;
            }

            IDictionary<string, string> userData = this.GetUserData(accessToken);
            if (userData == null)
            {
                return AuthenticationResult.Failed;
            }

            string id = userData["id"];
            string name;

            // Some oAuth providers do not return value for the 'username' attribute. 
            // In that case, try the 'name' attribute. If it's still unavailable, fall back to 'id'
            if (!userData.TryGetValue("username", out name) && !userData.TryGetValue("name", out name))
            {
                name = id;
            }

            // add the access token to the user data dictionary just in case page developers want to use it
            userData["accesstoken"] = accessToken;

            return new AuthenticationResult(
                isSuccessful: true, provider: this.ProviderName, providerUserId: id, userName: name, extraData: userData);
        }
    }
}
