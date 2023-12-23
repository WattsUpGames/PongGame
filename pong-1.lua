-- Game 1 Update 12/12/2023
push = require 'push';

WINDOW_WIDTH = 1280;
WINDOW_HEIGHT = 720;

VIRUTAL_WIDTH = 432;
VIRUTAL_HEIGHT = 243;

-- Runs when the game first starts up, used only once; used to initialize the game

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRUTAL_WIDTH, VIRUTAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT{
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

    --condensed onto one line from last example
    --note we are now using virtual width and height now fro text placement
    love.graphics.printf('Hello Pong!', 0, VIRUTAL_HEIGHT / 2 - 6, VIRUTAL_WIDTH)

    -- end rendering at virtual resolution
    push:apply('end')
end