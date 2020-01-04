local infoui = nil

local function OnPackageStart() 
    infoui = CreateWebUI(0.0, 0.0, 0.0, 0.0, 5, 16)
    LoadWebFile(infoui, "http://asset/" .. GetPackageName() .. "/web/index.html")
    SetWebSize(infoui, 1218, 1080)
    SetWebAlignment(infoui, 0.5, 0.5)
    SetWebAnchors(infoui, 0.5, 0.5, 0.5, 0.5)
    SetWebVisibility(infoui, WEB_HIDDEN)
end

AddRemoteEvent("InfoUI:Show", function() 
    SetWebVisibility(infoui, WEB_VISIBLE)
    SetInputMode(INPUT_UI)
end)

AddEvent("InfoUI:Close", function() 
    SetWebVisibility(infoui, WEB_HIDDEN)
    SetInputMode(INPUT_GAME)
end)
AddEvent("OnPackageStart", OnPackageStart)