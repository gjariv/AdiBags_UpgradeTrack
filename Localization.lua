local _, addon = ...

local _G = _G
local GetLocale = _G.GetLocale
local pairs = _G.pairs
local rawset = _G.rawset
local setmetatable = _G.setmetatable
local tostring = _G.tostring
--GLOBALS>

local L = setmetatable({}, {
	__index = function(self, key)
		if key ~= nil then
			rawset(self, key, tostring(key))
		end
		return tostring(key)
	end,
})
addon.L = L

L["Explorer"] = "Explorer"
L["Adventurer"] = "Adventurer"
L["Veteran"] = "Veteran"
L["Champion"] = "Champion"
L["Hero"] = "Hero"
L["Myth"] = "Myth"

local locale = GetLocale()

if locale == "enUS" or LOCALE == "enCN" or LOCALE == "enGB" or LOCALE == "enTW" then

L["Explorer"] = "Explorer"
L["Adventurer"] = "Adventurer"
L["Veteran"] = "Veteran"
L["Champion"] = "Champion"
L["Hero"] = "Hero"
L["Myth"] = "Myth"


elseif LOCALE == "deDE" then


L["Explorer"] = "Forscher"
L["Adventurer"] = "Abenteurer"
L["Veteran"] = "Veteran"
L["Champion"] = "Champion"
L["Hero"] = "Held"
L["Myth"] = "Mythos"


elseif LOCALE == "esES" or LOCALE == "esMX" then


L["Explorer"] = "Expedicionario"
L["Adventurer"] = "Aventurero"
L["Veteran"] = "Veterano"
L["Champion"] = "Campeón"
L["Hero"] = "Héroe"
L["Myth"] = "Mito"


elseif LOCALE == "frFR" then


L["Explorer"] = "Explorateur"
L["Adventurer"] = "Aventurier"
L["Veteran"] = "Vétéran"
L["Champion"] = "Champion"
L["Hero"] = "Héros"
L["Myth"] = "Mythe"


elseif LOCALE == "itIT" then


L["Explorer"] = "Esploratore"
L["Adventurer"] = "Avventuriero"
L["Veteran"] = "Veterano"
L["Champion"] = "Campione"
L["Hero"] = "Eroe"
L["Myth"] = "Mito"


elseif LOCALE == "ptBR" then


L["Explorer"] = "Explorador"
L["Adventurer"] = "Aventureiro"
L["Veteran"] = "Veterano"
L["Champion"] = "Campeão"
L["Hero"] = "Herói"
L["Myth"] = "Mito"


elseif LOCALE == "ruRU" then


L["Explorer"] = "Исследователь"
L["Adventurer"] = "Искатель приключений"
L["Veteran"] = "Ветеран"
L["Champion"] = "Защитник"
L["Hero"] = "Герой"
L["Myth"] = "Легенда"


elseif LOCALE == "koKR" then


L["Explorer"] = "탐험가"
L["Adventurer"] = "모험가"
L["Veteran"] = "노련가"
L["Champion"] = "챔피언"
L["Hero"] = "영웅"
L["Myth"] = "신화"


elseif LOCALE == "zhCN" then


L["Explorer"] = "探索者"
L["Adventurer"] = "冒险者"
L["Veteran"] = "老兵"
L["Champion"] = "勇士"
L["Hero"] = "英雄"
L["Myth"] = "神话"


elseif LOCALE == "zhTW" then


L["Explorer"] = "探索者"
L["Adventurer"] = "冒险者"
L["Veteran"] = "老兵"
L["Champion"] = "勇士"
L["Hero"] = "英雄"
L["Myth"] = "神話"


end
