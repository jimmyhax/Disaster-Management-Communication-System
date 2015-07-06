using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Web.App.Startup))]
namespace Web.App
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
