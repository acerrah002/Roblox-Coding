local module = {}
function module.coindrop(parent)
	local model = parent
	local humanoid = model:FindFirstChildOfClass("Humanoid")
	local function CoinDrop()
		local Players = game:GetService("Players")
		local coinTemplate = game.ServerStorage.Coin --change if Coin isn't in ServerStorage
		if not coinTemplate then return end

		local coinDrop = coinTemplate:Clone()
		coinDrop.Parent = game.Workspace --Change if you want the coin to be in a different location
		coinDrop.Anchored = true --Change if you want the coin to have gravity
		coinDrop.CanCollide = false

		-- Place the coin at the model's position
		local rootPart = model:FindFirstChild("HumanoidRootPart")
		local position = 90
		if rootPart then
			coinDrop.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(position), 0, 0)
		elseif model:IsA("Model") then
			coinDrop.CFrame = model:GetPivot() * CFrame.Angles(math.rad(position), 0, 0)
		elseif model:IsA("BasePart") then
			coinDrop.CFrame = model.CFrame * CFrame.Angles(math.rad(position), 0, 0)
		end
		model:Destroy()
	end

	if humanoid then
		humanoid.Died:Connect(CoinDrop)
	end
end


return module
