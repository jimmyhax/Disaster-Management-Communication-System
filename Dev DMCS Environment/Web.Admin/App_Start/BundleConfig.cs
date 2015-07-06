using System.Web;
using System.Web.Optimization;

namespace Web.Admin
{
    ///  Bundling and Minification
    ///  http://www.asp.net/mvc/overview/performance/bundling-and-minification


    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            /*
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));
            */

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                    "~/Scripts/modernizr-*",
                    "~/Scripts/respond.js"));
           
            /*
            
             * bundles.Add(new StyleBundle("~/bundles/css").Include(
                    "~/Scripts/plugins/jcrop/jquery.Jcrop.css",
                    "~/Scripts/plugins/pagination/pagination.css",
                    "~/Scripts/plugins/farbtastic/farbtastic.css",
                    "~/Scripts/plugins/farbtastic/gradient.css",
                    "~/Scripts/plugins/bootstrap3-dialog/css/bootstrap-dialog.min.css",
                    "~/Scripts/plugins/slickswitch/css/slickswitch.css",
                    "~/Scripts/plugins/twitterwall/jquery.tweet.css",
                    "~/Scripts/plugins/facebookwall/jquery.neosmart.fb.wall.css"));


            bundles.Add(new ScriptBundle("~/bundles/pluginsstart").Include(
                     "~/Scripts/plugins/jquery/jquery-1.11.1.min.js",
                     "~/Scripts/plugins/jquery/jquery-ui.1.11.2.custom.min.js",
                     "~/Scripts/plugins/text-exapnder/jquery.expander.min.js",
                     "~/Scripts/public/simple.tools.core.js",
                     "~/Scripts/plugins/slickswitch/js/jquery.slickswitch.js",
                     "~/Scripts/plugins/facebookwall/jquery.neosmart.fb.wall.js",
                     "~/Scripts/plugins/twitterwall/jquery.tweet.js"));
            */

            bundles.Add(new ScriptBundle("~/bundles/plugins").Include(
                    "~/Scripts/plugins/bootstrap.3.3.2/bootstrap.min.js",
                    "~/Scripts/plugins/bootstrap3-dialog/js/bootstrap-dialog.min.js",
                    "~/Scripts/plugins/block-ui/jquery.blockUI.js",            
                    "~/Scripts/plugins/jcrop/jquery.Jcrop.min.js",
                    "~/Scripts/plugins/pagination/jquery.pagination.js",
                    "~/Scripts/plugins/farbtastic/farbtastic.js",
                    "~/Scripts/plugins/farbtastic/gradient.color.picker.min.js",
                    "~/Scripts/plugins/ajax-upload/ajaxupload.js",
                    "~/Scripts/plugins/scroll-to/jquery.scrollTo.js"));

            bundles.Add(new ScriptBundle("~/bundles/admin").Include(
                      "~/Scripts/admin/simple.tools.admin.core.js",      
                      "~/Scripts/admin/simple.tools.members.js",
                      "~/Scripts/admin/simple.tools.roles.js",
                      "~/Scripts/admin/simple.tools.audit.js",
                      "~/Scripts/admin/simple.tools.fields.js",
                      "~/Scripts/admin/simple.tools.domains.js"));

            
            // Set EnableOptimizations to false for debugging. For more information,
            // visit http://go.microsoft.com/fwlink/?LinkId=301862
            BundleTable.EnableOptimizations = true;
        }
    }
}
