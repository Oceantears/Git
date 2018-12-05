function LoopOverPlayers(callback)           --回调函数
	for i = 0,DOTA_MAX_TEAM_PLAYERS do

		if PlayerResource:IsValidTeamPlayer(i) then
			callback(player)
		end
	end
end


--定时器
--在XX秒后执行XX操作
--Timer(1,function()...end) 或者
--Timer(function()..end)
function Timer(dealy callback)
	if callback == nil then
		callback = dealy
		dealy = 0
	end


	GameRules:GetGameModeEntity():SetContextThink(DoUniqueString("timer"), function ()
		
	end, dealy)
end