local m = Map("netwatchdog", "PPPoE网络自动检测与修复")

s = m:section(TypedSection, "main", "")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enabled", "启用NetWatchdog", "自动监控并修复网络异常")

return m
