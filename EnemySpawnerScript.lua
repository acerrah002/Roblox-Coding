local shrine = script.Parent
local enemies = workspace.EnemyandMobspawner.Zombie


-- Ensure ProximityPrompt exists
local prompt = shrine:FindFirstChildOfClass("ProximityPrompt")
if not prompt then
	prompt = Instance.new("ProximityPrompt")
	prompt.Name = "Shrine"
	prompt.ActionText = "Press 'E'"
	prompt.ObjectText = "Shrine"
	prompt.KeyboardKeyCode = Enum.KeyCode.E
	prompt.HoldDuration = 1
	prompt.Parent = shrine
end

local function spawnEnemy()
	local shrineCFrame = shrine:GetPivot()
	-- Calculate positions 5 studs away, separated by 5 studs along X axis
	local offsets = {
		Vector3.new(-5, 0, 0),
		Vector3.new(0, 0, 5),
		Vector3.new(5, 0, 0),
	}

	for i = 1, #offsets do
		local clone = enemies:Clone()
		-- Unanchor all parts in the clone
		for k, v in clone:GetDescendants() do
			if v:IsA("BasePart") then
				v.Anchored = false
			end
		end
		local spawnCFrame = shrineCFrame + offsets[i]
		clone:PivotTo(spawnCFrame)
	end
end

prompt.Triggered:Connect(spawnEnemy)
