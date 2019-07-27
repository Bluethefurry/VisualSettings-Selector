files = {
	{file = "default.dat", label = "Default", default = true}, 
	-- make sure to also add these in the __resource.lua
	-- file = filename incl. folder path, if any, default = "reset to default" button will reset it to that file
	-- always update the default.dat file in case of game updates
	-- set = gets set automatically when joining

	{file = "visualv.dat", label = "VisualV", set = false}, -- visuallv file.
	{file = "raturalrealism.dat", label = "Natural Realism", set = false}, -- blü's visualsettings
	{file = "els.dat", label = "ELS", set = true}, -- blü's visualsettings
}

for i,file in ipairs(files) do
	file.file = "files/"..file.file 
end