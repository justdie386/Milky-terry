local discordia = require("discordia")
local client = discordia.Client()
discordia.extensions()
Token = require("secret.lua")
local Components = require("discordia-Components")
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
    local content = message.content
    local args = message.content
    local args = content:split(" ")
    if args[1] == "%log" then
      for member in message.member.voiceChannel.connectedMembers:iter() do        
        Member = member.name
        Array = {Member.." "..member.name}
        table.remove(args, 1)
        local event = (table.concat(args, " "))
        message:reply(event)
        message:reply(member.name)
    end
    end
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
  if message.content == "ratio" then
    message:addReaction("👍")
  end
end)
client:on("interactionCreate", function(interaction)
  --make it so when the button is pressed the user's id, the user's name and the time is stored in the database
    local id = interaction.user.id
    local name = interaction.user.name
    local time = discordia.Date():toISO('T', 'Z')
    
  local logsChannel, err = client:getChannel("1011291374232018996")
  if interaction.member:hasRole("829444502161850478") ~= true then
    interaction.member:setNickname("[35th] "..interaction.user.name)
    interaction.member:addRole("829444502161850478")
    interaction:reply("Success")
    Creator = interaction.member.name
    local time = (os.date ("%c"))
    logsChannel:send {
      embed = {
        title = "New recruit",
        fields = {
          {name = "Who", value = tostring(Creator), inline = false},
          {name = "When", value = tostring(time), inline = false},
        },
        color = discordia.Color.fromRGB(114, 137, 218).value,
        timestamp = discordia.Date():toISO('T', 'Z')
      }
    }
    local id = interaction.user.id
    local name = interaction.user.name
      else 
    interaction:reply("You already have those roles")
  end
end)



  client:on('ready', function()
  client:setGame("Enlisting the 35th since 1700")
  end)
  client:run("Bot "..Token)
