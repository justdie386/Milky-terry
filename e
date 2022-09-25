command, err = client:createGuildApplicationCommand(guild.id, {
    type = commandType.chatInput,
    name = "helper",
    description = ".",
    options = {
        {
            type = optionType.subCommand,
            name = "user-ping",
            description = "Convert a time from a specific IANA timezone",
            options = {
                {
                    type = optionType.string,
                    name = "get-roles",
                    description = "id",
                    required = true,
                    autocomplete = true,
                },
                type = optionType.subCommand,
                name = "get-roles-ping",
                description = "Note everyone that is in your current vc",
                options = {
                    {
                        type = optionType.string,
                        name = "role",
                        description = "id1",
                        required = true,
                        autocomplete = true,
                    },
                    
                },
                {
                    type = optionType.subCommand,
                    name = "logger",
                    description = "Note everyone that is in your current vc",
                },
                
            },
        },
    },
})

if interaction.data.name == "log" then
    if interaction.member.voiceChannel ~= nil then
    for member in interaction.member.voiceChannel.connectedMembers:iter() do        
   local Member = Base        
   Base = Member.."\n"..member.name
end
interaction:reply(Base)
end
else
interaction:reply("Not in a vc")
end