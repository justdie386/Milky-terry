local discordia = require("discordia")
local client = discordia.Client()
local client = discordia.Client {
	logFile = 'mybot.log',
	cacheAllMembers = true,
}
discordia.extensions()
  client:on("messageCreate", function(message)
    local content = message.content
     local args = content:split(" ")
    if args[1] == "%log" then
      Base = ""
       local logsChannel = client:getChannel("1012374581874524160")
      for member in message.member.voiceChannel.connectedMembers:iter() do        
        table.remove(args, 1)
        local Member = Base        
        Base = Member.."\n"..member.name
    end
    local event = (table.concat(args, " "))
    logsChannel:send(event)
    logsChannel:send(Base)
    end

local content = message.content
local args = content:split(" ")
BG = ""
if args[1] == "%role" then
  table.remove(args, 1)
  local id = (table.concat(args, " "))
  message:reply"List of users: "
  for member in message.guild.members:iter() do
    if member:hasRole(id) then
      BG = BG.."\n".."<@"..member.name..">"
    end
   end
   print(BG)
   message:reply(BG)
  end
        if args[1] == "%role-no-ping" then
  table.remove(args, 1)
  local id = (table.concat(args, " "))
  message:reply"List of users: "
  Beau = ""
  for member in message.guild.members:iter() do
    if member:hasRole(id) then
      if member:hasRole(id) then                                                                                                                                                                                                            
    Beau = Beau.."\n"..member.name
    end
   end
   end
   message:reply(Beau)
 end
end)



  client:on('ready', function()
  client:setGame("Enlisting the 35th since 1700")
  end)
  print("nice")
  client:run("Bot OTI4Njc3MzIzNzgyMzYxMTI4.GjWQnO.z_NId2sEC_RZFNUALWoE5Sz3_DNQerBNu4Ctw0")
