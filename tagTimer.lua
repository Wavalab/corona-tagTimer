--[[
  local timer = require("tagTimer")
  timer.performWithDelay(1000, function(event)
    print("Fired: " .. event.tag)
  end, 1, "myTag")
  timer.pause("myTag")
  timer.resume("myTag")
  timer.cancel("myTag")
  timer.cancel("default") -- all timers
--]]
local a={}local b=a;a=timer;a._timers={}b._funcs={performWithDelay=a.performWithDelay,cancel=a.cancel,resume=a.resume,pause=a.pause,_insert=a._insert,enterFrame=a.enterFrame}a.performWithDelay=function(...)local c;local d=arg[4]local e=nil;if d==nil then d="default"end;if arg[3]~=nil then if type(arg[3])=="string"then d=arg[3]else e=arg[3]end end;c=b._funcs.performWithDelay(arg[1],arg[2],e)c._tag=d;table.insert(a._timers,c)return c end;a.cancel=function(...)if type(arg[1])=="string"then for f,g in pairs(a._timers)do if g._tag==arg[1]then b._funcs.cancel(g)elseif arg[1]=="*"then b._funcs.cancel(g)end end else b._funcs.cancel(arg[1])end end;a.resume=function(...)if type(arg[1])=="string"then for f,g in pairs(a._timers)do if g._tag==arg[1]then b._funcs.resume(g)elseif arg[1]=="*"then b._funcs.resume(g)end end else b._funcs.resume(arg[1])end end;a.pause=function(...)if type(arg[1])=="string"then for f,g in pairs(a._timers)do if g._tag==arg[1]then b._funcs.pause(g)elseif arg[1]=="*"then b._funcs.pause(g)end end else b._funcs.pause(arg[1])end end;local h={__index=function(a,i)return b[i]end,__newindex=function(a,i,g)b[i]=g end}a=setmetatable(a,h)return a
