module("luci.controller.verysync", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/verysync") then
		return
	end

	entry({"admin", "services", "verysync"}, cbi("verysync"), _("Verysync"), 10).dependent = true
	entry({"admin", "services", "verysync", "status"}, call("act_status")).leaf = true
end

function act_status()
  local e = {}
  e.running = luci.sys.call("pgrep verysync >/dev/null") == 0
  local port = luci.sys.exec("uci -q get verysync.verysync.port 2>/dev/null || uci -q get verysync.@verysync[0].port 2>/dev/null")
  e.port = tonumber(port) or 0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
