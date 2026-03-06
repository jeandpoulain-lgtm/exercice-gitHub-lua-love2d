-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

require "spriteManager"
-- Récupération de la taille de la fenêtre variable globale
WindowWidth = love.graphics.getWidth()
WindowHeight = love.graphics.getHeight()

function love.load()
    --=================
    --création du hero
    --=================
    hero1 = creatSprite("hero",  WindowWidth/2 - 50 , WindowHeight - 60, 50, 50)
    hero1.speed = 400
end

function love.update(dt)

    --====================
    --déplacement du hero
    --====================
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

    --===================
    --update des bullets
    --===================
    for i, sprite in ipairs(listSprite) do
        if sprite.type == "bullet" then
            sprite.y = sprite.y - sprite.speed * dt
            if sprite.y < 0 then
                sprite.del = true
            end
        end
    end

    --=======================
    --suppression des bullets
    --=======================
    for i = #listSprite, 1, -1 do
        if listSprite[i].del == true then
            table.remove(listSprite, i)
        end
    end

end

function love.draw()
    --==============
    --draw du hero
    --==============

    love.graphics.rectangle("fill", hero1.x, hero1.y, hero1.width, hero1.height)

    for i, sprite in ipairs(listSprite) do
        if sprite.type == "bullet" then
            love.graphics.circle("fill", sprite.x, sprite.y, sprite.radius)
        end
    end

    --===============================
    -- affichage du nombre de bullets
    --===============================
    if not debug then
        love.graphics.print("Nombre de bullets et du hero : " .. #listSprite, 10, 10)
    end



end

function love.keypressed(key)
    --=========================
    --creation d'une bullet
    --=========================
    if key == "space" then
        bullet = creatSprite("bullet", hero1.x + hero1.width/2 , hero1.y - 10, 10, 50)
        bullet.radius = 5
        bullet.speed = 500
    end

    --=========================
    --quitter le jeu
    --=========================
    if key == "escape" then
        love.event.quit()
    end 

    --=========================
    --debug mode
    --=========================
    if key == "d" then
        debug = not debug
    end
end
