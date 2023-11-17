add_repositories("webview-xmake ..")

add_requires("webview")
if is_plat("linux") then
    add_requires("pkgconfig::gtk+-3.0", "pkgconfig::webkit2gtk-4.0", {system = true})
end

target("webview")
    set_kind("shared")
    set_languages("c++17")
    add_packages("webview")
    add_defines("WEBVIEW_BUILD_SHARED")

    
    if is_plat("linux") then
        add_packages("pkgconfig::gtk+-3.0")
        add_packages("pkgconfig::webkit2gtk-4.0")
    end

    if is_plat("windows") then
        add_cxxflags("/EHsc")
        add_defines("WEBVIEW_API=__declspec(dllexport)")
    end

    if is_plat("mingw") then 
        add_links("advapi32","ole32","shell32","shlwapi","user32","version")
    end

    if is_plat("macosx") then
        set_languages("c++11")
        add_frameworks("WebKit")
    end

    add_files("src/webview.cpp")
    set_optimize("fast")
target_end()

target("webview_static")
    set_kind("static")
    set_languages("c++17")
    add_packages("webview")
    add_defines("WEBVIEW_STATIC")
    
    if is_plat("linux") then
        add_packages("pkgconfig::gtk+-3.0")
        add_packages("pkgconfig::webkit2gtk-4.0")
    end

    if is_plat("windows") then
    end

    if is_plat("mingw") then 
        add_links("advapi32","ole32","shell32","shlwapi","user32","version")
    end

    if is_plat("macosx") then
        set_languages("c++11")
        add_frameworks("WebKit")
    end

    add_files("src/webview.cpp")
    set_optimize("fast")
target_end()