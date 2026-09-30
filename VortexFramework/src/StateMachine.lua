local StateMachine = {}
StateMachine.__index = StateMachine

function StateMachine.new(initial)
    return setmetatable({Current = initial, States = {}, Changed = nil}, StateMachine)
end

function StateMachine:Add(name, enter, exit)
    self.States[name] = {Enter = enter, Exit = exit}
end

function StateMachine:Set(name, ...)
    if self.Current == name then return end
    local old = self.States[self.Current]
    if old and old.Exit then old.Exit(...) end
    self.Current = name
    local new = self.States[name]
    if new and new.Enter then new.Enter(...) end
    if self.Changed then self.Changed(name) end
end

return StateMachine
