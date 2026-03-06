listSprite = {}

--creation fonction usine de sprite
function creatSprite(pType, pX, pY, pW, pH)
    local sprite = {}
    sprite.type = pType
    sprite.x = pX
    sprite.y = pY
    sprite.width = pW
    sprite.height = pH
    sprite.rotation = 0
    sprite.scaleX = 1
    sprite.scaleY = 1
    sprite.speed = 0
    sprite.image = nil
    sprite.radius = 0
    sprite.del = false
    table.insert(listSprite, sprite)
    return sprite
end

return listSprite