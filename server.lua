ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('phacs_gift:giveitem', function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)

    MySQL.Async.fetchAll('SELECT ingift FROM phacs_gift WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier,
    }, function(result)
        if not result[1] then
            MySQL.Async.insert('INSERT INTO phacs_gift (identifier,ingift) VALUES (@identifier,@ingift)', {

		    	['@identifier'] = xPlayer.identifier,
		    	['@ingift'] = 1
		    }, function()
                xPlayer.addInventoryItem('judyhopps', 1)
                xPlayer.addInventoryItem('money', 800000)
                xPlayer.addInventoryItem('shop_gacha', 5)
                xPlayer.addInventoryItem('point_gacha', 1)
                
                MySQL.Async.insert('INSERT INTO title (identifier,title) VALUES (@identifier,@title)', {

                    ['@identifier'] = xPlayer.identifier,
                    ['@title'] = "~b~YEE ~y~兔子月餅賞月去"
                }, function ()
                    cb("give_ok")
                end)
            end)
        else
            cb("no_give")
        end
    end)
end)

