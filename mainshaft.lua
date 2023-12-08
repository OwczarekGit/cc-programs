local utils = require 'lib.turtle_utils'
local t = turtle

local function main()
    if not (#arg == 1) then
        print('Usage: ./mainshaft <len> ')
        print('Deposit torches into slot '.. TORCH_SLOT)
        print('Deposit fuel into slot '.. FUEL_SLOT)
        return
    end
    local len = arg[1]
    
    for i = 1, len do
        place_torch(i)
        dig_col()
        t.turnLeft()
        dig_col()
        t.turnRight()
        t.turnRight()
        dig_col()
        dig_col()
        t.turnLeft()
        t.turnLeft()
        dig_col()
        t.turnRight()
    end
    
    t.turnLeft()
    t.turnLeft()

    for i = 1, len do
        forward()   
    end
end
main()