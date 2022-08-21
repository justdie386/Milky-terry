local discordia = require("discordia")
local client = discordia.Client()
require("discordia-components")

local roly = discordia.Components {
    {
      type = 'button',
      id = "role",
      label = "Roles",
      style = "success",
    },
     {
      type = 'button',
      url = ("https://www.roblox.com/groups/7585689/S-cond-Brig-d#!/about"),
      label = "Ba group",
      style = "success",
      },
  }

  client:on("messageCreate", function(message)
    if message.content == "%init" then
        message.channel:send {
            embed = {
              title = "How to use",
              fields = {
                {name = "Roles button", value = "Will give you all the roles you need", inline = false},
                {name = "Ba group button", value = "Opens a link to the group you need to join to be able to attend battles, if you don't join it, then the code that gives access to a battle won't work", inline = false},
              },
              color = discordia.Color.fromRGB(114, 137, 218).value,
              timestamp = discordia.Date():toISO('T', 'Z')
            }
          }
        message:replyComponents("", roly)
    end
end)
client:on("interactionCreate", function(interaction)
    interaction.member:addRole("829444502161850478")
    interaction:reply("Success") 
end)
print("hell")
 --damn im good at this HELP ME
  client:run("Bot OTMwMjc5OTcxOTgzODgwMjAz.GkcfYo.Uxd2Pw6CmvbJDeZf713JVUp7wOcNENyTCaZcw0")
