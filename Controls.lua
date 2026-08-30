-- File: Controls.lua

function touched(touch)
    if touch.state == BEGAN then
        -- Recupera la componente telecamera dall'entità
        local cam = scene.camera:get(craft.camera)
        
        if cam then
            -- Crea il raggio dal punto in cui tocchi lo schermo
            local ray = cam:screenToRay(vec2(touch.x, touch.y))
            local hit = scene:raycast(ray)
            
            if hit and hit.entity == worldEntity then
                if touch.tapCount == 1 then
                    -- Singolo tocco: Rompi il blocco (identifica il blocco centrato)
                    local p = hit.point - hit.normal * 0.5
                    local bx = math.floor(p.x + 0.5)
                    local by = math.floor(p.y + 0.5)
                    local bz = math.floor(p.z + 0.5)
                    voxels:set(bx, by, bz, 0)
                    
                elseif touch.tapCount == 2 then
                    -- Doppio tocco: Piazza il blocco sulla faccia colpita
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
