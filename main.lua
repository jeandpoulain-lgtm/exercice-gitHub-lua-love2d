-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

sprite = require "spriteManager"



function love.load()
    hero1 = creatSprite("hero", 10, 50)
    
    hero2 = creatSprite("enemie1", 100, 100)
    
end

function love.update(dt)
    

     
end

function love.draw()
    
    love.graphics.rectangle("fill", hero1.x, hero1.y, 50, 50)
end

function love.keypressed(key)

    if key == "space" then
        
    end

end
