-- File: Main.lua

function setup()
    -- Scena 3D
    scene = craft.scene()
    
    -- Telecamera
    scene.camera.position = vec3(16, 15, -10)
    scene.camera:get(craft.camera).fov = 60
    scene.camera:get(craft.camera).rotation = quat.eulerAngles(25, 0, 0)
    
    -- Luce
    local sun = scene:entity()
    sun:add(craft.light, craft.light.directional)
    sun.rotation = quat.eulerAngles(45, 45, 0)
    
    -- Creazione del Mondo Voxel
    worldEntity = scene:entity()
    voxels = worldEntity:add(craft.volume, 32, 32, 32)
    
    -- Inizializza i blocchi e il terreno
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
    
    -- Disegna l'interfaccia 2D (Mirino)
    pushStyle()
    stroke(255)
    strokeWidth(2)
    line(WIDTH/2 - 8, HEIGHT/2, WIDTH/2 + 8, HEIGHT/2)
    line(WIDTH/2, HEIGHT/2 - 8, WIDTH/2, HEIGHT/2 + 8)
    popStyle()
end
