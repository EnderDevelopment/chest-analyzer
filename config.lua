Config = {}

-- Chest types and their properties
Config.ChestTypes = {
    common = {
        model = 'prop_crate_01a',
        color = {r = 255, g = 255, b = 255, a = 255},
        rarity = 'Common'
    },
    gold = {
        model = 'prop_crate_02a',
        color = {r = 255, g = 215, b = 0, a = 255},
        rarity = 'Gold'
    },
    diamond = {
        model = 'prop_crate_03a',
        color = {r = 0, g = 255, b = 255, a = 255},
        rarity = 'Diamond'
    },
    void = {
        model = 'prop_crate_04a',
        color = {r = 128, g = 0, b = 128, a = 255},
        rarity = 'Void'
    }
}

-- ESP settings
Config.ESPSettings = {
    distance = 50.0,
    font = 4,
    scale = 0.5,
    outline = true
}

-- Auto open settings
Config.AutoOpenSettings = {
    enabled = true,
    speed = 1.0
}