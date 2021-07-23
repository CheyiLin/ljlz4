# ljlz4

[![ci-dev](https://github.com/CheyiLin/ljlz4/actions/workflows/ci-dev.yml/badge.svg)](https://github.com/CheyiLin/ljlz4/actions/workflows/ci-dev.yml)

LZ4 library for LuaJIT (FFI Binding)

## Compatibility

| Version | [LuaJIT 2.0](https://luajit.org/luajit.html) | [LuaJIT 2.1 (OpenResty)](https://github.com/openresty/luajit2) |
| ---------- | ------- | ------- |
| lz4 v1.9.3 | &check; | &check; |
| lz4 v1.8.3 | &check; | &check; |
| lz4 v1.7.5 | &check; | &check; |
| lz4 r131 | &check; | &check; |

## Usage

### Overview

```lua
local lz4 = require("lz4")
local data = "hello lz4"
local errmsg, compressed_data, decompressed_data
compressed_data, errmsg = lz4.compress(data)
decompressed_data, errmsg = lz4.decompress(compressed_data)
assert(decompressed_data == data)
```

### Compression

```lua
local compressed_data, errmsg = lz4.compress(data, compression_level)
```

### Decompression

```lua
local decompressed_data, errmsg = lz4.decompress(compressed_data)
```

## License

Copyright (c) 2014-2021 Cheyi Lin.
MIT licensed. See LICENSE for details.
