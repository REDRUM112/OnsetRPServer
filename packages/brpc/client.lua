local onsetrp = ImportPackage("onsetrp")

local pcui = nil
local pcUIOpen = false
local function OnPackageStart() 
    pcui = CreateWebUI(0,0,0,0,0, 16)
	LoadWebFile(pcui, "http://asset/" .. GetPackageName() .. "/web/index.html")
    SetWebAlignment(pcui, 0, 0)
    SetWebAnchors(pcui, 0, 0, 1, 1)
	SetWebVisibility(pcui, WEB_HIDDEN)

end
AddEvent("OnPackageStart", OnPackageStart)

AddRemoteEvent("BRPC:Show", function(PCData)
	ExecuteWebJS(pcui, "HydrateUI('".. PCData .."');")
	SetWebVisibility(pcui, WEB_VISIBLE)
	SetInputMode(INPUT_GAMEANDUI)
end)

AddRemoteEvent('pc:update', function(time)
	ExecuteWebJS(pcui, "updateTime('" .. time .. "');")
end)

local function FetchPCData()   
	CallRemoteEvent("BRPC:FetchPCData")
end
AddRemoteEvent("pc:show", FetchPCData)


AddEvent("OnKeyPress", function( key )
	if key == "F8" and pcUIOpen == false then
		pcUIOpen = true
		CallRemoteEvent("BRPC:FetchPCData")
	elseif key == "F8" and pcUIOpen == true then 
		pcUIOpen = false
		SetWebVisibility(pcui, WEB_HIDDEN)
		SetInputMode(INPUT_GAME)
	end
end)