-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

listSprite = {}

--creation fonction usine de sprite
function creatSprite(pType, pX, pY)
    local sprite = {}
    sprite.type = pType
    sprite.x = pX
    sprite.y = pY
    table.insert(listSprite, sprite)
    return sprite
end


function love.load()
    hero1 = creatSprite("hero", 10, 10)
    print("hero est positioner a : "..hero1.x)

end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)
end
