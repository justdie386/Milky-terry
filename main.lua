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
      if message.member:hasRole("829444502161850478") == true then
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
        else
          message:reply("You don't have the permission to use the command")
    end
  end
end)
client:on("interactionCreate", function(interaction)
  if interaction.member:hasRole("829444502161850478") ~= true then
    interaction.member:addRole("829444502161850478")
    interaction:reply("Success")
  else 
    interaction:reply("You already have those roles")
  end
end)
print("hell")
 --damn im good at this HELP ME why am i doing this
  client:run("Bot OTMwMjc5OTcxOTgzODgwMjAz.GVVdrp.hGQajuHTyUy7-OEViQtYiCxx2lZ_9I6f-qzqwk")
