fx_version 'cerulean'
game 'gta5'

author 'Ranjit#6511'
description 'A Script That Would Allow Ems To carry a Their Job Bag'
discord 'https://discord.gg/5aHC4bGtK3'
github 'https://github.com/Ranjit-Develops'
version '1.0.2'

shared_scripts {
    "configs/**.lua"
}

server_script {
    "server/**.lua"
}

client_script {
    "client/**.lua"
}

escrow_ignore {
    "configs/**.lua",
    "README.lua"
}

files {
    'stream/prop_cs_shopping_bag.ydr'
}

dependencies {
    'qb-core',
    'qb-target'
}

lua54 'yes'
this_is_a_map 'yes'
