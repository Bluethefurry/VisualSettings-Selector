files = {
	{file = "default.dat", label = "Default", default = true}, 
	-- make sure to also add these in the __resource.lua
	-- file = filename inside /data, 
	-- default = "reset to default" button will reset it to that file, don't change that
	-- set = gets set automatically when joining ( not finished )

	{file = "visualv.dat", label = "VisualV", set = false}, -- visuallv file.
	{file = "raturalrealism.dat", label = "Natural Realism", set = false}, -- blü's visualsettings
	{file = "els.dat", label = "ELS", set = true}, -- blü's visualsettings
}

for i,file in ipairs(files) do
	file.file = "files/"..file.file 
end
