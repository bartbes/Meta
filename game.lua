function love.load()
	timer = 0
	frames = 0
end

function love.update(dt)
	timer += dt
	frames++
	local oldtimer= timer
	timer %= 5
	if timer ~= oldtimer then
		frames = 0
	end
end

function love.draw()
	love.graphics.print("Time: " .. timer, 50, 50)
	love.graphics.print("Frames: " .. frames, 50, 64)
	love.graphics.print("Average FPS: " .. math.floor(frames/timer), 50, 78)
end
