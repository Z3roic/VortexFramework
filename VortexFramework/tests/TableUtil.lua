local TableUtil = require(script.Parent.Parent.src.TableUtil)
local result = TableUtil.Merge({a = 1}, {b = 2})
assert(result.a == 1 and result.b == 2, "TableUtil test failed")
