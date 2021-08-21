**Usage:**

TriggerEvent("Notifs:Open",title,msg,buttons,input,inputtext,time,callback)

Vars: 
title       = The title at the top of notification (string)
msg         = The message in the notification (string)
buttons     = Do you want this notification to have buttons for accept/deny (bool)
input       = Do you want players to be able to respond to this notification with text? (bool)
inputtext   = What should the default text in the input field be (string) (only required if above is true)
time        = In milliseconds how long to display this notification use -1 to display until its interacted with(don't recommend this with regular notifs only choice or input)
callback    = This should be false or a function if using a function the two return args are bool(for choice return) and input. (see examples in client.lua)

You must press Tab to enable your mouse to use input style notifs.

**To implement to ESX.ShowNotification():**

**Preview: **
![alt text](https://media.discordapp.net/attachments/865280257899364372/878668292338905088/unknown.png?width=229&height=676)


_Go to : the client side of es_extended and look for _

**ESX.ShowNotificaion function something like this:**

ESX.ShowNotification = function(msg, flash, saveToBrief, hudColorIndex)
  if saveToBrief == nil then saveToBrief = true end
  AddTextEntry('esxNotification', msg)
  BeginTextCommandThefeedPost('esxNotification')
  if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
  EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

replace with 

ESX.ShowNotification = function(title, msg, buttons, input, inputtext, time, callback)
  TriggerEvent("Notifs:Open",title,msg,buttons,input,inputtext,time,callback)
end
