local readfile
if love then
	readfile = function(name)
		if not love.filesystem.exists(name) then return false end
		return love.filesystem.read(name)
	end
else
	readfile = function(name)
		local f = io.open(name, "r")
		if not f then return false end
		local contents = f:read("*a")
		f:close()
		return contents
	end
end

local varname = "([%w%d%.:_%[%]]+)"

local substitionrules = {
	[varname .. "%s*%+="] = "%1 = %1 + ",
	[varname .. "%s*%-="] = "%1 = %1 - ",
	[varname .. "%s*%*="] = "%1 = %1 * ",
	[varname .. "%s*/="] = "%1 = %1 / ",
	[varname .. "%s*^="] = "%1 = %1 ^ ",
	[varname .. "%s*%%="] = "%1 = %1 %% ",
	[varname .. "%s*&&="] = "%1 = %1 and ",
	[varname .. "%s*||="] = "%1 = %1 or ",
	[varname .. "%+%+"] = "%1 = %1 + 1",
	[varname .. "%-%-"] = "%1 = %1 - 1"
}

table.insert(package.loaders, function(name)
	local tokenized_name = name:gsub("%.", "/") .. ".m.lua"
	local contents = readfile(tokenized_name)
	if not contents then return nil end
	for i, v in pairs(substitionrules) do
		contents = contents:gsub(i, v)
	end
	return assert(loadstring(contents, tokenized_name))
end)

