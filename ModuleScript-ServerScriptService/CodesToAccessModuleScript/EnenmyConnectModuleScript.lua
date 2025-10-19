local parent = script.Parent

local hidenamesandhealth = require(game.ServerScriptService.ModuleScripts.HideEntityNames)
hidenamesandhealth.active(parent)

local coindrop = require(game.ServerScriptService.ModuleScripts.EnemyCoinDrop)
coindrop.coindrop(parent)

local healthbar = require(game.ServerScriptService.ModuleScripts.HealthBar)
healthbar.healthbar(parent)