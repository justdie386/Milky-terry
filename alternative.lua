    local discordia = require("discordia")
    local client = discordia.Client()
    local secret = require("secret.lua")
    print(secret)

    client:on('ready', function()
        print("logged in as"..client)
    end)
        
    client:on('messageCreate', function(msg)
    if msg.content ~= "Success" then
        msg:reply("Annnnnnnd you failed!!")
    end
    end)

client:run(Bot )