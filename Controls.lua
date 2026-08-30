-- File: Controls.lua

function touched(touch)
    if touch.state == BEGAN then
        local cam = scene.camera:get(craft.camera)
        
        if cam then
            -- Genera il raggio dallo schermo verso lo spazio 3D
            local ray = cam:screenToRay(vec2(touch.x, touch.y))
            
            -- Effettua il raycast direttamente sul volume dei voxel
            local hit = voxels:raycast(ray)
            
            if hit then
                if touch.tapCount == 1 then
                    -- Singolo tocco: Distruggi il blocco colpito
                    local p = hit.point - hit.normal * 0.5
                    local bx = math.floor(p.x + 0.5)
                    local by = math.floor(p.y + 0.5)
                    local bz = math.floor(p.z + 0.5)
                    voxels:set(bx, by, bz, 0)
                    
                elseif touch.tapCount == 2 then
                    -- Doppio tocco: Piazza il blocco selezionato sulla faccia colpita
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
