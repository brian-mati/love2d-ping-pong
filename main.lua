--[[
-- SINGLE PLAYER PING PONG
--## Todos 
--1. Draw racket and ball 
--2. Get map racket to W.A.S.D movement keys 
-- 3. Setup movement and collisions for ball 
--]]
--
racket = {
  mode = "fill",
  x_axis_position = 20,
  y_axis_position = 20,
  width = 20,
  height = 80,
  speed = 5,
}

ball = {
  mode = "fill",
  x_axis_position = 50 , 
  y_axis_position = 20,
  radius = 20
}

function love.load()
  -- rect_mode,x,y,w,h = "fill",20,20,20,80
  -- circle_mode,x,y,radius="fill",50,20,20

end
function love.update(dt)
  if love.keyboard.isDown("down") then
      racket.y_axis_position = racket.y_axis_position + racket.speed 
  end
   if love.keyboard.isDown("up") then
      racket.y_axis_position = racket.y_axis_position - racket.speed 
  end 

end

function love.draw()
    -- love.graphics.print('Hello World!', 400, 300)
    --rectangle 
    love.graphics.setColor(0,0.4,0,4)
    love.graphics.rectangle(racket.mode,racket.x_axis_position,racket.y_axis_position,racket.width,racket.height)
    -- 
  
  end
