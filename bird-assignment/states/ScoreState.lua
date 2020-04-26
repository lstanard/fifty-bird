--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
    self.bronzeImg = love.graphics.newImage('bronze.png')
    self.silverImg = love.graphics.newImage('silver.png')
    self.goldImg = love.graphics.newImage('gold.png')
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score > 3 then
        love.graphics.printf('You earned a gold medal', 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(self.goldImg, VIRTUAL_WIDTH / 2 - self.goldImg:getWidth() / 4, 150, 0, 0.5, 0.5)
    elseif self.score > 2 then
        love.graphics.printf('You earned a silver medal', 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(self.silverImg, VIRTUAL_WIDTH / 2 - self.silverImg:getWidth() / 4, 150, 0, 0.5, 0.5)
    elseif self.score > 1 then
        love.graphics.printf('You earned a bronze medal', 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(self.bronzeImg, VIRTUAL_WIDTH / 2 - self.bronzeImg:getWidth() / 4, 150, 0, 0.5, 0.5)
    end

    love.graphics.printf('Press Enter to Play Again!', 0, 220, VIRTUAL_WIDTH, 'center')
end