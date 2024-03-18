local identifier = "mfp-lb-tictac"

CreateThread(function ()
    while GetResourceState("lb-phone") ~= "started" do
        Wait(500)
    end

    local function AddApp()
        local added, errorMessage = exports["lb-phone"]:AddCustomApp({
            identifier = identifier,
            name = Config.name,
            description = Config.description,
            developer = "MFPSCRIPTS.com", -- please leave this, it would be fair for a free app (-;
            defaultApp = Config.defaultApp, 
            size = Config.size, 
            price = Config.price, 
            images = {"https://media.discordapp.net/attachments/1209142516461338696/1214301552307736598/Bildschirmfoto_2024-03-04_um_21.00.20.png?ex=65f89d72&is=65e62872&hm=5534c63ae83296be7f5fa55da95740256496d73f5190c80ec5a325329c1aa4a2&=&format=webp&quality=lossless&width=552&height=1052"}, -- OPTIONAL array of images for the app on the app store
            ui = GetCurrentResourceName() .. "/ui/index.html", 
            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/assets/icon.png"
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end

    AddApp()

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-phone" then
            AddApp()
        end
    end)
end)








---   ADS - ADS - ADS - ADS  ---
--- can be removed, just ads: ---

AddEventHandler('onResourceStart', function(resourceName)
   if (GetCurrentResourceName() ~= resourceName) then
     return
   end
   print(" _____ _____ _____ _____ _____ _____ _____ _____ _____ _____ ")
   print("|     |   __|  _  |   __|     | __  |     |  _  |_   _|   __|")
   print("| | | |   __|   __|__   |   --|    -|-   -|   __| | | |__   |")
   print("|_|_|_|__|  |__|  |_____|_____|__|__|_____|__|    |_| |_____|")
   print("The resource " .. resourceName .. " has been started")
 end)
 
 AddEventHandler('onResourceStop', function(resourceName)
   if (GetCurrentResourceName() ~= resourceName) then
     return
   end
   print('The resource ' .. resourceName .. ' was stopped. Created by MFPSCRIPTS.com!')
 end)