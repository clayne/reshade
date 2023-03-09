# ReShade CN

ReShade CN 是基于 ReShade 修改的汉化版，并倾向于《最终幻想14》而优化。

## 更新说明

### v0.1.0

**此版本为测试版！！可能会有 BUG！！**
**此版本仅为 ReShade CN 的安装程序，不包含任何着色器与预设！可以在安装程序中选择安装 ReShade 官方提供的预设与着色器。**
**推荐使用前先熟悉 ReShade 的使用，如已有使用的其他 ReShade 版本，请先备份着色器/预设后再卸载已有版本安装。**

主要功能：
 - 将 UI 修改为支持多语言，默认为中文界面。
 - 支持在游戏内界面的设置中增加 “语言” 选择，游戏内可切换语言，现支持中文与英文。
 - 移除了深度缓存限制，能让需要深度缓存的着色器正常工作。

多语言机制：
安装 ReShade CN 后，会在安装文件夹生成一个 `Language.ini` 文件，里面包含了 UI 的不同语言文本。修改此文件可以改变UI文本内容。

**如果没有这个文件，程序可能会崩溃！**

默认会尝试使用 Windows 系统自带的"黑体"作为字体，如果没有找到，则会切换回英文，需要自己手动设置中文字体。

使用的字符集包含 UI 与 Lilidream 翻译的汉化着色器所需的中文字符。



ReShade
=======

This is a generic post-processing injector for games and video software. It exposes an automated way to access both frame color and depth information and a custom shader language called ReShade FX to write effects like ambient occlusion, depth of field, color correction and more which work everywhere.

ReShade can optionally load **add-ons**, DLLs that make use of the ReShade API to extend functionality of both ReShade and/or the application ReShade is being applied to. To get started on how to write your own add-on, check out the [API reference](REFERENCE.md).

The ReShade FX shader compiler contained in this repository is standalone, so can be integrated into other projects as well. Simply add all `source/effect_*.*` files to your project and use it similar to the [fxc example](tools/fxc.cpp).

## Building

You'll need Visual Studio 2017 or higher to build ReShade and Python for the `gl3w` dependency.

1. Clone this repository including all Git submodules\
```git clone --recurse-submodules https://github.com/crosire/reshade```
2. Open the Visual Studio solution
3. Select either the `32-bit` or `64-bit` target platform and build the solution.\
   This will build ReShade and all dependencies. To build the setup tool, first build the `Release` configuration for both `32-bit` and `64-bit` targets and only afterwards build the `Release Setup` configuration (does not matter which target is selected then).

A quick overview of what some of the source code files contain:

|File                                                                  |Description                                                            |
|----------------------------------------------------------------------|-----------------------------------------------------------------------|
|[dll_log.cpp](source/dll_log.cpp)                                     |Simple file logger implementation                                      |
|[dll_main.cpp](source/dll_main.cpp)                                   |Main entry point (and optional test application)                       |
|[dll_resources.cpp](source/dll_resources.cpp)                         |Access to DLL resource data (e.g. built-in shaders)                    |
|[effect_lexer.cpp](source/effect_lexer.cpp)                           |Lexical analyzer for C-like languages                                  |
|[effect_parser.cpp](source/effect_parser.cpp)                         |Parser for the ReShade FX shader language                              |
|[effect_preprocessor.cpp](source/effect_preprocessor.cpp)             |C-like preprocessor implementation                                     |
|[hook.cpp](source/hook.cpp)                                           |Wrapper around MinHook which tracks associated function pointers       |
|[hook_manager.cpp](source/hook_manager.cpp)                           |Automatic hook installation based on DLL exports                       |
|[input.cpp](source/input.cpp)                                         |Keyboard and mouse input management and window message queue hooks     |
|[runtime.cpp](source/runtime.cpp)                                     |Core ReShade runtime including effect and preset management            |
|[runtime_gui.cpp](source/runtime_gui.cpp)                             |Overlay rendering and everything user interface related                |

## Contributing

Any contributions to the project are welcomed, it's recommended to use GitHub [pull requests](https://help.github.com/articles/using-pull-requests/).

## Feedback and Support

See the [ReShade Forum](https://reshade.me/forum) and [Discord](https://discord.gg/PrwndfH) server for feedback and support.

## License

ReShade is licensed under the terms of the [BSD 3-clause license](LICENSE.md).\
Some source code files are dual-licensed and are also available under the terms of the MIT license, when stated as such at the top of those files.



