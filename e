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