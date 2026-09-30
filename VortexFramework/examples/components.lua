local Component = require(script.Parent.Parent.src.Component)

local Health = Component.new("Health")

Health:Attach(workspace, {
    Value = 100,
    Max = 100
})

return Health
