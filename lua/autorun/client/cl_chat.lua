function Chat( ply, text, isTeam, isDead )
	local say = {}

	if isDead then
		table.Add(say, {Color(230, 25, 25), "*DEAD* "} )
	end

	if !IsValid(ply) then
		table.Add(say, {Color(140,140,140), "Console"} )
	else
		table.Add(say, {Color (80, 80, 80), "[",team.GetColor(ply:Team()), team.GetName(ply:Team()), Color(80, 80 ,80), "] ", Color(255, 255, 255), ply:Name()} )
	end

	table.Add(say, {Color(255, 255, 255), ": " .. text} )
	chat.AddText(unpack(say))

	return true
end

hook.Add("OnPlayerChat","AG_chat",Chat)