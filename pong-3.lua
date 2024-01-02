-- WHERE THE CODE RUNS!!! REMEMBER THIS TIL YOU FINISH >:( 
-- Game 3 Update 12/27/2023
push = require 'push';

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRUTAL_WIDTH = 190
VIRUTAL_HEIGHT = 243

--speed at which we will move our paddel; multiplied by dt in update
PADDLE_SPEED = 200

-- Runs when the game first starts up, used only once; used to initialize the game

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- more "retro-looking" font abject we can use for any text
    smallFont = love.graphics.newFont('font.ttf', 8)

    --larger font for drawing the score on screen
    scoreFont = love.graphics.newFont('font.ttf', 32)

    --set LOVE2D's active font to the smallfont object
    love.graphics.setFont(smallFont)

    push:setupScreen(VIRUTAL_WIDTH, VIRUTAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
            fullscreen = false,
            resizable = false,
            vsync = true,
    })

    --initializes scores varibales, used for rendering the screen and keepping
    --track of the winnser
    player1Score = 0
    player2Score = 0

    --paddle positions on the Y axis (they can only move up or down)
    player1Y = 30;
    player2Y = VIRUTAL_HEIGHT - 50;
end

--[[ Runs every frame, with "dt" passed in, out delta in seconds
        since the last frame, which Love2D supplies us.
]]

    function love.update(dt)
        --player 1 movement
        if love.keyboard.isDown('w') then
            --add negavtive paddle speed to current Y scaled by deltaTime
            player1Y = player1Y - PADDLE_SPEED * dt
        elseif love.keyboard.isDown('s') then
            --add positive paddle speed to current Y scaled by deltaTime
            player1Y = player1Y + PADDLE_SPEED * dt
        end

        --player 2 movement
        if love.keyboard.isDown('up') then
            -- add negavtive paddle speed to current Y scaled by deltaTime
            player2Y = player2Y + -PADDLE_SPEED * dt
        elseif love.keyboard.isDown('s') then
            --add positive paddle speed to current Y scaled by deltaTime
            player2Y = player2Y + PADDLE_SPEED * dt
        end
    end


function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LOVE gives us to terminate application
        love.event.quit()
    end
end

-- Called after update by LOVE2D, used to draw anything to the screen

function love.draw()
    -- begin rendering at virtual resolution
    push:apply('start')

    --clear the screen with a specific color; in this case, a color similar
    --to some versions of the original Pong
    --love.graphics.clear(40, 45, 52, 255)

    --draw welcome text toward the top of the screen
    love.graphics.setFont(smallFont)
    love.graphics.printf('Hello Pong', 0, 20, VIRUTAL_WIDTH, 'center')

    -- draw score on the left and right center of the screen
    --need to switch font to draw before  actually printing
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRUTAL_WIDTH / 2 - 50, VIRUTAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRUTAL_WIDTH / 2 + 30, VIRUTAL_HEIGHT / 3)

    --paddles are simply rectangles we draw ib rge screen at certain points,
    --as is the ball

    --render first paddle (left side)
    love.graphics.rectangle('fill', 30, 30, 5, 20)

    --render second paddle (right side)
    love.graphics.rectangle('fill', VIRUTAL_WIDTH - 30, VIRUTAL_HEIGHT - 50, 5, 20)

    --render ball (center)
    love.graphics.rectangle('fill', VIRUTAL_WIDTH/2 - 2, VIRUTAL_HEIGHT / 2 -2, 4, 4)

    -- end rendering at virtual resolution
    push:apply('end')
end