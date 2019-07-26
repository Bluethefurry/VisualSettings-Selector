files = {
	{file = "default.dat", label = "Default", default = true}, 
	-- make sure to also add these in the __resource.lua
	-- file = filename incl. folder path, if any, default = "reset to default" button will reset it to that file
	-- always update the default.dat file in case of game updates
	-- set = gets set automatically when joining

	{file = "visualv.dat", label = "VisualV", set = false}, -- visuallv file.
	{file = "blu.dat", label = "Example 1", set = false}, -- blü's visualsettings
	{file = "els.dat", label = "ELS", set = true}, -- blü's visualsettings

}


for i,file in ipairs(files) do
	file.file = "files/"..file.file 
end


function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end

	local t={} ; i=1

	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end

	return t
end

local function starts_with(str, start)
   return str:sub(1, #start) == start
end

function GetDefaultVisualsettingsFile()
	for i, file in ipairs(files) do 
		if file.default then
			return file.file
		end
	end
end 

function GetSetVisualsettingsFile()
	for i, file in ipairs(files) do 
		if file.set then
			return file.file
		end
	end
end 

function LoadVisualsettingsFile(file)
	local settingsFile = LoadResourceFile(GetCurrentResourceName(), file)

	local lines = stringsplit(settingsFile, "\n")
	print("Loading "..file)
	for k,v in ipairs(lines) do
		if not starts_with(v, '#') and not starts_with(v, '//') and (v ~= "" or v ~= " ") and #v > 1 then
			v = v:gsub("%s+", " ")

			local setting = stringsplit(v, " ")

			if setting[1] ~= nil and setting[2] ~= nil and tonumber(setting[2]) ~= nil then
				if setting[1] ~= 'weather.CycleDuration' then	
					Citizen.InvokeNative(GetHashKey('SET_VISUAL_SETTING_FLOAT') & 0xFFFFFFFF, setting[1], tonumber(setting[2])+.0)
					Wait(0)
				end
			end
		end
	end
	settingsFile = nil
end


Citizen.CreateThread(function()
	Wait(100)
	--LoadVisualsettingsFile(GetSetVisualsettingsFile())
end)