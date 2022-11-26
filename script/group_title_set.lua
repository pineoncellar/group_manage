gapi = require("gocq_api")

local seter = string.match(msg.fromMsg, "=(%d+)]")
local find, _ = string.find(msg.fromMsg, "头衔")
local title = string.match(msg.fromMsg, "(.*)", find + 1)

if getUserConf(getDiceQQ(), "群管指令权限开放", false) or getGroupConf(msg.gid, "群管指令权限开放", false) then
    if not seter then
        return "请艾特对象"
    elseif not title then
        return "请写出要设置的头衔"
    else
        gapi.http_post("set_group_special_title", msg.gid, seter, title)
        return "设置头衔成功"
    end
elseif msg.grpAuth >= 2 or getUserConf(msg.uid, "trust", 0) >= 4 then
    if not seter then
        return "请艾特对象"
    elseif not title then
        return "请写出要设置的头衔"
    else
        gapi.http_post("set_group_special_title", msg.gid, seter, title)
        return "设置头衔成功"
    end
else
    return "你没有权限哦"
end
