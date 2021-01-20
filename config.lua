--
-- Created by MasterLua.
--

Config = {}
Config.MenuName = "AlmaRP"
Config.MoneyName = "Almacoin"

Config.Weapon = {
    {name = "Bat de baseball", data = {
        Point = "350",
        Preview = "baseball-bat",
        NameWeapon = "weapon_bat" },
    },
    {name = "Couteau", data = {
        Point = "500",
        Preview = "Screenshot_127",
        NameWeapon = "weapon_knife" },
    },
    {name = "Pistolet cal. 50", data = {
        Point = "800",
        Preview = "pistolet-cal50",
        NameWeapon = "weapon_pistol50" },
    },
    {name = "Pistolet Mitrailleur", data = {
        Point = "1000",
        Preview = "pistolet-mitrailleur",
        NameWeapon = "weapon_microsmg" },
    },
    {name = "Pistolet AP Pistol", data = {
        Point = "1000",
        Preview = nil,
        NameWeapon = "weapon_appistol" },
    },
    {name = "Ak-47 [PERM]", data = {
        Point = "4000",
        Preview = "assault-rifle-mk2",
        NameWeapon = "weapon_assaultrifle" },
    },
    {name = "Ak-47 Compact [PERM]", data = {
        Point = "4300",
        Preview = nil,
        NameWeapon = "weapon_compactrifle" },
    },
    {name = "Fusil de précision lourd [PERM]", data = {
        Point = "10800",
        Preview = "fusil-precision-lourd",
        NameWeapon = "weapon_heavysniper" },
    },
}

Config.Vehicle = {
    {name = "Honda CB500F", data = {
        Point = "2300",
        Preview = "cb500f",
        NameVehicle = "cb500f" },
    },
    {name = "Lumma G770", data = {
        Point = "3700",
        Preview = "G770",
        NameVehicle = "g770" },
    },
    {name = "Audi RS6 2020", data = {
        Point = "3400",
        Preview = "RS6",
        NameVehicle = "rs6black" },
    },
    {name = "Audi RS7 2020", data = {
        Point = "4100",
        Preview = "RS7",
        NameVehicle = "rs7r" },
    },
    {name = "Mercedes C63 AMG", data = {
        Point = "2500",
        Preview = "C63",
        NameVehicle = "c63" },
    },
    {name = "BMW M5", data = {
        Point = "2500",
        Preview = "BMW",
        NameVehicle = "bmci" },
    },
    {name = "Lamborghini Urus 2018", data = {
        Point = "2500",
        Preview = "URUS",
        NameVehicle = "urus2018" },
    },
    {name = "Nissan GTR", data = {
        Point = "3500",
        Preview = "GTR",
        NameVehicle = "gtr" },
    },
    {name = "T-MAX", data = {
        Point = "1500",
        Preview = "tmax",
        NameVehicle = "tmax" },
    },
    {name = "Mercedes A45", data = {
        Point = "2000",
        Preview = "A45",
        NameVehicle = "macla" },
    },
    {name = "Lamborghini Terzo TZR", data = {
        Point = "4000",
        Preview = "TERZO",
        NameVehicle = "terzo" },
    },
    {name = "Audi Q8 2020", data = {
        Point = "3300",
        Preview = "Q8",
        NameVehicle = "q820" },
    },
    {name = "Audi R8 2020", data = {
        Point = "3500",
        Preview = nil,
        NameVehicle = "r820" },
    },
    {name = "McLaren Senna", data = {
        Point = "3900",
        Preview = nil,
        NameVehicle = "senna" },
    },
    {name = "Mercedes CLS 53", data = {
        Point = "3000",
        Preview = nil,
        NameVehicle = "cls53" },
    },
    {name = "Nissan Skyline", data = {
        Point = "2500",
        Preview = nil,
        NameVehicle = "skyline" },
    },
}

Config.Pack = {
    {name = "Pack Arme", data = {
        Point = "3100",
        Preview = "packa",
        Pack = "PackArme",
        Vehicle = {},
        Arme = { "weapon_assaultrifle", "weapon_pistol", "weapon_microsmg" }
    },},

    {name = "Pack Vehicule", data = {
        Point = "4800",
        Preview = nil,
        Pack = "PackVehicule",
        Vehicle = { "tmax", "rs6black" },
        Arme = {}
    },},

}
TableWeapon = {
    ["WEAPON_DAGGER"] = GetHashKey("WEAPON_DAGGER"),
    ["WEAPON_BAT"] = GetHashKey("WEAPON_BAT"),
    ["WEAPON_BOTTLE"] = GetHashKey("WEAPON_BOTTLE"),
    ["WEAPON_CROWBAR"] = GetHashKey("WEAPON_CROWBAR"),
    ["WEAPON_UNARMED"] = GetHashKey("WEAPON_UNARMED"),
    ["WEAPON_FLASHLIGHT"] = GetHashKey("WEAPON_FLASHLIGHT"),
    ["WEAPON_GOLFCLUB"] = GetHashKey("WEAPON_GOLFCLUB"),
    ["WEAPON_HAMMER"] = GetHashKey("WEAPON_HAMMER"),
    ["WEAPON_HATCHET"] = GetHashKey("WEAPON_HATCHET"),
    ["WEAPON_KNUCKLE"] = GetHashKey("WEAPON_KNUCKLE"),
    ["WEAPON_KNIFE"] = GetHashKey("WEAPON_KNIFE"),
    ["WEAPON_MACHETE"] = GetHashKey("WEAPON_MACHETE"),
    ["WEAPON_SWITCHBLADE"] = GetHashKey("WEAPON_SWITCHBLADE"),
    ["WEAPON_NIGHTSTICK"] = GetHashKey("WEAPON_NIGHTSTICK"),
    ["WEAPON_WRENCH"] = GetHashKey("WEAPON_WRENCH"),
    ["WEAPON_BATTLEAXE"] = GetHashKey("WEAPON_BATTLEAXE"),
    ["WEAPON_POOLCUE"] = GetHashKey("WEAPON_POOLCUE"),
    ["WEAPON_STONE_HATCHET"] = GetHashKey("WEAPON_STONE_HATCHET"),
    ["WEAPON_PISTOL"] = GetHashKey("WEAPON_PISTOL"),
    ["WEAPON_PISTOL_MK2"] = GetHashKey("WEAPON_PISTOL_MK2"),
    ["WEAPON_COMBATPISTOL"] = GetHashKey("WEAPON_COMBATPISTOL"),
    ["WEAPON_APPISTOL"] = GetHashKey("WEAPON_APPISTOL"),
    ["WEAPON_STUNGUN"] = GetHashKey("WEAPON_STUNGUN"),
    ["WEAPON_PISTOL50"] = GetHashKey("WEAPON_PISTOL50"),
    ["WEAPON_SNSPISTOL"] = GetHashKey("WEAPON_SNSPISTOL"),
    ["WEAPON_SNSPISTOL_MK2"] = GetHashKey("WEAPON_SNSPISTOL_MK2"),
    ["WEAPON_HEAVYPISTOL"] = GetHashKey("WEAPON_HEAVYPISTOL"),
    ["WEAPON_VINTAGEPISTOL"] = GetHashKey("WEAPON_VINTAGEPISTOL"),
    ["WEAPON_FLAREGUN"] = GetHashKey("WEAPON_FLAREGUN"),
    ["WEAPON_MARKSMANPISTOL"] = GetHashKey("WEAPON_MARKSMANPISTOL"),
    ["WEAPON_REVOLVER"] = GetHashKey("WEAPON_REVOLVER"),
    ["WEAPON_REVOLVER_MK2"] = GetHashKey("WEAPON_REVOLVER_MK2"),
    ["WEAPON_DOUBLEACTION"] = GetHashKey("WEAPON_DOUBLEACTION"),
    ["WEAPON_RAYPISTOL"] = GetHashKey("WEAPON_RAYPISTOL"),
    ["WEAPON_CERAMICPISTOL"] = GetHashKey("WEAPON_CERAMICPISTOL"),
    ["WEAPON_NAVYREVOLVER"] = GetHashKey("WEAPON_NAVYREVOLVER"),
    ["WEAPON_MICROSMG"] = GetHashKey("WEAPON_MICROSMG"),
    ["WEAPON_SMG"] = GetHashKey("WEAPON_SMG"),
    ["WEAPON_SMG_MK2"] = GetHashKey("WEAPON_SMG_MK2"),
    ["WEAPON_ASSAULTSMG"] = GetHashKey("WEAPON_ASSAULTSMG"),
    ["WEAPON_COMBATPDW"] = GetHashKey("WEAPON_COMBATPDW"),
    ["WEAPON_MACHINEPISTOL"] = GetHashKey("WEAPON_MACHINEPISTOL"),
    ["WEAPON_MINISMG"] = GetHashKey("WEAPON_MINISMG"),
    ["WEAPON_RAYCARBINE"] = GetHashKey("WEAPON_RAYCARBINE"),
    ["WEAPON_PUMPSHOTGUN"] = GetHashKey("WEAPON_PUMPSHOTGUN"),
    ["WEAPON_PUMPSHOTGUN_MK2"] = GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),
    ["WEAPON_SAWNOFFSHOTGUN"] = GetHashKey("WEAPON_SAWNOFFSHOTGUN"),
    ["WEAPON_ASSAULTSHOTGUN"] = GetHashKey("WEAPON_ASSAULTSHOTGUN"),
    ["WEAPON_BULLPUPSHOTGUN"] = GetHashKey("WEAPON_BULLPUPSHOTGUN"),
    ["WEAPON_MUSKET"] = GetHashKey("WEAPON_MUSKET"),
    ["WEAPON_HEAVYSHOTGUN"] = GetHashKey("WEAPON_HEAVYSHOTGUN"),
    ["WEAPON_DBSHOTGUN"] = GetHashKey("WEAPON_DBSHOTGUN"),
    ["WEAPON_AUTOSHOTGUN"] = GetHashKey("WEAPON_AUTOSHOTGUN"),
    ["WEAPON_ASSAULTRIFLE"] = GetHashKey("WEAPON_ASSAULTRIFLE"),
    ["WEAPON_ASSAULTRIFLE_MK2"] = GetHashKey("WEAPON_ASSAULTRIFLE_MK2"),
    ["WEAPON_CARBINERIFLE"] = GetHashKey("WEAPON_CARBINERIFLE"),
    ["WEAPON_CARBINERIFLE_MK2"] = GetHashKey("WEAPON_CARBINERIFLE_MK2"),
    ["WEAPON_ADVANCEDRIFLE"] = GetHashKey("WEAPON_ADVANCEDRIFLE"),
    ["WEAPON_SPECIALCARBINE"] = GetHashKey("WEAPON_SPECIALCARBINE"),
    ["WEAPON_SPECIALCARBINE_MK2"] = GetHashKey("WEAPON_SPECIALCARBINE_MK2"),
    ["WEAPON_BULLPUPRIFLE"] = GetHashKey("WEAPON_BULLPUPRIFLE"),
    ["WEAPON_BULLPUPRIFLE_MK2"] = GetHashKey("WEAPON_BULLPUPRIFLE_MK2"),
    ["WEAPON_COMPACTRIFLE"] = GetHashKey("WEAPON_COMPACTRIFLE"),
    ["WEAPON_MG"] = GetHashKey("WEAPON_MG"),
    ["WEAPON_COMBATMG"] = GetHashKey("WEAPON_COMBATMG"),
    ["WEAPON_COMBATMG_MK2"] = GetHashKey("WEAPON_COMBATMG_MK2"),
    ["WEAPON_GUSENBERG"] = GetHashKey("WEAPON_GUSENBERG"),
    ["WEAPON_SNIPERRIFLE"] = GetHashKey("WEAPON_SNIPERRIFLE"),
    ["WEAPON_HEAVYSNIPER"] = GetHashKey("WEAPON_HEAVYSNIPER"),
    ["WEAPON_HEAVYSNIPER_MK2"] = GetHashKey("WEAPON_HEAVYSNIPER_MK2"),
    ["WEAPON_MARKSMANRIFLE"] = GetHashKey("WEAPON_MARKSMANRIFLE"),
    ["WEAPON_MARKSMANRIFLE_MK2"] = GetHashKey("WEAPON_MARKSMANRIFLE_MK2"),
    ["WEAPON_RPG"] = GetHashKey("WEAPON_RPG"),
    ["WEAPON_GRENADELAUNCHER"] = GetHashKey("WEAPON_GRENADELAUNCHER"),
    ["WEAPON_GRENADELAUNCHER_SMOKE"] = GetHashKey("WEAPON_GRENADELAUNCHER_SMOKE"),
    ["WEAPON_MINIGUN"] = GetHashKey("WEAPON_MINIGUN"),
    ["WEAPON_FIREWORK"] = GetHashKey("WEAPON_FIREWORK"),
    ["WEAPON_RAILGUN"] = GetHashKey("WEAPON_RAILGUN"),
    ["WEAPON_HOMINGLAUNCHER"] = GetHashKey("WEAPON_HOMINGLAUNCHER"),
    ["WEAPON_COMPACTLAUNCHER"] = GetHashKey("WEAPON_COMPACTLAUNCHER"),
    ["WEAPON_RAYMINIGUN"] = GetHashKey("WEAPON_RAYMINIGUN"),
    ["WEAPON_GRENADE"] = GetHashKey("WEAPON_GRENADE"),
    ["WEAPON_BZGAS"] = GetHashKey("WEAPON_BZGAS"),
    ["WEAPON_MOLOTOV"] = GetHashKey("WEAPON_MOLOTOV"),
    ["WEAPON_STICKYBOMB"] = GetHashKey("WEAPON_STICKYBOMB"),
    ["WEAPON_PROXMINE"] = GetHashKey("WEAPON_PROXMINE"),
    ["WEAPON_SNOWBALL"] = GetHashKey("WEAPON_SNOWBALL"),
    ["WEAPON_PIPEBOMB"] = GetHashKey("WEAPON_PIPEBOMB"),
    ["WEAPON_BALL"] = GetHashKey("WEAPON_BALL"),
    ["WEAPON_SMOKEGRENADE"] = GetHashKey("WEAPON_SMOKEGRENADE"),
    ["WEAPON_FLARE"] = GetHashKey("WEAPON_FLARE"),
    ["WEAPON_PETROLCAN"] = GetHashKey("WEAPON_PETROLCAN"),
    ["GADGET_PARACHUTE"] = GetHashKey("GADGET_PARACHUTE"),
    ["WEAPON_FIREEXTINGUISHER"] = GetHashKey("WEAPON_FIREEXTINGUISHER"),
    ["WEAPON_HAZARDCAN"] = GetHashKey("WEAPON_HAZARDCAN")
}