local identifier = "mfp-lb-tictac-tablet"
local useTablet = false
local usePhone = false

CreateThread(function ()
    while GetResourceState("lb-tablet") ~= "started" do
        Wait(500)
    end
    while GetResourceState("lb-phone") ~= "started" do
      Wait(500)
    end

    local function AddTabletApp()
        local added, errorMessage = exports["lb-tablet"]:AddCustomApp({
            identifier = identifier,
            name = Config.name,
            description = Config.description,
            developer = "MFPSCRIPTS.com", -- please leave this, it would be fair for a free app (-;
            defaultApp = Config.defaultApp, 
            size = Config.size, 
            price = Config.price, 
            images = {"https://tictac.mfpscripts.com/images/image1.png", "https://tictac.mfpscripts.com/images/image2.png"}, -- OPTIONAL array of images for the app on the app store
            ui = GetCurrentResourceName() .. "/ui/tablet/index.html", 
            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/icon.png"
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
    end

      local function AddPhoneApp()
        local added, errorMessage = exports["lb-tablet"]:AddCustomApp({
            identifier = identifier,
            name = Config.name,
            description = Config.description,
            developer = "MFPSCRIPTS.com", -- please leave this, it would be fair for a free app (-;
            defaultApp = Config.defaultApp, 
            size = Config.size, 
            price = Config.price, 
            images = {"https://tictac.mfpscripts.com/images/image1.png", "https://tictac.mfpscripts.com/images/image2.png"}, -- OPTIONAL array of images for the app on the app store
            ui = GetCurrentResourceName() .. "/ui/phone/index.html", 
            icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/icon.png"
        })

        if not added then
            print("Could not add app:", errorMessage)
        end
  end
    
    if useTablet then
      AddTabletApp()
    end
    if usePhone then
      AddPhoneApp()
    end

    AddEventHandler("onResourceStart", function(resource)
        if resource == "lb-tablet" then
            useTablet = true
            AddTabletApp()
        end
        if resource == "lb-phone" then
            usePhone = true
            AddPhoneApp()
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
   print("More free LB-Tablet & LB-Phone Apps at lb.mfpscripts.com! Visit now!")
 end)
 
 AddEventHandler('onResourceStop', function(resourceName)
   if (GetCurrentResourceName() ~= resourceName) then
     return
   end
   print('The resource ' .. resourceName .. ' was stopped. Created by MFPSCRIPTS.com!')
 end)