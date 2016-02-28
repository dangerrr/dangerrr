do

local function run(msg, matches)
  -- User submitted a user name
  if matches[1] == "name" then
    user_ = matches[2]
    user_ = string.gsub(user_," ","_")  
  -- User submitted an id
  elseif matches[1] == "id" then
    user_ = matches[2]
    user_ = 'user#id'..user_
  end

  -- The message must come from a chat group
  if msg.to.type == 'chat' then
    chat_id_ = 'chat#id'..msg.to.id

  print ("Trying to add: "..user_.." to "..chat_id_)
  local success = chat_add_user (chat_id_, user_, ok_cb, false)
  if not success then
    user_ = nil
    chat_id_ = nil
    return "ErorEcc"
  else
    local added = "Added user: "..user_.." to "..chat_id_
    user_ = nil
    chat_id_ = nil
    return added
  end
    else 
    return 'This isnt a chat group!'
  end
end

return {
  description = "Invite other user to the chat group",
  usage = {
    "!invite name [user_name]", 
    "!invite id [user_id]" },
  patterns = {
    "^!invite (name) (.*)",
    "^!invite (id) (%d+)"
  }, 
  run = run 
}

end
