add_repositories("webview-xmake https://github.com/Winterreisender/webview-xmake.git")

add_requires("webview 20230123")
if is_plat("linux") then
    add_requires("pkgconfig::gtk+-3.0", "pkgconfig::webkit2gtk-4.0", {system = true})
end

target("myproject")
    set_kind("binary")
    set_languages("c++17")
    add_packages("webview")
    add_files("src/main.cpp")

    if is_plat("linux") then
        add_packages("pkgconfig::gtk+-3.0")
        add_packages("pkgconfig::webkit2gtk-4.0")
    end

    if is_plat("macosx") then
        set_languages("c++11")
        add_frameworks("WebKit")
    end
target_end()