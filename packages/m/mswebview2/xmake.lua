package("MSWebview2")
    -- MSWebview2 for webview
    set_kind("library")
    set_license("https://www.nuget.org/packages/Microsoft.Web.WebView2/$(version)/License") -- BSD-Style

    add_urls("https://globalcdn.nuget.org/packages/microsoft.web.webview2.$(version).nupkg#dl.zip")
    add_versions("1.0.2151.40", "64091274371a98a7b815dccd31363632f8ecbb08977b9f9119542932733e87e7")
    add_versions("1.0.1518.46", "63020b2d569d09a2098ae1ca20dd4cc281885f794aa00fc8812c6ab52dd49618")

    on_install(function (package)
        os.trymv("build/native/include/*", package:installdir("include"))
    end)
package_end()