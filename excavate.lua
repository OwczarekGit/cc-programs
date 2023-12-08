local t = turtle
local utils = require 'lib.turtle_utils'

local function main()
    if not (#arg == 3) then
        print('Usage: ./excavate <len> <count> <direction>')
        print('Deposit torches into slot '.. TORCH_SLOT)
        print('Deposit chests into slot '.. CHEST_SLOT)
        print('Deposit fuel into slot '.. FUEL_SLOT)
        return
    end
    local len = arg[1]
    local count = arg[2]
    local dir = arg[3]
    
    if not (dir == 'left') and not (dir == 'right') then
        print('The direction must be either \'left\' or \'right\'.')
        return
    end
    
    for i = 1, count do
        for j = 1, len do
            place_torch(j)
            dig_col()
        end
        
        if dir == 'left' then
            t.turnLeft()
            dig_col()
            dig_col()
            dig_col()
            t.turnLeft()
        else
            t.turnRight()
            dig_col()
            dig_col()
            dig_col()
            t.turnRight()
        end
        
        for j = 1, len do
            place_torch(j)
            dig_col()
        end
        
        if dir == 'right' then
            t.turnLeft()
            dig_col()
            dig_col()
            dig_col()
            t.turnLeft()
        else
            t.turnRight()
            dig_col()
            dig_col()
            dig_col()
            t.turnRight()
        end
        
        deposit()
    end
    print('Job\'s done!')
end
main()