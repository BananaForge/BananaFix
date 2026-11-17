--[[
  BananaFix - ein BananaForge-Addon der Gilde Tel'Abims Bananenbande
  Ziel: OctoWoW (WoW 1.12 / Lua 5.0)

  Problem:
    OctoWoW hat die TargetFrame.lua von Turtle WoW uebernommen. Diese greift auf
    die globale Tabelle Turtle_ChallengesCache zu, die auf Turtle WoW vom Addon
    Turtle_General angelegt wird. Fehlt dieses Addon, kommt bei jedem Anvisieren:
      TargetFrame.lua:291: attempt to index global 'Turtle_ChallengesCache' (a nil value)

  Loesung:
    BananaFix legt die Tabelle an, falls sie fehlt. Der Zugriff erfolgt zwei
    Ebenen tief, deshalb liefert jeder unbekannte Schluessel eine leere
    Untertabelle zurueck. Ist die Tabelle schon vorhanden, tut BananaFix nichts.
]]

local PREFIX = "|cffffd100Banana|r|cff8b5a2bFix|r: "
local aktiv = false

if not Turtle_ChallengesCache then
  local leer = {}
  Turtle_ChallengesCache = setmetatable({}, {
    __index = function() return leer end
  })
  aktiv = true
end

SLASH_BANANAFIX1 = "/bananafix"
SLASH_BANANAFIX2 = "/bfix"
SlashCmdList["BANANAFIX"] = function()
  if aktiv then
    DEFAULT_CHAT_FRAME:AddMessage(PREFIX .. "aktiv - Turtle_ChallengesCache wurde ersetzt.")
  else
    DEFAULT_CHAT_FRAME:AddMessage(PREFIX .. "nicht noetig - Turtle_ChallengesCache war bereits vorhanden.")
  end
end
