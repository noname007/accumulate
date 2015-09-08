-- print(type(coroutine))

-- co = coroutine.create(function() print('hi coroutine');return 1;end)
-- -- print(type(co))
-- -- print(co)

-- -- print(coroutine.status(co),nil,3) 

-- coroutine.resume(co)
-- print(coroutine.status(co)) 




-- resume -- yield 交换数据

range = coroutine.create(
    function ()
        -- body
        for i=1,10 do
            coroutine.yield(i)
        end
    end)

-- local status,result = coroutine.resume(range,10)

-- repeat
--     print(status,result)
-- until not status

function receive(thread, ... )
    local arg = {...}
    -- print('receive ...')
    -- local status,result = coroutine.resume(thread,unpack(arg)) ----> wrong 无法运行
    local status,result = coroutine.resume(thread)
    -- print('receive result: ', status,result)
    return result
end

function send(data)
    coroutine.yield(data)
end

function producer()
    print('create producer')
    return coroutine.create(
        function ()
            while true do
                local value = receive(range)
                if value then 
                    send(value)
                    print('produceing...')
                else
                    break
                end
            end
            return nil
        end)
end
    -- print(status,result)

function filter(pre)
    print('create filter')
    return coroutine.create(
        function ()
            while true do
                local value = receive(pre)
                print('filter...')
                -- value = value % 5
                if value ~= nil  then
                    value = string.format("%05d",value)
                    send(value)
                else
                    break
                end
            end
        end)
end


function consume(pre)
    print('create consume')
    return coroutine.create(
        function ()
            local value = receive(pre)
            print('cosume...')
            print(value)
        end)
end

p = producer()
f = filter(p)
c = consume(f)
c1 = consume(f)
coroutine.resume(c)
coroutine.resume(c1)
