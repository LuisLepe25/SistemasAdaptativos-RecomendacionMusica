using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RecomendacionMusicaZuquistrukis.Startup))]
namespace RecomendacionMusicaZuquistrukis
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
