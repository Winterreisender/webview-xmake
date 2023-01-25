package("webview")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/webview/webview")
    set_description("Tiny cross-platform webview library for C/C++.")
    set_license("MIT")

    set_urls("https://github.com/webview/webview.git")
    add_versions("0.10.0.230125", "14f8e24a873c7e8deb2b1dd29c8e5841529fe467")
    
    if is_plat("windows") then
        add_deps("MSWebview2 1.0.1518.46")
    end
    
    on_install(function (package)
        os.trymv("*.h",   package:installdir("include") )
    end)

    on_test(function (package)
        -- assert(package:has_cfuncs("webview_create", {includes = "webview.h"}))
    end)
package_end()