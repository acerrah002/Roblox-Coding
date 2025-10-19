local module = {}
function module.BasicEnemyAI(parent,damage)
	local NPC = parent
	local HumanoidRootPart = NPC.HumanoidRootPart

	local MaxDistance = math.huge
	local debounce = false

	NPC.Humanoid.Touched:Connect(function(hit)
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if player and not debounce then
			debounce = true
			hit.Parent.Humanoid.Health -= damage
			wait(3)
			debounce = false
		end
	end)

	while wait() do
		local Players = game.Players:GetPlayers()
		local closest

		for i, plr in Players do
			if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
				local PlayerHumanoidRootPart = plr.Character.HumanoidRootPart
				local Distance = (HumanoidRootPart.Position - PlayerHumanoidRootPart.Position).Magnitude

				if not closest then
					closest = PlayerHumanoidRootPart
				end

				if (HumanoidRootPart.Position - closest.Position).Magnitude > Distance then
					closest = PlayerHumanoidRootPart
				end
			end
		end

		if closest and (HumanoidRootPart.Position - closest.Position).Magnitude <= MaxDistance then
			NPC.Humanoid:MoveTo(closest.Position)
		end
	end
end
return module
