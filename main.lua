local discordia = require("discordia")
local client = discordia.Client()
local sql = require "sqlite3"
local conn = sql.open("data.sqlite")
require("discordia-components")
discordia.extensions()
filewrite = io.open("logs.txt")
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
    if message.content == "%log" then
      local wtf = message.member.voiceChannel.connectedMembers:iter()
      for member in message.member.voiceChannel.connectedMembers:iter() do
        Member = member.name
        print(member.name)
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
    logsChannel:send(tostring(Creator).." has been roled the "..tostring(time).." EST")
    local id = interaction.user.id
    local name = interaction.user.name
    conn:exec("INSERT OR IGNORE INTO data (id, name, time) VALUES('" .. id .. "','" .. name .. "','" .. time .. "')")
    else 
    interaction:reply("You already have those roles")
  end
end)




  client:run("Bot ")
