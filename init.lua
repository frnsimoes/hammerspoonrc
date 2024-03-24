-- Define the workspaces and the apps they contain
local workspace1 = {"iTerm", "Chromium"}
local workspace2 = {"Google Chrome"}
local workspace3 = {"Spotify"}
local workspace6 = {"Telegram", "Firefox"}


local function simulateKeystroke(appObject, key)
    -- delay to ensure the application is fully launched
    hs.timer.doAfter(1, function()
        -- focus application window
        appObject:activate()
        -- simulate keystroke
        hs.eventtap.keyStroke({"alt"}, key)
    end)
end


-- Helper function to check if a value exists in a table
local function isInTable(t, value)
    for _, v in pairs(t) do
		print(v)
        if v == value then
            return true
        end
    end
    return false
end

-- Modify the applicationWatcher function
local function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.launched) then if isInTable(workspace1, appName) then simulateKeystroke(appObject, "q") elseif isInTable(workspace2, appName) then simulateKeystroke(appObject, "w")
	elseif isInTable(workspace3, appName) then
	    simulateKeystroke(appObject, "e")
        elseif isInTable(workspace6, appName) then
            simulateKeystroke(appObject, "y")
        end
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
