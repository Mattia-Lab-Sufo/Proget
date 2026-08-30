-- File: Blocks.lua

function setupBlocks()
    -- Registrazione dei blocchi con ID e Colore
    craft.block.register{ id = 1, name = "Grass", color = color(90, 180, 60) }
    craft.block.register{ id = 2, name = "Dirt", color = color(130, 85, 45) }
    craft.block.register{ id = 3, name = "Stone", color = color(120, 120, 120) }
    craft.block.register{ id = 4, name = "Wood", color = color(100, 60, 30) }
end

function generateTerrain()
    local scale = 0.08
    
    for x = 0, 31 do
        for z = 0, 31 do
            -- Generazione altezza con Perlin Noise
            local h = math.floor(noise(x * scale, z * scale) * 6) + 4
            
            for y = 0, h do
                if y == h then
                    voxels:set(x, y, z, 1) -- Erba
                elseif y > h - 3 then
                    voxels:set(x, y, z, 2) -- Terra
                else
                    voxels:set(x, y, z, 3) -- Pietra
                end
            end
        end
    end
end
