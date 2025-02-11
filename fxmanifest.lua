fx_version 'cerulean'
game 'gta5'

name 'MySword_Radio'
author 'MySword/MurphyBluff'
description 'ms-Radio - A Brand New Radio Script'
version '1.0.5'

shared_script {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/sounds/*.ogg'
}

lua54 'yes'
use_fxv2_oal 'yes'
