

RoundManager = class({})

function RoundManager:constructor()

	ListenToGameEvent("game_rules_state_change", Dynamic_Wrap(RoundManager,"OnGameRulesStateChanged"), self) --注册事件监听器，监听游戏事件改变
end

function RoundManager:OnGameRulesStateChanged(  )
	
	if GameRules:State_Get()==DOTA_GAMERULES_STATE_PRE_GAME then
		--在所有玩家中循环
		LoopOverPlayers(function ( player )

			--玩家抽INITAL_CARDS_COUNT张牌
			player:DrawCards(INITAL_CARDS_COUNT)
			
			--执行调度操作
			player:DoMulligan()
		end)

	end
end

GameRules.RoundManager = RoundManager()