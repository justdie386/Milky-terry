local dia = require("discordia")
local dcmd = require("discordia-commands")
local autocomplete = require("autocomplete")
local commandType = dia.enums.appCommandType
local optionType = dia.enums.appCommandOptionType
local client = dia.Client():useApplicationCommands()

dia.extensions()
local function initializeCommands1(guild)
local command, err = client:createGuildApplicationCommand(guild.id, {
    type = commandType.chatInput,
    name = "log",
    description = ".",
    options = {
        {
            type = optionType.subCommand,
            name = "",
            description = "Note everyone that is in your current vc",
        },
    },
})
end
local function initializeCommands2(guild)
command, err = client:createGuildApplicationCommand(guild.id, {
    type = commandType.chatInput,
    name = "get-users",
    description = ".",
    options = {
        {
            type = optionType.subCommand,
            name = "from",
            description = "Convert a time from a specific IANA timezone",
            options = {
                {
                    type = optionType.string,
                    name = "role",
                    description = "id",
                    required = true,
                    autocomplete = true,
                },
                
            },
        },
    },
})
end
local function initializeCommands(guild)
    local command, err = client:createGuildApplicationCommand(guild.id, {
        type = commandType.chatInput,
        name = "get-users-ping",
        description = ".",
        options = {
            {
                type = optionType.subCommand,
                name = "from",
                description = "Note everyone that is in your current vc",
                options = {
                    {
                        type = optionType.string,
                        name = "role",
                        description = "id",
                        required = true,
                        autocomplete = true,
                    },
                    
                },
            },
        },
    })
    end

client:on("ready", function()
    for guild in client.guilds:iter() do
        initializeCommands(guild)
        initializeCommands2(guild)
        initializeCommands1(guild)
    end
end)
client:on("slashCommand", function(interaction, command, args)
    BG = ""
    Base = ""
    Beau = ""
    if interaction.data.name == "get-users" then
        local shh, err = interaction:reply("nice")
      p(args.from.role)
      for member in interaction.guild.members:iter() do
        if member:hasRole(args.from.role) then
          BG = BG.."\n".."<@"..member.name..">"
        end
       end
       print(BG)
       interaction:reply(BG)
      end
      if interaction.data.name == "log" then
        for member in interaction.member.voiceChannel.connectedMembers:iter() do        
            local Member = Base        
            Base = Member.."\n"..member.name
        end
        interaction:reply(Base)
      end
      if interaction.data.name == "get-users-ping" then
        for member in interaction.guild.members:iter() do
            if member:hasRole(args.from.role) then
              Beau = Beau.."\n"..member.name
            end
           end
           interaction:reply(Beau)
      end
end)
    
client:run("Bot OTI4Njc3MzIzNzgyMzYxMTI4.GvW8NQ.0gZWKt4cnqw_kqeyV9qV8grvMZNRClxpnOi8ro")

