fx_version 'cerulean'
game 'gta5'

name 'MySword_Radio'
author 'MySword傅剑寒'
description 'ms-Radio 船新的无线电脚本'
version '1.0.4'

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
