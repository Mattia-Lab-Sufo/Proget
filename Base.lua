function setup()
    -- Configurazione della scena 3D con il motore Craft
    scene = craft.scene()
    
    -- Telecamera e Posizione del Giocatore
    scene.camera.position = vec3(16, 10, 16)
    scene.camera:get(craft.camera).fov = 60
    
    -- Luce Solare
    local sun = scene:entity()
    sun:add(craft.light, craft.light.directional)
    sun.rotation = quat.eulerAngles(45, 45, 0)
    
    -- Configurazione del Mondo a Voxel (Volume)
    voxels = scene:entity():add(craft.volume, 32, 32, 32)
    voxels:add(craft.volumeData)
    
    -- Definizione dei tipi di blocco
    setupBlocks()
    
    -- Generazione del Terreno
    generateTerrain()
    
    -- Variabili di stato per l'interazione
    selectedBlock = 1 -- 1 = Erba, 2 = Terra, 3 = Pietra
end

function setupBlocks()
    -- Registrazione dei blocchi nel registro di Craft
    -- Usa colori o texture predefinite
    craft.block.register{ id = 1, name = "Grass", color = color(80, 170, 60) }
    craft.block.register{ id = 2, name = "Dirt", color = color(120, 80, 40) }
    craft.block.register{ id = 3, name = "Stone", color = color(120, 120, 120) }
end
