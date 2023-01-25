# webview-xmake

Build shared binary libs for [webview](https://github.com/webview/webview) using [xmake](https://xmake.io). Also a xmake package for [webview](https://github.com/webview/webview).

## Supported Platforms

|        | Windows | Linux | macOS |
| ------ | ------- | ----- | ----- |
| x86_64 | ✔      | ✔    | ✔    |
| arm64  | ✔      | ✔    | ✔    |
| x86_32 | ✔      |       | -     |

## Usage

### Build Locally

See `.github/workflows/binary-build.yml` for detailed build steps.

For example, build for Windows x64:

```shell
cd source
xmake f -p windows -a x64 -m release -P .
xmake build -P . webview
```

### Use xmake package

#### Quick start

1. Create a xmake project

```shell
xmake create myproject
cd myproject
```

2. Modify the `xmake.lua` in your project

```lua
add_repositories("webview-xmake https://github.com/Winterreisender/webview-xmake.git")
add_requires("webview")
if is_plat("linux") then
    add_requires("pkgconfig::gtk+-3.0", "pkgconfig::webkit2gtk-4.0", {system = true})
end

target("myproject")
    set_kind("binary")
    set_languages("c++17")
    add_packages("webview")
    add_files("src/test.cpp")
    if is_plat("linux") then
        add_packages("pkgconfig::gtk+-3.0")
        add_packages("pkgconfig::webkit2gtk-4.0")
    end
    if is_plat("macosx") then
        set_languages("c++11")
        add_frameworks("WebKit")
    end
target_end()
```

3. Write your code in `src/main.cpp`

```c++
#include "webview.h"
int main() {
    webview::webview w(false, nullptr);
    w.set_title("Example");
    w.navigate("https://example.com");
    w.run();
    return 0;
}
```

4. Build and run

```shell
xmake -P .
xmake run
```

You can find the example in [example/myproject](example/myproject).

## Credits

| Project                                                                   | License                                                                             |
| ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| [xmake](https://xmake.io)                                                    | [Apache-2.0](https://github.com/xmake-io/xmake/blob/master/LICENSE.md)                 |
| [webview](https://github.com/webview/webview)                                | [MIT](https://github.com/webview/webview/blob/master/LICENSE)                          |
| [Microsoft Webview2](https://www.nuget.org/packages/Microsoft.Web.WebView2/) | [BSD-style](https://www.nuget.org/packages/Microsoft.Web.WebView2/1.0.1245.22/License) |

## License

```
Copyright 2023 Winterreisender

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
