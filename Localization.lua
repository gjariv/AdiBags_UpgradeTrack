local _, addon = ...

local _G = _G
local GetLocale = _G.GetLocale
local pairs = _G.pairs
local rawset = _G.rawset
local setmetatable = _G.setmetatable
local tostring = _G.tostring
--GLOBALS>

local L =
    setmetatable(
    {},
    {
        __index = function(self, key)
            if key ~= nil then
                rawset(self, key, tostring(key))
            end
            return tostring(key)
        end
    }
)
addon.L = L

L["1"] = "Explorer"
L["2"] = "Adventurer"
L["3"] = "Veteran"
L["4"] = "Champion"
L["5"] = "Hero"
L["6"] = "Myth"

local locale = GetLocale()

if locale == "enUS" or LOCALE == "enCN" or LOCALE == "enGB" or LOCALE == "enTW" then
    L["1"] = "Explorer"
    L["2"] = "Adventurer"
    L["3"] = "Veteran"
    L["4"] = "Champion"
    L["5"] = "Hero"
    L["6"] = "Myth"
elseif LOCALE == "deDE" then
    L["1"] = "Forscher"
    L["2"] = "Abenteurer"
    L["3"] = "Veteran"
    L["4"] = "Champion"
    L["5"] = "Held"
    L["6"] = "Mythos"
elseif LOCALE == "esES" or LOCALE == "esMX" then
    L["1"] = "Expedicionario"
    L["2"] = "Aventurero"
    L["3"] = "Veterano"
    L["4"] = "Campeón"
    L["5"] = "Héroe"
    L["6"] = "Mito"
elseif LOCALE == "frFR" then
    L["1"] = "Explorateur"
    L["2"] = "Aventurier"
    L["3"] = "Vétéran"
    L["4"] = "Champion"
    L["5"] = "Héros"
    L["6"] = "Mythe"
elseif LOCALE == "itIT" then
    L["1"] = "Esploratore"
    L["2"] = "Avventuriero"
    L["3"] = "Veterano"
    L["4"] = "Campione"
    L["5"] = "Eroe"
    L["6"] = "Mito"
elseif LOCALE == "ptBR" then
    L["1"] = "Explorador"
    L["2"] = "Aventureiro"
    L["3"] = "Veterano"
    L["4"] = "Campeão"
    L["5"] = "Herói"
    L["6"] = "Mito"
elseif LOCALE == "ruRU" then
    L["1"] = "Исследователь"
    L["2"] = "Искатель приключений"
    L["3"] = "Ветеран"
    L["4"] = "Защитник"
    L["5"] = "Герой"
    L["6"] = "Легенда"
elseif LOCALE == "koKR" then
    L["1"] = "탐험가"
    L["2"] = "모험가"
    L["3"] = "노련가"
    L["4"] = "챔피언"
    L["5"] = "영웅"
    L["6"] = "신화"
elseif LOCALE == "zhCN" then
    L["1"] = "探索者"
    L["2"] = "冒险者"
    L["3"] = "老兵"
    L["4"] = "勇士"
    L["5"] = "英雄"
    L["6"] = "神话"
elseif LOCALE == "zhTW" then
    L["1"] = "探索者"
    L["2"] = "冒险者"
    L["3"] = "老兵"
    L["4"] = "勇士"
    L["5"] = "英雄"
    L["6"] = "神話"
end
