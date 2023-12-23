-- Game 2 Update 12/12/2023
push = require 'push';

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRUTAL_WIDTH = 190
VIRUTAL_HEIGHT = 243

-- Runs when the game first starts up, used only once; used to initialize the game

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- more "retro-looking" font abject we can use for any text
    smallFont = love.graphics.newFont('font.ttf', 8)

    --set LOVE2D's active font to the smallfont object
    love.graphics.setFont(smallFont)

    push:setupScreen(VIRUTAL_WIDTH, VIRUTAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
            fullscreen = false,
            resizable = false,
            vsync = true,
    })
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
    love.graphics.clear(40, 45, 52, 255)

    --draw welcome text toward the top of the screen
    love.graphics.printf('Hello Pong', 0, 20, VIRUTAL_WIDTH, 'center')

    --paddles are simplt rectangles we draw ib rge screen at certain points,
    --as is the ball

    --render first paddle (left side)
    love.graphics.rectangle('fill', 10, 30, 5, 20)

    --render second paddle (right side)
    love.graphics.rectangle('fill', VIRUTAL_WIDTH - 10, VIRUTAL_HEIGHT - 50, 5, 20)

    --render ball (center)
    love.graphics.rectangle('fill', VIRUTAL_WIDTH/2 - 2, VIRUTAL_HEIGHT / 2 -2, 4, 4)

    -- end rendering at virtual resolution
    push:apply('end')
end