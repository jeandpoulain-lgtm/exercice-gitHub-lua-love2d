local listSprite = {}

--creation fonction usine de sprite
function creatSprite(pType, pX, pY)
    local sprite = {}
    sprite.type = pType
    sprite.x = pX
    sprite.y = pY
    table.insert(listSprite, sprite)
    return sprite
end

return listSprite