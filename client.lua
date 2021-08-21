Notifs = {
  CbId = 0,
  Callbacks = {},
  Open = function(title,msg,buttons,input,inputtext,time,callback)
    Notifs.CbId = Notifs.CbId + 1
    SendNUIMessage({
      type  = "Open",
      title = (title or "Notification"), 
      msg   = msg,
      choice = (buttons or false),
      input = (input or false),
      inputtext = inputtext,
      cbid      = Notifs.CbId,
      time    = (time or 1500), 
    })
    if callback then 
      Notifs.Callbacks[Notifs.CbId] = callback
    end
  end,

  Return = function(data)
    SetNuiFocus(false,false)
    if Notifs.Callbacks[data.cbid] then 
      Notifs.Callbacks[data.cbid](data.val,data.iptval)
      Notifs.Callbacks[data.cbid] = false
    end
  end,

  NoMouse = function()
    SetNuiFocus(false,false)
  end,
}

RegisterNetEvent("Notifs:Open")
AddEventHandler("Notifs:Open", Notifs.Open)

RegisterNUICallback('return',   Notifs.Return)
RegisterNUICallback('nomouse',   Notifs.NoMouse)


RegisterCommand("+notifymouse", function()
  SetNuiFocus(true,true)
end)

RegisterKeyMapping("+notifymouse", "Notification Interaction", "keyboard", "TAB")


---## EXAMPLES

RegisterCommand("ChoiceNotif", function(source,args)
  Notifs.Open("Choice","Please choose yes or no.", true, false, false, -1, function(choice,input)
    print('Choice Notif Answer', choice)
  end)
end,false)

RegisterCommand("NormalNotif", function(source,args)
  Notifs.Open("Notification","This is just a regular notificaiton.", false, false, false, 10000, false)
end,false)

RegisterCommand("InputNotif", function(source,args)
  Notifs.Open("Input something","Please input something", false, true, "Input smth", -1, function(choice,input)
    print('Inputed:', input)
  end)
end,false)