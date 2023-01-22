# webview-xmake

Build shared binary libs for [webview](https://github.com/webview/webview) using [xmake](https://xmake.io). Also a xmake package for [webview](https://github.com/webview/webview).

## Supported Platforms

|        | Windows | Linux | macOS |
| ------ | ------- | ----- | ----- |
| x64    | ✔      | ✔    | ✔    |
| arm64  | ✔      | ✔    | ✔    |
| x86_32 | ✔      |       | -     |

## Usage

### Build with GitHub Actions

1. Edit the `add_versions` of  `xmake.lua`
2. Push
3. See GitHub Actions

### Build Locally

See `.github/workflows/binary-build.yml` for detailed build steps.

For example, build for Windows x64:

```shell
xmake f -p windows -a x64 -m release
xmake build webview_shared
```

### Use xmake package

We're still trying to understand how xmake work with packages, currently you can just copy `xmake.lua` and `src`folder, then build with

```shell
xmake build webview_test
```

If you want to modify the build steps, see `target("webview_test")` in `xmake.lua`

## Credits


| Project | License  |
| --- | --- |
| [xmake](https://xmake.io)| [Apache-2.0](https://github.com/xmake-io/xmake/blob/master/LICENSE.md) |
| [webview](https://github.com/webview/webview) | [MIT](https://github.com/webview/webview/blob/master/LICENSE) |
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
