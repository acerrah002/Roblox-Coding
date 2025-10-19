local parent = script.Parent
local EnemyFolder =game.ServerStorage.Enemies:GetChildren()
local enemy = game.ServerStorage.Enemies.Zombie --Change Zombie to the name of the enemy you want specificly

local enemyspawner = require(game.ServerScriptService.ModuleScripts.ShrineSpawnEnemyChangeForRandom)
--enemyspawner.SpecificEnemy(parent, enemy) --uncomment the enemyspawner to spawn a specific enemy

enemyspawner.RandomEnemy(parent, EnemyFolder) --uncomment this and comment the other for random enemy