local Signal = require(script.Parent.Parent.src.Signal)
local signal = Signal.new()
local value = false
signal:Connect(function(input) value = input end)
signal:Fire(true)
assert(value == true, "Signal test failed")
