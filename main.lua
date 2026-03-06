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

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

function love.load()
    --=================
    --création du hero
    --=================
    --print("Création du hero")
    hero1 = creatSprite("hero",  WindowWidth/2 - 50 , WindowHeight - 60, 50, 50)
    hero1.speed = 400

    -- Timer pour le spawn des ennemis
    enemySpawnTimer = 0


end

function love.update(dt)

    --=================================================
    --spawn creation des enemies toutes les 5 secondes
    --=================================================
    enemySpawnTimer = enemySpawnTimer + dt
    if enemySpawnTimer >= 5 then
        for i = 1, math.random(1, 3) do
            enemy = creatSprite("enemy", math.random(0, WindowWidth - 50), math.random(0, WindowHeight/2), 50, 50)
        end
        enemySpawnTimer = 0
    end

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

    --=======================
    --update des enemies
    --=======================
    for i, sprite in ipairs(listSprite) do
        if sprite.type == "enemy" then
            sprite.y = sprite.y + 100 * dt
            if sprite.y > WindowHeight then
                sprite.del = true
            end
        end
    end

    --=======================
    --suppression des enemies
    --=======================
    for i = #listSprite, 1, -1 do
        if listSprite[i].del == true then
            table.remove(listSprite, i)
        end
    end
    
    --=======================
    --collision bullet-enemy
    --=======================
    for i, sprite in ipairs(listSprite) do 
        if sprite.type == "bullet" then
            for j, sprite2 in ipairs(listSprite) do
                if sprite2.type == "enemy" then
                    if CheckCollision(sprite.x - sprite.radius, 
                                      sprite.y - sprite.radius, 
                                      sprite.radius*2, 
                                      sprite.radius*2, 
                                      sprite2.x, sprite2.y, 
                                      sprite2.width, 
                                      sprite2.height) then
                        sprite.del = true
                        sprite2.del = true
                    end
                end
            end
        end
    end

end

function love.draw()
    --==============
    --draw du hero
    --==============
    love.graphics.rectangle("fill", hero1.x, hero1.y, hero1.width, hero1.height)

    --==========================
    --affichage des bullets
    --==========================
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

    --==========================
    --affichage enemies
    --==========================
    for i, sprite in ipairs(listSprite) do
        if sprite.type == "enemy" then
            love.graphics.rectangle("fill", sprite.x, sprite.y, sprite.width, sprite.height)
        end
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
