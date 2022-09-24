local dia = require("discordia")
local dcmd = require("discordia-commands")
local optionType = dia.enums.appCommandOptionType
dia.extensions()

local commandType = dia.enums.appCommandType
-- required to initialize:
local CLIENT = dia.Client():useApplicationCommands()
local test = 802914516542554153
CLIENT:on("ready", function()
      CLIENT:createGuildApplicationCommand(5, {
            name = "test",
            description = "Testing slash commands",
            type = dia.enums.appCommandType.chatInput,

  CLIENT:on("slashCommand", function(interaction, command, args)
      interaction:reply("nice")
      print("nice")
if command.name == "testing" then
      print("nice")
end
end)
CLIENT:run('Bot NzQxMzI4ODk4NTU3NzM5MTUw.GOdkQ2.amG7-pK0PgLxKMU3PnaOZeu-3CmSx8WSsv8Ncs')
