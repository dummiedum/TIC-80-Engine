--Required:
--  Camera
--  Defining Sprites/GUI
--  Collision Checking
--  Rendering Sprites
--  Defining GUI

--Camera
CAMERA = {
 X = 0,
 Y = 0
}

--Sprite
p = {
 x = 50,
 y = 50,
 id = 256,
 colKey = 0,
 scale = 2,
 flip = 0,
 rotate = 0,
 w = 1,
 h = 1,
	hidden = 1
}

--Sprite
e = {
 x = 0,
 y = 0,
 id = 257,
 colKey = 0,
 scale = 2,
 flip = 0,
 rotate = 0,
 w = 1,
 h = 1
}

gui = {
 x = 0,
 y = 0,
 id = 258,
 colKey = 0,
 scale = 5,
 flip = 0,
 rotate = 0,
 w = 3,
 h = 2
}

--Defining Sprites / Z-Order (e drawn first, p drawn next, etc)
sprites = {
 e, p
}

--Defining GUI
GUI = {
 gui
}

--Collision Checking (returns true or false) args: sprite, width, height, x offset, y offset, sprite, width, height, x offset, y offset
function CHECKCOLSPR(one,onew,oneh,onex,oney,two,twow,twoh,twox,twoy)
 touching = false
 if(one.x+onew+onex>two.x+twox and one.y+oneh+oney>two.y+twoy and one.x+onex<two.x+twow+twox and one.y+oney<two.y+twoh+twoy) then
  touching = true
 end
 return touching
end

--Rendering Sprites/GUI
function RENDER()
 cls()
 map(CAMERA.X/8,CAMERA.Y/8)
 for i=1,#sprites do
	 if sprites[i].hidden ~= 1 then
   spr(sprites[i].id,sprites[i].x-CAMERA.X,sprites[i].y-CAMERA.Y,sprites[i].colKey,sprites[i].scale,sprites[i].flip,sprites[i].rotate,sprites[i].w,sprites[i].h)
  end
	end
 for i=1,#GUI do
	 if GUI[i].hidden ~= 1 then
   spr(GUI[i].id,GUI[i].x,GUI[i].y,GUI[i].colKey,GUI[i].scale,GUI[i].flip,GUI[i].rotate,GUI[i].w,GUI[i].h)
  end
	end
end

--TIC Function
function TIC()
 RENDER()
 print(CHECKCOLSPR(p,16,16,0,0,e,16,16,0,0))
end
