do
local function run(msg, matches)
local sudo = 35254781
    if matches[1]:lower() == "مدیرو بیار" then
       chat_add_user("chat#id"..msg.to.id, 'user#id'..sudo, ok_cb, false)
    end
end
 
return {
  patterns = {
    "^(مدیرو بیار)$",
  },
  run = run
}
end