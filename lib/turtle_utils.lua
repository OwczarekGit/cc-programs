local t = turtle
MIN_FUEL = 100
FUEL_SLOT = 16
CHEST_SLOT = 15
TORCH_SLOT = 14
TORCH_PLACEMENT_INTERVAL = 12

function place_torch(n)
    if n % TORCH_PLACEMENT_INTERVAL == 0 then
        t.select(TORCH_SLOT)
        t.placeDown()
        t.select(1)
    end
end

function refuel()
    if t.getFuelLevel() < MIN_FUEL then
        t.select(FUEL_SLOT)
        t.refuel(1)
        print('CONSUMED FUEL, LEVEL: ' .. t.getFuelLevel())
    end
    t.select(1)
end

function forward()
    refuel()
    while not t.forward() do
        t.dig()
    end
end

function dig_col()
    forward()
    t.digUp()
    t.digDown()
end

function deposit()
    t.digDown()
    t.select(CHEST_SLOT)
    t.placeDown()
    for i = 1, 13 do
        t.select(i)
        t.dropDown()
    end
    t.select(1)
end

