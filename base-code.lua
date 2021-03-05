CAMERA = {
 X = 0,
 Y = 0
}
sprites = {
 e, p
}
GUI = {
 gui
}
function CHECKCOLSPR(one,onew,oneh,onex,oney,two,twow,twoh,twox,twoy)
 touching = false
 if(one.x+onew+onex>two.x+twox and one.y+oneh+oney>two.y+twoy and one.x+onex<two.x+twow+twox and one.y+oney<two.y+twoh+twoy) then
  touching = true
 end
 return touching
end
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




function TIC()
 RENDER()
end
