-- File: Controls.lua

function touched(touch)
    if touch.state == BEGAN then
        -- Raggio dal centro della telecamera
        local ray = scene.camera:get(craft.camera):screenPointToRay(vec2(touch.x, touch.y))
        local hit = scene:raycast(ray)
        
        if hit then
            if touch.tapCount == 1 then
                -- Singolo tocco: Rompi il blocco
                local p = hit.point - hit.normal * 0.5
                local bx, by, bz = math.floor(p.x + 0.5), math.floor(p.y + 0.5), math.floor(p.z + 0.5)
                voxels:set(bx, by, bz, 0)
            elseif touch.tapCount == 2 then
                -- Doppio tocco: Piazza il blocco
                local p = hit.point + hit.normal * 0.5
                local bx, by, bz = math.floor(p.x + 0.5), math.floor(p.y + 0.5), math.floor(p.z + 0.5)
                voxels:set(bx, by, bz, selectedBlock)
            end
        end
    end
end
