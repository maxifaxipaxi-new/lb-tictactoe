fx_version "cerulean"
game "gta5"

title "LB-Phone & LB-Tablet - TicTacToe"
description "Integrate Games like TicTacToe to LB"
author "MFPSCRIPTS"
version '1.1.0'

lua54 'yes'

client_script {
    'client.lua',
    'config.lua'
}

escrow_ignore {
    'client.lua',
    'config.lua',
    "ui/**/*"
}

files {
    "ui/**/*"
}

ui_page {
    "ui/phone/index.html",
    "ui/tablet/index.html"
}

-- visit lb-phone.com for phone! --
-- visit lb.mfpscripts.com for addons! --