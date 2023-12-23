-- Game 0 Update 12/12/2023

WINDOW_WIDTH = 1280;
WINDOW_HEIGHT = 720;

-- Runs when the game first starts up, used only once; used to initialize the game

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false;
        resizable = false;
        vsync = true;
    })
end

-- Called after update by LOVE2D, used to draw anything to the screen

function love.draw()
    love.graphics.printf(
        'Hello Pong!', --text to render
        0,
        WINDOW_HEIGHT / 2 - 6,
        WINDOW_WIDTH,
        'center')
end