add_repositories("webview-xmake webview-xmake-repo")

add_requires("webview 0.10.0")
if is_plat("linux") then
    add_requires("pkgconfig::gtk+-3.0", "pkgconfig::webkit2gtk-4.0", {system = true})
end

-- Build shared libs
target("libwebview")
    set_kind("shared")
    set_languages("c++17")
    add_packages("webview")
    
    if is_plat("linux") then
        add_packages("pkgconfig::gtk+-3.0")
        add_packages("pkgconfig::webkit2gtk-4.0")
    end

    if is_plat("windows") then
        add_cxxflags("/EHsc")
        add_defines("WEBVIEW_API=__declspec(dllexport)")
    end

    if is_plat("macosx") then
        set_languages("c++11")
        add_frameworks("WebKit")
    end

    add_files("src/webview.cpp")
    set_optimize("fast")
target_end()

-- build executable programs
target("webview_test")
    set_kind("binary")
    set_languages("c++17")
    add_packages("webview")

    if is_plat("linux") then
        add_packages("pkgconfig::gtk+-3.0")
        add_packages("pkgconfig::webkit2gtk-4.0")
    end

    if is_plat("macosx") then
        set_languages("c++11")
        add_frameworks("WebKit")
    end

    add_files("src/test.cpp")
target_end()
