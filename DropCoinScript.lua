local model = script.Parent
local humanoid = model:FindFirstChildOfClass("Humanoid")
local function CoinDrop()
	local coinTemplate = game.Workspace.CoinModel
	if not coinTemplate then return end

	local coinDrop = coinTemplate:Clone()
	coinDrop.Parent = game.Workspace

	-- Place the coin at the model's position
	local rootPart = model:FindFirstChild("HumanoidRootPart")
	if rootPart then
		coinDrop.CFrame = rootPart.CFrame
	elseif model:IsA("Model") then
		coinDrop.CFrame = model:GetPivot()
	elseif model:IsA("BasePart") then
		coinDrop.CFrame = model.CFrame
	end
	model:Destroy()
end

if humanoid then
	humanoid.Died:Connect(CoinDrop)
end