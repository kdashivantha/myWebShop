using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(myWebShop.Startup))]
namespace myWebShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
