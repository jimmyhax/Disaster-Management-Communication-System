using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Web.Admin.Logic.Objects;

namespace Web.Admin.Logic.Collections
{
    /// <summary>
    /// Provides the collection of the admin application parameters which are stored in the database.
    /// </summary>
    public class ApplicationParameters
    {

        /// <summary>
        /// Gets application parameter collection which are kept in HTTP session. If it doesn't exist will be read from database.
        /// </summary>
        public List<Parameter> AppParameters
        {
            get
            {
                HttpContext.Current.Application.Lock();
                List<Parameter> _Parameters = null;

                if (HttpContext.Current.Application["Parameters"] != null)
                {
                    _Parameters = (List<Parameter>)HttpContext.Current.Application["Parameters"];
                }
                else
                {
                    _Parameters = Parameters.Get();
                    HttpContext.Current.Application["Parameters"] = _Parameters;
                    return _Parameters;
                }

                HttpContext.Current.Application.UnLock();
                return _Parameters;
            }
        }

        /// <summary>
        /// Gets application parameter by name.
        /// </summary>
        /// <param name="Name">Parameter name.</param>
        /// <returns>Insatnce of Parameter object.</returns>
        public Parameter GetParam(String Name)
        {
            return AppParameters.FirstOrDefault(t => t.Name.ToLower() == Name.ToLower());
        }

        /// <summary>
        /// Reloads all application parametrs from the database.
        /// </summary>
        public void RefreshAppParameters()
        {
            HttpContext.Current.Application.Lock();
            HttpContext.Current.Application["Parameters"] = Parameters.Get();
            HttpContext.Current.Application.UnLock();
        }

        /// <summary></summary>
        public Parameter GeneralAdminEmail { get { return GetParam("general-admin-email"); } }
        /// <summary></summary>
        public Parameter GeneralDomainName { get { return GetParam("general-domain-name"); } }
        /// <summary></summary>
        public Parameter GeneralAuditEnabled { get { return GetParam("general-audit-enabled"); } }
        /// <summary></summary>
        public Parameter GeneralAppPath { get { return GetParam("general-app-path"); } }
        /// <summary></summary>
        public Parameter GeneralCookieName { get { return GetParam("general-cookie-name"); } }

        /// <summary></summary>
        public Parameter GeneralSecretAdminUrl { get { return GetParam("general-app-secret-admin-url"); } }
        /// <summary></summary>
        public Parameter GeneralMaintenanceUrl { get { return GetParam("general-app-maintenance-url"); } }
        /// <summary></summary>
        public Parameter GeneralMaintenanceEnabled { get { return GetParam("general-app-maintenance-enabled"); } }

        /// <summary></summary>
        public Parameter ThemesCurrentName { get { return GetParam("themes-app-current-name"); } }

        /// <summary></summary>
        public Parameter RegistrationSelfRegistration { get { return GetParam("registration-self-registration"); } }
        /// <summary></summary>
        public Parameter RegistrationSelfActivation { get { return GetParam("registration-self-activation"); } }
        /// <summary></summary>
        public Parameter RegistrationResetPassword { get { return GetParam("registration-reset-password"); } }

        /// <summary></summary>
        public Parameter RegistrationMemberRegistrationToRoles { get { return GetParam("registration-member-registration-to-roles"); } }
        /// <summary></summary>
        public Parameter RegistrationMemberActivationToRoles { get { return GetParam("registration-member-activation-to-roles"); } }
        /// <summary></summary>
        public Parameter RegistrationMailDomainRestriction { get { return GetParam("registration-mail-domain-restriction"); } }
        /// <summary></summary>
        public Parameter RegistrationMailDomainRestrictionList { get { return GetParam("registration-mail-domain-restriction-list"); } }

        /// <summary></summary>
        public Parameter RulesRedirectAfterLogin { get { return GetParam("rules-redirect-after-login"); } }
        /// <summary></summary>
        public Parameter RulesRedirectAfterLogout { get { return GetParam("rules-redirect-after-logout"); } }
        /// <summary> </summary>
        public Parameter RulesRedirectAfterSignUp { get { return GetParam("rules-redirect-after-sign-up"); } }
        /// <summary></summary>
        public Parameter RulesMailBcc { get { return GetParam("rules-member-mail-bcc"); } }
        /// <summary></summary>
        public Parameter RulesMailBccRegistration { get { return GetParam("rules-member-mail-bcc-registration"); } }
        /// <summary></summary>
        public Parameter RulesMailBccActivation { get { return GetParam("rules-member-mail-bcc-activation"); } }
        /// <summary></summary>
        public Parameter RulesMailBccPasswordChange { get { return GetParam("rules-member-mail-bcc-passworchange"); } }

        /// <summary></summary>
        public Parameter RulesPasswordFailedRoles { get { return GetParam("rules-password-failed-roles"); } }
        /// <summary></summary>
        public Parameter RulesPasswordFailedAttempts { get { return GetParam("rules-password-failed-attempts"); } }
        /// <summary></summary>
        public Parameter RulesPasswordFailedRedirect { get { return GetParam("rules-password-failed-attempts-redirect"); } }

        /// <summary></summary>
        public Parameter MailServerSmtpHost { get { return GetParam("mailserver-smtp-host"); } }
        /// <summary></summary>
        public Parameter MailServerSmtpUser { get { return GetParam("mailserver-smtp-user"); } }
        /// <summary></summary>
        public Parameter MailServerSmtpEmail { get { return GetParam("mailserver-smtp-email"); } }
        /// <summary></summary>
        public Parameter MailServerSmtpPassword { get { return GetParam("mailserver-smtp-pass"); } }
        /// <summary></summary>
        public Parameter MailServerSmtpPort { get { return GetParam("mailserver-smtp-port"); } }
        /// <summary></summary>
        public Parameter MailServerSmtpSSLEnabled { get { return GetParam("mailserver-smtp-ssl-enabled"); } }

        /// <summary></summary>
        public Parameter AppUIName { get { return GetParam("ui-app-name"); } }
        /// <summary></summary>
        public Parameter AppUiPagingSize { get { return GetParam("ui-paging-size"); } }
        /// <summary></summary>
        public Parameter AppApiEnabled { get { return GetParam("api-enabled"); } }
        /// <summary></summary>
        public Parameter AppApiSecretURL { get { return GetParam("api-secret-url"); } }
        /// <summary></summary>
        public Parameter AppFluid { get { return GetParam("ui-app-fluid"); } }

        /// <summary></summary>
        public Parameter LanguagePublicDefault { get { return GetParam("language-public-default"); } }

        /// <summary></summary>
        public Parameter SocialTwitterEnabled { get { return GetParam("social-twitter-enabled"); } }
        /// <summary></summary>
        public Parameter SocialTwitterConsumerKey { get { return GetParam("social-twitter-consumer-key"); } }
        /// <summary></summary>
        public Parameter SocialTwitterConsumerSecret { get { return GetParam("social-twitter-consumer-secret"); } }
        /// <summary></summary>
        public Parameter SocialFacebookEnabled { get { return GetParam("social-facebook-enabled"); } }
        /// <summary></summary>
        public Parameter SocialFacebookAppID { get { return GetParam("social-facebook-app-id"); } }
        /// <summary></summary>
        public Parameter SocialFacebookAppSecret { get { return GetParam("social-facebook-app-secret"); } }
        /// <summary></summary>
        public Parameter SocialGooleEnabled { get { return GetParam("social-goole-enabled"); } }
        /// <summary></summary>
        public Parameter SocialYahooEnabled { get { return GetParam("social-yahoo-enabled"); } }
        /// <summary></summary>
        public Parameter SocialTwitterRoles { get { return GetParam("social-twitter-roles"); } }
        /// <summary></summary>
        public Parameter SocialFacebookRoles { get { return GetParam("social-facebook-roles"); } }
        /// <summary></summary>
        public Parameter SocialGoogleRoles { get { return GetParam("social-google-roles"); } }
        /// <summary></summary>
        public Parameter SocialYahooRoles	 { get { return GetParam("social-yahoo-roles"); } }

        /// <summary></summary>
        public Parameter SocialLiveJournalEnabled{ get { return GetParam("social-livejournal-enabled"); } }
        /// <summary></summary>
        public Parameter SocialLiveJournalRoles{ get { return GetParam("social-livejournal-roles"); } }

        /// <summary></summary>
        public Parameter SocialBloggerEnabled{ get { return GetParam("social-blogger-enabled"); } }
        /// <summary></summary>
        public Parameter SocialBloggerRoles{ get { return GetParam("social-blogger-roles"); } }

        /// <summary></summary>
        public Parameter SocialOpenIDEnabled{ get { return GetParam("social-openid-enabled"); } }
        /// <summary></summary>
        public Parameter SocialOpenIDRoles { get { return GetParam("social-openid-roles"); } }

        /// <summary></summary>
        public Parameter SocialMyOpenIDEnabled { get { return GetParam("social-myopenid-enabled"); } }
        /// <summary></summary>
        public Parameter SocialMyOpenIDRoles { get { return GetParam("social-myopenid-roles"); } }  

        /// <summary></summary>
        public Parameter LDAPEnabled { get { return GetParam("ldap-enabled"); } }
        /// <summary></summary>
        public Parameter LDAPAddRoleGroup { get { return GetParam("ldap-add-role-group"); } }
        /// <summary></summary>
        public Parameter LDAPPath { get { return GetParam("ldap-path"); } }
        /// <summary></summary>
        public Parameter LDAPAddToRoles { get { return GetParam("ldap-add-to-roles"); } }  
        /// <summary></summary>
        public Parameter LDAPUseOnly { get { return GetParam("ldap-use-only"); } }
        /// <summary>/// </summary>
        public Parameter LDAPDomain { get { return GetParam("ldap-domain"); } }
    }
}
