--[[
-- SINGLE PLAYER PING PONG
--## Todos 
--1. Draw racket and ball 
--2. Get map racket to W.A.S.D movement keys 
-- 3. Setup movement and collisions for ball 
--]]
--

function love.load()
  x,y,w,h = 20,20,20,80
end
function love.draw()
    -- love.graphics.print('Hello World!', 400, 300)
    love.graphics.setColor(0,0.4,0,4)
    love.graphics.rectangle("fill",x,y,w,h)
end
