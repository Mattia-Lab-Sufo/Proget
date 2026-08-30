-- File: Controls.lua

function touched(touch)
    -- Controlla che voxels e la telecamera esistano prima di procedere
    if touch.state == BEGAN and voxels and scene and scene.camera then
        local cam = scene.camera:get(craft.camera)
        if cam then
            local ray = cam:screenToRay(vec2(touch.x, touch.y))
            local hit = voxels:raycast(ray)
            
            if hit then
                if touch.tapCount == 1 then
                    -- Rompi blocco
                    local p = hit.point - hit.normal * 0.5
                    local bx = math.floor(p.x + 0.5)
                    local by = math.floor(p.y + 0.5)
                    local bz = math.floor(p.z + 0.5)
                    voxels:set(bx, by, bz, 0)
                elseif touch.tapCount == 2 then
                    -- Piazza blocco
                    local p = hit.point + hit.normal * 0.5
                    local bx = math.floor(p.x + 0.5)
                    local by = math.floor(p.y + 0.5)
                    local bz = math.floor(p.z + 0.5)
                    voxels:set(bx, by, bz, selectedBlock)
                end
            end
        end
    end
end
