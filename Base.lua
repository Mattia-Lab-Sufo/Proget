-- File: Main.lua

function setup()
    scene = craft.scene()
    
    -- Configurazione Telecamera Nativa
    scene.camera.position = vec3(16, 15, -10)
    scene.camera.rotation = quat.eulerAngles(25, 0, 0)
    
    -- Configurazione Volume Voxel
    worldEntity = scene:entity()
    voxels = worldEntity:add(craft.volume, 32, 32, 32)
    
    -- Inizializzazione blocchi e mappa
    setupBlocks()
    generateTerrain()
    
    selectedBlock = 1
end

function update(dt)
    scene:update(dt)
end

function draw()
    update(DeltaTime)
    scene:draw()
    
    -- Mirino al centro
    pushStyle()
    stroke(255)
    strokeWidth(2)
    line(WIDTH/2 - 8, HEIGHT/2, WIDTH/2 + 8, HEIGHT/2)
    line(WIDTH/2, HEIGHT/2 - 8, WIDTH/2, HEIGHT/2 + 8)
    popStyle()
end
