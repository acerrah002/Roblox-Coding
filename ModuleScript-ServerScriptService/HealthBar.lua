local module = {}
function module.healthbar(parent)
	local HealthGui = game:WaitForChild("StarterGui"):WaitForChild("HealthBar")
	local GuiClone = HealthGui:Clone()
	local humanoid = parent:FindFirstChildOfClass("Humanoid")
	local rootPart = parent:FindFirstChild("HumanoidRootPart")

	if rootPart and humanoid then
		GuiClone.Parent = rootPart
		GuiClone.Background.Visible=true
		-- Set up the name label
		local textLabel = GuiClone.Background:FindFirstChild("Name")
		if textLabel then
			textLabel.Text = parent.Name

			if parent.Name == "EvilJobApplication" then
				textLabel.TextSize = 18
			elseif parent.Name == "WorkingEnemy" then
				textLabel.TextSize = 18
				textLabel.Position = UDim2.new(0, 33, 0, 40)
			end

			textLabel.TextColor3 = Color3.new(1, 1, 1) -- White
		end

		-- Set up health bar + number
		local healthBar = GuiClone.Background:FindFirstChild("Health")
		local healthNum = GuiClone.Background:FindFirstChild("HealthNum")

		local function updateHealthDisplay(newHealth)
			if humanoid and healthBar and healthNum then
				-- Ensure newHealth and humanoid.MaxHealth are not nil
				newHealth = newHealth or humanoid.Health
				local maxHealth = humanoid.MaxHealth or 100 -- Default to 100 if MaxHealth is nil

				healthBar.Size = UDim2.new(
					math.clamp(newHealth / maxHealth, 0, 1),
					0, 1, 0
				)
				healthNum.Text = tostring(math.floor(newHealth))
			end
		end

		-- Initial update with current health
		updateHealthDisplay(humanoid.Health)


		-- Update on health change
		humanoid.HealthChanged:Connect(updateHealthDisplay)
	end
end
return module
