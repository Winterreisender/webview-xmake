package("webview")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/webview/webview")
    set_description("Tiny cross-platform webview library for C/C++.")
    set_license("MIT")

    set_urls("https://github.com/webview/webview.git")

    -- Add new versions ABOVE
    add_versions("0.11.0.231117", "53ea174ce79ca2f52e28dd51d49052aebce3f4c5")
    add_versions("0.10.0.230210", "7b40e46d97e953a426ff553f92f2cc901cbf8bf9")
    add_versions("0.10.0.230202", "14f8e24a873c7e8deb2b1dd29c8e5841529fe467")
    
    if is_plat("windows") or is_plat("mingw") then
        add_deps("MSWebview2 1.0.2151.40")
    end
    
    on_install(function (package)
        os.trymv("*.h",   package:installdir("include") )
    end)

    on_test(function (package)
        -- assert(package:has_cfuncs("webview_create", {includes = "webview.h"}))
    end)

package_end()