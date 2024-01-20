-- hs.wifi.currentNetwork() not work in sonama
-- add hs to System Settings -> Privacy & Security -> Location Services
-- print(hs.location.get())

-- reload config automatically
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- WifiNotifier.spoon
hs.loadSpoon("WifiNotifier")
spoon.WifiNotifier:start()

-- SpeedMenu.spoon
hs.loadSpoon("SpeedMenu")
spoon.SpeedMenu:start()

-- ShiftIt.spoon
hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

-- 休眠自动关闭蓝牙
function bluetoothSwitch(state)
  -- state: 0(off), 1(on)
  cmd = "/usr/local/bin/blueutil --power "..(state)
  result = hs.osascript.applescript(string.format('do shell script "%s"', cmd))
end

function caffeinateCallback(eventType)
  if (eventType == hs.caffeinate.watcher.screensDidSleep) then
    print("screensDidSleep")
  elseif (eventType == hs.caffeinate.watcher.screensDidWake) then
    print("screensDidWake")
  elseif (eventType == hs.caffeinate.watcher.screensDidLock) then
    print("screensDidLock")
    bluetoothSwitch(0)
  elseif (eventType == hs.caffeinate.watcher.screensDidUnlock) then
    print("screensDidUnlock")
    bluetoothSwitch(1)
  end
end

caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
caffeinateWatcher:start()

-- 连接到公司 Wi-Fi 时自动静音扬声器
local companyWifi = {'Sakyamuni','D-Life-VIP'}

local function muteVolume()
  hs.audiodevice.defaultOutputDevice():setOutputMuted(true)
end

local function unmuteVolume()
  hs.audiodevice.defaultOutputDevice():setOutputMuted(false)
end

wifiWatcher = hs.wifi.watcher.new(function()
  local currentWifi = hs.wifi.currentNetwork()
  for i=0, #companyWifi do
    if currentWifi == companyWifi[i] then
      muteVolume()
    end
  end
end)

wifiWatcher:start()
