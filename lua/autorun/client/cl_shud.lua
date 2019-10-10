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



function hud(  )

	local ColorH = Color(215,120,120)
	local ColorA = Color(120,120,215)
	local healthH = LocalPlayer():Health()
	local healthI = LocalPlayer():Health()
	local armorA = LocalPlayer():Armor()
	local armorI = LocalPlayer():Armor()

	local width = 300
	local height = 25

	if healthH >= 100 then
		healthH = 100
	end

	if healthI <= 0 then
		healthI = 0
	end

	if armorA >= 100 then
		armorA = 100
	end

	draw.RoundedBox(5,15,ScrH()-85,width+10,height+40,Color(180,180,180,140))

	--HealthBar
	draw.RoundedBox(0,18,ScrH()-82,width+4,height+4,Color(28,28,28,220))
	draw.RoundedBox(2,20,ScrH()-80,healthH*width/100,height,ColorH)
	draw.SimpleText("Health: " ,"HUDfont",height,ScrH()-68,Color(255,255,255,255),0,1) 	
	draw.SimpleText(healthI ,"HUDfont",height+62,ScrH()-68,Color(255,255,255,255),0,1) 	

	--ArmorBar
	draw.RoundedBox(0,18,ScrH()-52,width+4,height+4,Color(28,28,28,220))
	draw.RoundedBox(2,20,ScrH()-50,armorA*width/100,height,ColorA)
	draw.SimpleText("Armor: " .. armorI,"HUDfont",height,ScrH()-38,Color(255,255,255,255),0,1) 
	draw.SimpleText(armorI,"HUDfont",height+62,ScrH()-38,Color(255,255,255,255),0,1)
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

print("SHUD loaded!")
