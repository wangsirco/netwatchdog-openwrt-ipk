module("luci.controller.netwatchdog", package.seeall)

function index()
    entry({"admin", "services", "netwatchdog"}, cbi("netwatchdog"), _("NetWatchdog"), 80)
end
