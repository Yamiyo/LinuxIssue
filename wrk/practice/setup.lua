local http = require "socket.http"
local cjson = require "cjson"
local cjson_safe = require "cjson.safe"
local jwt = require "jwt"

local data = ""
local addr = nil

local function collect(chunk)
	if chunk ~= nil then
		data = data .. chunk
	end
	return true
end

-- "http://104.155.197.92/cache.txt"
function pre_request(request_url)
	local ok, statusCode, headers, statusText =
		http.request {
		method = "GET",
		url = request_url,
		sink = collect
	}
end

requests = pre_request("http://104.155.197.92/cache.txt")

function setup(thread)
	payload = cjson.encode(data)
	print(payload)
end

request = function()
	return wrk.format("POST", "/echo/api/echo_something", nil, jwt.encode(data))
	-- return wrk.format("POST", "/echo/api/echo_something", nil, cjson.encode(data))
end
