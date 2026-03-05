-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

sprite = require "spriteManager"


function love.load()
    hero1 = creatSprite("hero", 10, 10)
    print("hero est positioner a : "..hero1.x)
    hero2 = creatSprite("enemie1", 100, 100)
    print("l enemie est positioner en: ".. hero2.x.." "..hero2.y)
end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)
end
