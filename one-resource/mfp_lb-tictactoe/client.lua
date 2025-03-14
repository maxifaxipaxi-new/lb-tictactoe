local identifierPhone = "mfp-lb-tictac-phone"
local identifierTablet = "mfp-lb-tictac-tablet"
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
          identifier = identifierTablet,
          name = Config.name,
          description = Config.description,
          developer = "MFPSCRIPTS.com", 
          defaultApp = Config.defaultApp, 
          size = Config.size, 
          price = Config.price, 
          images = {"https://tictac.mfpscripts.com/images/image1.png", "https://tictac.mfpscripts.com/images/image2.png"}, 
          ui = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/main.html", 
          icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/icon.png"
      })
  
      if not added then
          print("Could not add Tablet App:", errorMessage)
      end
  end
  
  local function AddPhoneApp()
      local added, errorMessage = exports["lb-phone"]:AddCustomApp({
          identifier = identifierPhone,
          name = Config.name,
          description = Config.description,
          developer = "MFPSCRIPTS.com", 
          defaultApp = Config.defaultApp, 
          size = Config.size, 
          price = Config.price, 
          images = {"https://tictac.mfpscripts.com/images/image1.png", "https://tictac.mfpscripts.com/images/image2.png"}, 
          ui = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/main.html", 
          icon = "https://cfx-nui-" .. GetCurrentResourceName() .. "/ui/icon.png"
      })
  
      if not added then
          print("Could not add Phone App:", errorMessage)
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

RegisterNUICallback("getDevice", function(data, cb)
  if data.type == "phone" then
      SendNUIMessage({ device = "phone" })
  elseif data.type == "tablet" then
      SendNUIMessage({ device = "tablet" })
  end
  cb("ok")
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