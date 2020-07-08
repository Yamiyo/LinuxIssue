local jwt_pkg = require "jwt"
local lunajson = require "lunajson"

-- print(jwt_pkg)
-- local t = os.execute("echo 'test'")
-- print(t)

-- jwt_pkg:encode()

-- local jsonraw = '{"test":[1,2,3,4]}'
-- local jsonparse = lunajson.decode(jsonraw)

-- print(
-- jsonparse["test"][1] .. ", " .. jsonparse["test"][2] .. ", " .. jsonparse["test"][3] .. ", " .. jsonparse["test"][4]
-- )

local test = {["cat"] = {["name"] = "MeowMeow", ["age"] = 5}, ["dog"] = {["name"] = "Good Boy", ["age"] = 12}}

local json_str = lunajson.encode(test)

print(json_str)

local addrs = nil

function setup(thread)
	if not addrs then
		addrs = wrk.lookup(wrk.host, wrk.port or "http")
		-- refer : http://www.lua.org/manual/5.1/manual.html#2.5.5
		-- 		 : https://stackoverflow.com/a/17974661
		-- `#` 表示長度: 通常用來規避 table 中有 nil 值的情境
		for i = #addrs, 1, -1 do
			if not wrk.connect(addrs[i]) then
				table.remove(addrs, i)
			end
		end
	end

	thread.addr = addrs[math.random(#addrs)]
end

function init(args)
	local msg = "thread addr: %s"
	print(msg:format(wrk.thread.addr))
	print(jwt_pkg.encode(json_str))
end

print(jwt_pkg.encode(json_str))

