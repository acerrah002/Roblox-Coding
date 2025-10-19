local Players = game:GetService("Players")

local goldChunk = script.Parent

local function onPartTouch(otherPart)
	local partParent = otherPart.Parent
	local player = Players:GetPlayerFromCharacter(partParent)
	local leaderstats = player and player:FindFirstChild("leaderstats")
	local goldStat = leaderstats and leaderstats:FindFirstChild("Gold")

	if goldStat then
		-- Destroy the pickup
		goldChunk:Destroy()

		-- Update the player's leaderboard stat
		goldStat.Value += math.random(5,20)
	end
end

goldChunk.Touched:Connect(onPartTouch)
