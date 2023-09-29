fx_version "cerulean"
game 'gta5'
lua54 'yes'
version '1.0'

shared_script {
    '@es_extended/imports.lua',
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

server_scripts {
    '@async/async.lua',
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}