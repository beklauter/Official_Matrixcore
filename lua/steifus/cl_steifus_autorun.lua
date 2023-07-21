if (SERVER) then return end

local prefix = "[Core] | -->"

local function NotifyPrefix()
    MsgC(Color(255, 217, 0), prefix .. " ")
end

net.Receive("Core:Notify", function()
    local msg = net.ReadString()
    local color = net.ReadColor()

    NotifyPrefix()
    MsgC(color, msg .. "\n")
end)