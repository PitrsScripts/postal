fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    'config.lua',  
    '@ox_lib/init.lua' 
}

client_scripts { 
    'postal.lua',  
}

dependencies {
    'oxmysql',   
    'ox_lib', 
    'es_extended',  
}
