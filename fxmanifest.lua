-- Resource Information
author 'Sully'  -- Author of the resource
description 'Built on top of Xakra_Hitmarker, this removes crosshairs completely, and draws a reticle for bow users' -- Short description
version '1.0.0'        -- Define the version of this resource

fx_version "adamant"
game "rdr3"
rdr3_warning "I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships."

client_scripts {
    'crosshair.lua'
}

files {
    'stream/hud_reticle.gfx'
}