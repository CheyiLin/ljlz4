local copyright = [[
	ljlz4 - LZ4 library for LuaJIT - https://github.com/CheyiLin/ljlz4

	The MIT License (MIT)

	Copyright (c) 2014-2021 Cheyi Lin <cheyi.lin@gmail.com>

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
]]

local lz4 = require("lz4")

describe("lz4", function ()

	describe("version:", function ()
		it("type", function ()
			assert.is_true(type(lz4.version()) == "number")
		end)
		it("compatibility", function()
			assert.is_true(lz4.version() >= 10300)
		end)
	end)

	describe("compress:", function ()
		it("default", function ()
			assert.is_not_nil(lz4.compress(copyright))
			assert.is_not_nil(lz4.compress(copyright), 1)
		end)
		it("high compression", function ()
			assert.is_not_nil(lz4.compress(copyright, 9))
		end)
		it("handle nil input", function ()
			local ret, errmsg = lz4.compress()
			assert.is_nil(ret)
			assert.is_true(type(errmsg) == "string")
		end)
		it("handle empty string input", function ()
			local ret, errmsg = lz4.compress("")
			assert.is_nil(ret)
			assert.is_true(type(errmsg) == "string")
		end)
	end)

	describe("decompress:", function ()
		it("default", function ()
			assert.is_true(lz4.decompress(lz4.compress(copyright)) == copyright)
			assert.is_true(lz4.decompress(lz4.compress(copyright, 1)) == copyright)
		end)
		it("high compression", function ()
			assert.is_true(lz4.decompress(lz4.compress(copyright, 9)) == copyright)
		end)
		it("handle nil input", function ()
			local ret, errmsg = lz4.decompress()
			assert.is_nil(ret)
			assert.is_true(type(errmsg) == "string")
		end)
		it("handle empty string input", function ()
			local ret, errmsg = lz4.decompress("")
			assert.is_nil(ret)
			assert.is_true(type(errmsg) == "string")
		end)
		it("handle malformed input", function ()
			local ret, errmsg
			ret, errmsg = lz4.decompress("short")
			assert.is_nil(ret)
			assert.is_true(type(errmsg) == "string")
			ret, errmsg = lz4.decompress("longlonglonglong")
			assert.is_nil(ret)
			assert.is_true(type(errmsg) == "string")
		end)
	end)
end)
