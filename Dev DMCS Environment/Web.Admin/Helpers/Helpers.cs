using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Text.RegularExpressions;
using System.Collections;

namespace Web.Admin.Helpers
{
    public static class Renders
    {
        public static string RenderPartialView(this Controller controller, string viewName, object model)
        {
            if (string.IsNullOrEmpty(viewName))
                viewName = controller.ControllerContext.RouteData.GetRequiredString("action");

            controller.ViewData.Model = model;
            using (var sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(controller.ControllerContext, viewName);
                var viewContext = new ViewContext(controller.ControllerContext, viewResult.View, controller.ViewData, controller.TempData, sw);
                viewResult.View.Render(viewContext, sw);

                return sw.GetStringBuilder().ToString();
            }
        }
    }

    public static class Extensions
    {
        public static string ToRelativeTime(this DateTime date)
        {
            int Minute = 60;
            int Hour = Minute * 60;
            int Day = Hour * 24;
            int Year = Day * 365;

            var thresholds = new Dictionary<long, Func<TimeSpan, string>>
                {
                    {2, t => "a second ago"},
                    {Minute,  t => String.Format("{0} seconds ago", (int)t.TotalSeconds)},
                    {Minute * 2,  t => "a minute ago"},
                    {Hour,  t => String.Format("{0} minutes ago", (int)t.TotalMinutes)},
                    {Hour * 2,  t => "an hour ago"},
                    {Day,  t => String.Format("{0} hours ago", (int)t.TotalHours)},
                    {Day * 2,  t => "yesterday"},
                    {Day * 30,  t => String.Format("{0} days ago", (int)t.TotalDays)},
                    {Day * 60,  t => "last month"},
                    {Year,  t => String.Format("{0} months ago", (int)t.TotalDays / 30)},
                    {Year * 2,  t => "last year"},
                    {Int64.MaxValue,  t => String.Format("{0} years ago", (int)t.TotalDays / 365)}
                };
            var difference = DateTime.UtcNow - date.ToUniversalTime();
            return thresholds.First(t => difference.TotalSeconds < t.Key).Value(difference);

        }

        public static string ReplaceEx(string original, string pattern, string replacement)
        {
            int count, position0, position1;
            count = position0 = position1 = 0;
            string upperString = original.ToUpper();
            string upperPattern = pattern.ToUpper();
            int inc = (original.Length / pattern.Length) *
                      (replacement.Length - pattern.Length);
            char[] chars = new char[original.Length + Math.Max(0, inc)];
            while ((position1 = upperString.IndexOf(upperPattern,position0)) != -1)
            {
                for (int i = position0; i < position1; ++i)
                    chars[count++] = original[i];
                for (int i = 0; i < replacement.Length; ++i)
                    chars[count++] = replacement[i];
                position0 = position1 + pattern.Length;
            }
            if (position0 == 0) return original;
            for (int i = position0; i < original.Length; ++i)
                chars[count++] = original[i];
            return new string(chars, 0, count);
        }

        public static IEnumerable IndexOfAll(this string haystack, string needle)
        {
            int pos, offset = 0;
            while ((pos = haystack.IndexOf(needle)) > 0)
            {
                haystack = haystack.Substring(pos + needle.Length);
                offset += pos;
                yield return offset;
            }
        }

        public static void ReplaceBAckground(string source, string search)
        {
            foreach (int Pos in source.IndexOfAll(search))
            { 
                
            }
                
        }
    }
}