local shrine = script.Parent
local enemies = game.Workspace.Enemies:GetChildren()
local RandomEnemies = enemies[math.random(1, #enemies)]

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
	if not RandomEnemies then
		warn("Enemy template not found in Enemy Folder!")
		return
	end

	local shrineCFrame = shrine:GetPivot()
	-- Calculate positions 5 studs away, separated by 5 studs along X axis
	local offsets = {
		Vector3.new(-5, 0, 0),
		Vector3.new(0, 0, 5),
		Vector3.new(5, 0, 0),
	}

	for i = 1, #offsets do
		local clone = RandomEnemies:Clone()
		-- Unanchor all parts in the clone
		for k, v in clone:GetDescendants() do
			if v:IsA("BasePart") then
				v.Anchored = false
			end
		end
		local spawnCFrame = shrineCFrame + offsets[i]
		clone:PivotTo(spawnCFrame)
		clone.Parent = workspace.Enemies
	end
	--This adds a random enemy to the shrine
	RandomEnemies = enemies[math.random(1, #enemies)]
	--shrine:Destroy()
end

prompt.Triggered:Connect(spawnEnemy)
