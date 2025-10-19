local module = {}
function ResourceHealthBar(parent)
	-- Clone the GUI
	local HealthGui = game:WaitForChild("StarterGui"):WaitForChild("HealthBar")
	local GuiClone = HealthGui:Clone()
	local humanoid = parent:FindFirstChildOfClass("Humanoid")
	local rootPart = parent:FindFirstChild("HumanoidRootPart")

	if rootPart and humanoid then
		GuiClone.Parent = rootPart

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

		local function updateHealthDisplay()
			if humanoid and healthBar and healthNum then
				healthBar.Size = UDim2.new(
					math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1),
					0, 1, 0
				)
				healthNum.Text = tostring(math.floor(humanoid.Health))
			end
		end

		-- Initial update
		updateHealthDisplay()

		-- Update on health change
		humanoid.HealthChanged:Connect(updateHealthDisplay)
	end
end
return module
