--[[
-- SINGLE PLAYER PING PONG
--## Todos 
-- 1. 
--]]
--


function love.load()
  buf_width, buf_height = love.graphics.getDimensions( )

  racket = {
  mode = "fill",
  x_axis = 20,
  y_axis = 0,
  width = 20,
  height = 80,
  velocity = 200,
}

ball = {
  mode = "fill",
  x_axis = buf_width/2, 
  y_axis = buf_height/2,
  x_velocity = 200,
  y_velocity = 200,
  radius = 20,
}
function checkCircleToRectangleCollision(ball,racket)
	local nearestX = math.max(racket.x_axis, math.min(ball.x_axis, racket.x_axis + racket.width))
	local nearestY = math.max(racket.y_axis, math.min(ball.y_axis, racket.y_axis + racket.height))
	local dx, dy = math.abs(ball.x_axis - nearestX), math.abs(ball.y_axis - nearestY)
  local ball_diameter = ball.radius*ball.radius
	if dx > ball.radius or dy > ball.radius then return false end
	return dx*dx + dy*dy < ball_diameter
end

end
function love.update(dt)
ball.x_axis = ball.x_axis + ball.x_velocity * dt

  ball.y_axis = ball.y_axis + ball.y_velocity * dt
   -- Racket movement

  if love.keyboard.isDown("down") then
      racket.y_axis = racket.y_axis + racket.velocity * dt
  end
   if love.keyboard.isDown("up") then
      racket.y_axis = racket.y_axis - racket.velocity * dt
  end 
 
  if racket.y_axis <= 0  then 
    racket.y_axis = 0 
  end

  if racket.y_axis + racket.height > buf_height then 
    racket.y_axis =  buf_height -  racket.height
  end
  -- ================ -- 

  -- Ball bounce physics 
  if ball.x_axis + ball.radius  >= buf_width or ball.x_axis  - ball.radius < 0 then
    ball.x_velocity = -ball.x_velocity
end

  if ball.y_axis + ball.radius >= buf_height or ball.y_axis  - ball.radius < 0 then
    ball.y_velocity = -ball.y_velocity
end
  -- ============== --

    if checkCircleToRectangleCollision(ball,racket) then 
    ball.x_velocity = -ball.x_velocity
  end
end

function love.draw()
    love.window.setTitle("Ping pong")
    -- love.graphics.print('Hello World!', 400, 300)
    --rectangle 
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle(racket.mode,racket.x_axis,racket.y_axis,racket.width,racket.height)
    -- 
    love.graphics.setColor(1,1,1)
    love.graphics.circle(ball.mode,ball.x_axis,ball.y_axis,ball.radius)
    
  end
