-- Thanks Nova_plays#9126 for helping me find natives

util.require_natives(1663599433)

local MenuRoot = menu.my_root()

local PlayerID = players.user()
local PlayerPED = players.user_ped()

function SET_OUTFIT_VALUE(ValueName, Value, variation)
    local commandName = ValueName

    if variation == true then
        commandName = commandName.."var"
    end

    menu.trigger_commands(commandName.." "..Value)
end

function crackHisNutsHandler(id)
    local crackTargetName = players.get_name(id)
    crackTargetName = string.lower(crackTargetName)
    local ped = PLAYER.GET_PLAYER_PED(id)
    menu.trigger_commands("freeze"..crackTargetName.." on")

    if PED.IS_PED_SITTING_IN_ANY_VEHICLE(ped) == true then 
        menu.trigger_commands("delveh"..crackTargetName)
        util.toast("Hopefully deleted their vehicle")
        util.yield(500)
    end

    menu.trigger_commands("tp"..crackTargetName)

    HUD.THEFEED_SET_BACKGROUND_COLOR_FOR_NEXT_POST(90)
    util.BEGIN_TEXT_COMMAND_THEFEED_POST("Crack his nuts.")
    HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(false, false)
end

function setupTrollOptions()
    players.on_join(function(id)
        local playerRoot = menu.player_root(id)

        menu.action(playerRoot, "Crack his nuts", {}, "Will freeze him and you will be teleported to him", function ()
            crackHisNutsHandler(id)
        end)
    end)

    players.dispatch_on_join()
end

local becomeButton;
becomeButton = menu.action(MenuRoot, "Become nutcracker", { "nutcracker_start" }, "IMPORTANT: Upon clicking on this, and being transformed equip a weapon or your character will throw it away", function ()
    menu.delete(becomeButton)
    menu.trigger_commands("mpmale")
    util.yield(500)
    SET_OUTFIT_VALUE("head", 32)
    SET_OUTFIT_VALUE("head", 0, true)
    SET_OUTFIT_VALUE("mask", 215)
    SET_OUTFIT_VALUE("mask", 0, true)
    SET_OUTFIT_VALUE("hair", 0)
    SET_OUTFIT_VALUE("hair", 58, true)
    SET_OUTFIT_VALUE("top", 446)
    SET_OUTFIT_VALUE("top", 0, true)
    SET_OUTFIT_VALUE("gloves", 0)
    SET_OUTFIT_VALUE("gloves", 0, true)
    SET_OUTFIT_VALUE("top2", -1)
    SET_OUTFIT_VALUE("top2", 0, true)
    SET_OUTFIT_VALUE("top3", -1)
    SET_OUTFIT_VALUE("top3", 0, true)
    SET_OUTFIT_VALUE("parachute", 0)
    SET_OUTFIT_VALUE("parachute", 0, true)
    SET_OUTFIT_VALUE("pants", 160)
    SET_OUTFIT_VALUE("pants", 0, true)
    SET_OUTFIT_VALUE("shoes", 119)
    menu.trigger_commands("feetvar 0")
    SET_OUTFIT_VALUE("accessories", -1)
    SET_OUTFIT_VALUE("accessories", 0, true)
    SET_OUTFIT_VALUE("decals", -1)
    SET_OUTFIT_VALUE("decals", 0, true)
    SET_OUTFIT_VALUE("hat", 193)
    SET_OUTFIT_VALUE("hat", 0, true)
    SET_OUTFIT_VALUE("glasses", -1)
    SET_OUTFIT_VALUE("glasses", -1, true)
    SET_OUTFIT_VALUE("ears", -1)
    SET_OUTFIT_VALUE("ears", -1, true)
    SET_OUTFIT_VALUE("watch", -1)
    SET_OUTFIT_VALUE("watch", -1, true)
    SET_OUTFIT_VALUE("bracelet", -1)
    SET_OUTFIT_VALUE("bracelet", -1, true)
    menu.trigger_commands("noguns")
    menu.trigger_commands("getgunspipewrench")
    menu.trigger_commands("wanted 0")
    menu.trigger_commands("lockwantedlevel on")
    WEAPON.SET_CURRENT_PED_WEAPON(players.user_ped(), 419712736, true)
    PLAYER.SET_PLAYER_INVINCIBLE(PlayerID, true)

    HUD.THEFEED_SET_BACKGROUND_COLOR_FOR_NEXT_POST(90)
    util.BEGIN_TEXT_COMMAND_THEFEED_POST("Time to crack some nuts.")
    HUD.END_TEXT_COMMAND_THEFEED_POST_TICKER(false, false)

    setupTrollOptions()
end)

util.keep_running()
