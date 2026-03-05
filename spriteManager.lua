listSprite = {}

--creation fonction usine de sprite
function creatSprite(pType, pX, pY)
    local sprite = {}
    sprite.type = pType
    sprite.x = pX
    sprite.y = pY
    sprite.del = false
    table.insert(listSprite, sprite)
    return sprite
end

return listSprite