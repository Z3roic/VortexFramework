local Vortex = {}

Vortex.Workspace = game:GetService("Workspace")
Vortex.Players = game:GetService("Players")
Vortex.StarterPlayer = game:GetService("StarterPlayer")
Vortex.ServerScriptService = game:GetService("ServerScriptService")
Vortex.RemoteEvents = game:GetService("RemoteEvents")
Vortex.Lighting = game:GetService("Lighting")

function Vortex.GetRemote(name)
    return Vortex.RemoteEvents:FindFirstChild(name)
end

function Vortex.GetPlayers()
    return Vortex.Players:GetPlayers()
end

return Vortex
