-- Cette ligne permet d'afficher des traces dans la console pendant l'exécution
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter("nearest")

local Tetros = {}

Tetros[1] = {
    {
        {0, 0, 0, 0},
        {0, 0, 0, 0},
        {1, 1, 1, 1},
        {0, 0, 0, 0}
    },
    {
        {0, 1, 0, 0},
        {0, 1, 0, 0},
        {0, 1, 0, 0},
        {0, 1, 0, 0}
    }
}

Tetros[2] = {
    {
        {0, 0, 0, 0},
        {0, 1, 1, 0},
        {0, 1, 1, 0},
        {0, 0, 0, 0}
    }
}

Tetros[3] = {
    {
        {0, 0, 0},
        {1, 1, 1},
        {0, 0, 1}
    },
    {
        {0, 1, 0},
        {0, 1, 0},
        {1, 1, 0}
    },
    {
        {1, 0, 0},
        {1, 1, 1},
        {0, 0, 0}
    },
    {
        {0, 1, 1},
        {0, 1, 0},
        {0, 1, 0}
    }
}

Tetros[4] = {
    {
        {0, 0, 0},
        {1, 1, 1},
        {1, 0, 0}
    },
    {
        {1, 1, 0},
        {0, 1, 0},
        {0, 1, 0}
    },
    {
        {0, 0, 1},
        {1, 1, 1},
        {0, 0, 0}
    },
    {
        {0, 1, 0},
        {0, 1, 0},
        {0, 1, 1}
    }
}

Tetros[5] = {
    {
        {0, 0, 0},
        {0, 1, 1},
        {1, 1, 0}
    },
    {
        {1, 0, 0},
        {1, 1, 0},
        {0, 1, 0}
    }
}

Tetros[6] = {
    {
        {0, 0, 0},
        {1, 1, 1},
        {0, 1, 0}
    },
    {
        {0, 1, 0},
        {1, 1, 0},
        {0, 1, 0}
    },
    {
        {0, 1, 0},
        {1, 1, 1},
        {0, 0, 0}
    },
    {
        {0, 1, 0},
        {0, 1, 1},
        {0, 1, 0}
    }
}

Tetros[7] = {
    {
        {0, 0, 0},
        {1, 1, 0},
        {0, 1, 1}
    },
    {
        {0, 1, 0},
        {1, 1, 0},
        {1, 0, 0}
    }
}

local currentTetros = 1
local currentRotation = 1

local Grid = {}

function love.load()
    screen_width = love.graphics.getWidth()
    screen_heigth = love.graphics.getHeight()
end

function love.update(dt)
end

function love.draw()
    local Shape = Tetros[currentTetros][currentRotation]

    for l = 1, #Shape do
        for c = 1, #Shape[l] do
            local x = (c - 1) * 32
            local y = (l - 1) * 32
            if Shape[l][c] == 1 then
                love.graphics.setColor(1, 1, 1)
                love.graphics.rectangle("fill", x, y, 31, 31)
            else
                love.graphics.setColor(1, 1, 1, .25)
                love.graphics.rectangle("fill", x, y, 31, 31)
            end
        end
    end
end

function love.keypressed(key)
    if key == "r" then
        currentRotation = currentRotation + 1
        if currentRotation > #Tetros[currentTetros] then
            currentRotation = 1
        end
    end

    if key == "t" then
        currentTetros = currentTetros + 1
        currentRotation = 1
        if currentTetros > #Tetros then
            currentTetros = 1
        end
    end
end
