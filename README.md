# libao for Visual Studio

Building [libao](https://www.xiph.org/ao/)(libao.lib & libao.dll) with Visual Stduio.(Output: WMM or NULL only.)

## Requirement

- Visual Studio(tested on VS2022)
- Git for Windows(bash/curl/find/patch/etc...)


## Build

download & patch files.

```.text
 $ git clone https://github.com/stkchp/libao-windows.git
 $ cd libao-windows
 $ ./prepare.sh
```

open `windows/VS20XX/libao.sln` with Visual Stduio & build.


## Usage

header files.

```.text
build/ao/ao.h
build/ao/ao_private.h
build/ao/os_types.h
```

lib & dll files.

```.text
windows/VS20XX/(Debug/Release)/libao.dll
windows/VS20XX/(Debug/Release)/libao.lib
```

