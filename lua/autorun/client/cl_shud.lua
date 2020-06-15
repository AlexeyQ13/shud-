--[[
Created by Alexey.
Discord: Alexey#8463
]]

surface.CreateFont("HUDfont",{
	font = "Ebrima", 
	extended = false,
	size = 27,
	weight = 500,
	blursize = 0,
	scanlines = 1,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = true,
	outline = true
})

HealthLerp = Localplayer:GetMaxHealth()
ArmorLerp = 0

function hud(  )

	local ColorH = Color(215,120,120)
	local ColorA = Color(120,120,215)
	local health = LocalPlayer():Health()
	local armor = LocalPlayer():Armor()

	local width = 300
	local height = 25

	if health <= 0 then
		health = 0
	end

	if armor >= 100 then
		armor = 100
	end

	HealthLerp = Lerp(10*FrameTime(),HealthLerp,health)
	ArmorLerp = Lerp(10*FrameTime(),ArmorLerp,armor)
	
	draw.RoundedBox(5,15,ScrH()-85,width+10,height+40,Color(180,180,180,140))
	
	--HealthBar
	draw.RoundedBox(0,18,ScrH()-82,width+4,height+4,Color(28,28,28,220))
	draw.RoundedBox(2,20,ScrH()-80,HealthLerp*width/100,height,ColorH)
	draw.SimpleText("Health: " ,"HUDfont",height,ScrH()-68,Color(255,255,255,255),0,1) 	
	draw.SimpleText(health,"HUDfont",height+62,ScrH()-68,Color(255,255,255,255),0,1) 	

	--ArmorBar
	draw.RoundedBox(0,18,ScrH()-52,width+4,height+4,Color(28,28,28,220))
	draw.RoundedBox(2,20,ScrH()-50,ArmorLerp*width/100,height,ColorA)
	draw.SimpleText("Armor: " .. armor,"HUDfont",height,ScrH()-38,Color(255,255,255,255),0,1) 
	draw.SimpleText(armor,"HUDfont",height+62,ScrH()-38,Color(255,255,255,255),0,1)
end

hook.Add("HUDPaint","SHUD",function()
	hud()
end)

--hide gmod hud
hook.Add("HUDShouldDraw", "disableHUD", function(name)
	for k, v in pairs({"CHudHealth", "CHudBattery"}) do
		if name == v then return false end
	end
end)
