local _, addon = ...
local L = addon.L
-- local string_find = string.find
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local trackIDs = {}
    trackIDs["9536"] = L["Adventurer"]
    trackIDs["9537"] = L["Adventurer"]
    trackIDs["9538"] = L["Adventurer"]
    trackIDs["9539"] = L["Adventurer"]
    trackIDs["9540"] = L["Adventurer"]
    trackIDs["9541"] = L["Adventurer"]
    trackIDs["9542"] = L["Adventurer"]
    trackIDs["9543"] = L["Adventurer"]
    trackIDs["9544"] = L["Explorer"]
    trackIDs["9545"] = L["Explorer"]
    trackIDs["9546"] = L["Explorer"]
    trackIDs["9547"] = L["Explorer"]
    trackIDs["9548"] = L["Explorer"]
    trackIDs["9549"] = L["Explorer"]
    trackIDs["9550"] = L["Explorer"]
    trackIDs["9551"] = L["Explorer"]
    trackIDs["9552"] = L["Veteran"]
    trackIDs["9553"] = L["Veteran"]
    trackIDs["9554"] = L["Veteran"]
    trackIDs["9555"] = L["Veteran"]
    trackIDs["9556"] = L["Veteran"]
    trackIDs["9557"] = L["Veteran"]
    trackIDs["9558"] = L["Veteran"]
    trackIDs["9559"] = L["Veteran"]
    trackIDs["9560"] = L["Champion"]
    trackIDs["9561"] = L["Champion"]
    trackIDs["9562"] = L["Champion"]
    trackIDs["9563"] = L["Champion"]
    trackIDs["9564"] = L["Champion"]
    trackIDs["9565"] = L["Champion"]
    trackIDs["9566"] = L["Champion"]
    trackIDs["9567"] = L["Champion"]
    trackIDs["9568"] = L["Hero"]
    trackIDs["9569"] = L["Hero"]
    trackIDs["9570"] = L["Hero"]
    trackIDs["9571"] = L["Hero"]
    trackIDs["9572"] = L["Hero"]
    trackIDs["9581"] = L["Hero"]
    trackIDs["9573"] = L["Myth"]
    trackIDs["9574"] = L["Myth"]
    trackIDs["9575"] = L["Myth"]
    trackIDs["9576"] = L["Myth"]
    trackIDs["9577"] = L["Myth"]
    trackIDs["9578"] = L["Myth"]


-- The filter itself

local filter = AdiBags:RegisterFilter("UpgradeTrack", 92, 'ABEvent-1.0')
filter.uiName = L['Upgrade Track']
filter.uiDesc = L['Put items with an Upgrade Track in their own sections.']

function filter:OnInitialize()
  self.db = AdiBags.db:RegisterNamespace('UpgradeTrack', {
    profile = {  },
    char = {  },
  })
end

function filter:Update()
  self:SendMessage('AdiBags_FiltersChanged')
end

function filter:OnEnable()
  AdiBags:UpdateFilters()
end

function filter:OnDisable()
  AdiBags:UpdateFilters()
end

function filter:Filter(slotData)
  local itemLinkValues = StringSplitIntoTable(":", slotData.link)
  local numBonusIDs = tonumber(itemLinkValues[14])

	if not numBonusIDs then return end

	for i = 1, numBonusIDs do
		-- local upgradeID = tonumber(itemLinkValues[14 + i])
        local upgradeID = itemLinkValues[14 + i]
		if upgradeID == nil then
			return
		end
        if trackIDs[upgradeID] ~= nil then
            return trackIDs[upgradeID], L["Equipment"]
        end

		-- if upgradeID >= 9544 and upgradeID <= 9551 then
		-- 	return L["Explorer"], L["Equipment"]
		-- elseif upgradeID >= 9536 and upgradeID <= 9543 then
		-- 	return L["Adventurer"], L["Equipment"]
		-- elseif upgradeID >= 9552 and upgradeID <= 9559 then
		-- 	return L["Veteran"], L["Equipment"]
		-- elseif upgradeID >= 9560 and upgradeID <= 9567 then
		-- 	return L["Champion"], L["Equipment"]
		-- elseif upgradeID >= 9568 and upgradeID <= 9572 or upgradeID == 9581 then -- hero is gross
		-- 	return L["Hero"], L["Equipment"]
		-- elseif upgradeID >= 9573 and upgradeID <= 9576 then
		-- 	return L["Myth"], L["Equipment"]
		-- end
	end
  return nil
end

function filter:GetOptions()
  return {}, AdiBags:GetOptionHandler(self, true, function() return self:Update() end)
end
