name = "Level Up - Power Plant"
author = "Tester"
description = [[This script will catch shiny or rare Pokemon and will Level up first Pokemon of your team in Power Plant.]]

mpaName = "Power Plant" -- Change map name as you want.
X = 48
Y = 12
pokecenter_Name = "Route 10 Pokecenter" -- choose different pokecenter like Route 10 Pokecenter.

function onStart()
    log("***Starting bot***")
end

function onPathAction()
  if isPokemonUsable(1) then
    if getMapName() == pokecenter_Name then
        return teleportTo("Route 10", 26, 2)
	elseif getMapName() == "Route 10" then
		return teleportTo(mpaName, X, Y)
    elseif getMapName() == mpaName then
     	return moveLinearX(48, 50, 12, "battle")
     	  	--return startBattle() -- you can choose startSurfBattle() to start surf battle :D
	else
		return teleportTo(pokecenter_Name, 19, 14)
    end
  else
    return teleportTo(pokecenter_Name, 19, 14)
  end
end

function onBattleAction()
    if not isOpponentShiny() and not isOpponentRare() then
        return attack() or sendAnyPokemon() or run()
    else
        return useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poke Ball") or sendAnyPokemon()
    end
end

function onLearningMove(moveName, index)
    forgetAnyMoveExcept({"Fly", "Cut", "Psychic", "Slash", "Flame Burst", "Flamethrower"})
end