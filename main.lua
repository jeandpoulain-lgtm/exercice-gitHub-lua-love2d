-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

require "spriteManager"
WindowWidth = love.graphics.getWidth()
WindowHeight = love.graphics.getHeight()

function love.load()
    hero1 = creatSprite("hero",  WindowWidth/2 - 50 , WindowHeight - 60, 50, 50)
    hero1.speed = 400
end

function love.update(dt)

    if love.keyboard.isDown("right") then
        hero1.x = hero1.x + hero1.speed * dt
        if hero1.x > WindowWidth - hero1.width then
            hero1.x = WindowWidth - hero1.width
        end
    end

    if love.keyboard.isDown("left") then
        hero1.x = hero1.x - hero1.speed * dt
        if hero1.x < 0 then
            hero1.x = 0
        end
    end
         
end

function love.draw()
    love.graphics.rectangle("fill", hero1.x, hero1.y, hero1.width, hero1.height)
end

function love.keypressed(key)

    if key == "space" then
        
    end

end
