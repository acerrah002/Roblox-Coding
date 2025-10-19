local module = {}
function module.sword(parent, mindamage, maxdamage)
	local tool = parent
	local canDamage = false
	local canSwing = true


	-- Set up the animation
	local animation = Instance.new("Animation")
	animation.AnimationId = "rbxassetid://134237961431607"
	local loadedAnimation

	-- Helper: get animator from tool holder
	local function getAnimator()
		local humanoid = tool.Parent:FindFirstChildOfClass("Humanoid")
		if not humanoid then return nil end

		local animator = humanoid:FindFirstChildOfClass("Animator")
		if not animator then
			animator = Instance.new("Animator", humanoid)
		end
		return animator
	end

	-- Handle sword hits
	local function onTouch(otherPart)
		if not canDamage then return end

		local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
		if humanoid and humanoid.Parent ~= tool.Parent then
			local name = humanoid.Parent.Name
			if name ~= "Tree" and name ~= "Rock" then
				humanoid:TakeDamage(math.random(mindamage, maxdamage))
				canDamage = false
			end
		end
	end

	-- Play slash animation + enable damage
	local function slash()
		if not canSwing then return end
		canSwing = false

		local animator = getAnimator()
		if animator then
			if loadedAnimation then loadedAnimation:Stop() end
			loadedAnimation = animator:LoadAnimation(animation)
			loadedAnimation:Play()
		end

		canDamage = true
		task.wait(0.5) -- swing cooldown
		canSwing = true
	end

	-- Connect events
	tool.Activated:Connect(slash)
	tool.Handle.Touched:Connect(onTouch)

end
return module
