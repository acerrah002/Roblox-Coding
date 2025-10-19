local HideEntitiesNames = {}

function HideEntitiesNames.active(parent)
	local person = parent
	local humanoid = person:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
	end
end

return HideEntitiesNames
