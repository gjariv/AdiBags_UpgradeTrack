local _, addon = ...
local L = addon.L
local trackIds = addon.trackIds
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

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
    local upgradeID = itemLinkValues[14 + i]
		if upgradeID == nil then
			return
		end
        if trackIds[upgradeID] ~= nil then
            return trackIds[upgradeID], L["Equipment"]
        end
	end
  return nil
end

function filter:GetOptions()
    return {}, AdiBags:GetOptionHandler(self, true, function() return self:Update() end)
end
