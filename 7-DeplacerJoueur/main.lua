-- les includes


-- les variables 
player = {}
player.size = 64
player.posX = 128
player.posY = 128
player.speed = 500

enemy = {}
enemy.x = 512
enemy.y = 192

score = 5

-- police écriture

font = love.graphics.newFont("assets/fonts/mrrobot.ttf", 24)
-- fonctions love2d
function love.load() -- initialiser, se charge au lancement
	-- pour avoir un random aléatoire
	math.randomseed(os.time())
	love.graphics.setBackgroundColor(1,1,1)
end

function love.update(dt) -- tourne en boucle, 60 fois par seconde
	input_utilisateur(dt)
end

function love.draw() -- dessine à l'écran
	love.graphics.setColor(0, 0, 1, 0.8)
	love.graphics.rectangle("fill", player.posX, player.posY, player.size, player.size)
	love.graphics.setColor(1, 0, 0, 0.8)
	love.graphics.rectangle("line", enemy.x, enemy.y, player.size, player.size)

	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.setFont(font)
	love.graphics.printf("Pos joueur :"..player.posX..", "..player.posY, 25, 25, 1280, "center")
end

-- custom functions
function input_utilisateur(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end


	if love.keyboard.isDown("up") then
		player.posY = player.posY - player.speed * dt
	elseif love.keyboard.isDown("down") then
		player.posY = player.posY + player.speed * dt
	elseif love.keyboard.isDown("right") then
		player.posX = player.posX + player.speed * dt
	elseif love.keyboard.isDown("left") then
		player.posX = player.posX - player.speed * dt
	end
end


