local Serialization = require(script.Parent.Parent.src.Serialization)
local source = {name = "Vortex", nested = {enabled = true}}
local decoded = Serialization.Decode(Serialization.Encode(source))
assert(decoded.name == "Vortex", "Serialization test failed")
assert(decoded.nested.enabled == true, "Serialization nested test failed")
