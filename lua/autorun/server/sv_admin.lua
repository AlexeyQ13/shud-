AddCSLuaFile()

local function sban (ply, cmd, arg)
	if IsValid(ply) then return false end
	if arg[2] == nil then return false end
	for _,pl in ipairs (player.GetAll()) do
		if pl:Nick() == arg[1] and !pl:IsBot() then
			pl:Ban(arg[2], true) end end end

local function skick (ply, cmd, arg)
	if !IsValid(ply) then return false end
	if arg[2] == nil then return false end
	local reason = arg[2]
	for _,pl in ipairs (player.GetAll()) do
		if pl:Nick() == arg[1] and !pl:IsBot() then
			pl:Kick(arg[2])
			PrintMessage(3, ply:Nick() .. " кикнул игрока " .. pl:Nick() .. " по причине: " .. reason ) end end end

concommand.Add("sban",sban)
concommand.Add("skick",skick)