--Required:
--  Camera
--  Defining Sprites
--  Collision Checking
--  Rendering Sprites

--Camera
CAMERA = {
 X = -20,
 Y = -20
}

--Sprite
p = {
 x = 0,
 y = 0,
 id = 256,
 colKey = 0,
 scale = 2
}

--Sprite
e = {
 x = 20,
 y = 20,
 id = 257,
 colKey = 0,
 scale = 2
}

--Defining Sprites / Z-Order (e drawn first, p drawn next, etc)
sprites = {
 e, p
}

--Collision Checking (returns true or false)
function CHECKCOLSPR(one,onew,oneh,onex,oney,two,twow,twoh,twox,twoy)
 touching = false
 if(one.x+onew+onex>two.x+twox and one.y+oneh+oney>two.y+twoy and one.x+onex<two.x+twow+twox and one.y+oney<two.y+twoh+twoy) then
  touching = true
 end
 return touching
end

--Rendering Sprites
function RENDER()
 cls()
 for i=1,#sprites do
  spr(sprites[i].id,sprites[i].x-CAMERA.X,sprites[i].y-CAMERA.Y,sprites[i].colKey,sprites[i].scale)
 end	
end

--TIC Function
function TIC()
 if btn(0) then
  p.y = p.y - 0.5
 end 
 if btn(1) then	
  p.y = p.y + 0.5
 end
 if btn(2) then
  p.x = p.x - 0.5
 end
 if btn(3) then
  p.x = p.x + 0.5
 end
 RENDER()
 print(CHECKCOLSPR(p,16,16,0,0,e,16,16,0,0))
end

