_G._hitbox_drawing_enabled = not _G._hitbox_drawing_enabled
_G._hitbox_mask = World:make_slot_mask(1,14,25,39)--World:make_slot_mask(3, 12, 16, 17, 25)--World:make_slot_mask(1, 25)
_G._hitbox_pen = Draw:pen(Color(1, 1, 1))
Hooks:PostHook(GameSetup, "update", "update_test", function ()
    local cam = managers.viewport:get_current_camera()
    if not _G._hitbox_drawing_enabled or not alive(cam) then
        return
    end
    for _, body in ipairs(World:find_bodies("intersect", "sphere", cam:position(), 100000, _G._hitbox_mask)) do
        _G._hitbox_pen:body(body)
    end
end)
managers.chat:_receive_message(1, "SYSTEM", _G._hitbox_drawing_enabled and "Enabled hitbox drawing" or "Disabled hitbox drawing", tweak_data.system_chat_color)