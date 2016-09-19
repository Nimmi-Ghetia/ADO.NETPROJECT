using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WDDNProject.Startup))]
namespace WDDNProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
