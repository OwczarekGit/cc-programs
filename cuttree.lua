local t = turtle

local function main()
    local height = 1
    while t.detect() do
        t.dig()
        while not t.up() do
            t.digUp()
        end
        height = height + 1
    end
    
    for i = 1, height do
        t.down()
    end
end
main()