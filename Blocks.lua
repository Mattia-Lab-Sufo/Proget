-- File: Blocks.lua

function setupBlocks()
    craft.block.register{ id = 1, name = "Grass", color = color(90, 180, 60) }
    craft.block.register{ id = 2, name = "Dirt", color = color(130, 85, 45) }
    craft.block.register{ id = 3, name = "Stone", color = color(120, 120, 120) }
end

function generateTerrain()
    local scale = 0.08
    for x = 0, 31 do
        for z = 0, 31 do
            local h = math.floor(noise(x * scale, z * scale) * 6) + 4
            for y = 0, h do
                if y == h then
                    voxels:set(x, y, z, 1)
                elseif y > h - 3 then
                    voxels:set(x, y, z, 2)
                else
                    voxels:set(x, y, z, 3)
                end
            end
        end
    end
end
