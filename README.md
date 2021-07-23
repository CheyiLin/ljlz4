# ljlz4

[![travis-ci status](https://travis-ci.org/CheyiLin/ljlz4.svg?branch=master)](https://travis-ci.org/CheyiLin/ljlz4)

LZ4 library for LuaJIT (FFI Binding)

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
