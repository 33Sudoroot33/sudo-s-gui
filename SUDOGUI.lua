--====================================================
-- SUDO GUI (alpha 0.0.1)
-- KEY: 7622134 (NORMAL)
-- PREFIX: ?
-- TOGGLE UI: G
--====================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local ProximityPromptService = game:GetService("ProximityPromptService")

local camera = workspace.CurrentCamera
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- SUDO THEME CONFIGURATION PALETTE
local BG_DARK = Color3.fromRGB(10, 11, 14)
local PANEL_DARK = Color3.fromRGB(16, 17, 22)
local COMPONENT_BG = Color3.fromRGB(24, 26, 33)
local CYAN_ACCENT = Color3.fromRGB(0, 240, 255)
local PURPLE_ACCENT = Color3.fromRGB(150, 0, 255)
local TEXT_MAIN = Color3.fromRGB(230, 235, 245)

-- RUNTIME PRIVILEGE STATE
local unlocked = false
local devModeActive = false

-- CHARACTER MANAGEMENT SYSTEM
local char, hum, hrp
local function bindChar(c)
    char = c
    hum = c:WaitForChild("Humanoid", 5)
    hrp = c:WaitForChild("HumanoidRootPart", 5)
end
if player.Character then bindChar(player.Character) end
player.CharacterAdded:Connect(bindChar)

-- IMMERSIVE FULL-SCREEN TERMINAL ENVIRONMENT
local TerminalGui = Instance.new("ScreenGui")
TerminalGui.Name = "SudoBootTerminal"
TerminalGui.IgnoreGuiInset = true
TerminalGui.Parent = PlayerGui

local TFrame = Instance.new("Frame")
TFrame.Size = UDim2.fromScale(1, 1)
TFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TFrame.Parent = TerminalGui

local TWindow = Instance.new("ScrollingFrame")
TWindow.Size = UDim2.fromScale(0.95, 0.9)
TWindow.Position = UDim2.fromScale(0.025, 0.05)
TWindow.BackgroundTransparency = 1
TWindow.CanvasSize = UDim2.new(0, 0, 0, 0)
TWindow.ScrollBarThickness = 2
TWindow.Parent = TFrame

local TLayout = Instance.new("UIListLayout")
TLayout.Padding = UDim.new(0, 4)
TLayout.SortOrder = Enum.SortOrder.LayoutOrder
TLayout.Parent = TWindow

TLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    TWindow.CanvasSize = UDim2.new(0, 0, 0, TLayout.AbsoluteContentSize.Y + 20)
    TWindow.CanvasPosition = Vector2.new(0, math.max(0, TLayout.AbsoluteContentSize.Y - TWindow.AbsoluteSize.Y + 20))
end)

local function printTerm(text, color)
    color = color or TEXT_MAIN
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 22)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextSize = 16
    label.Font = Enum.Font.Code
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = TWindow
    return label
end

local function promptCommand()
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 22)
    container.BackgroundTransparency = 1
    container.Parent = TWindow

    local indicator = Instance.new("TextLabel")
    indicator.Size = UDim2.fromScale(0.15, 1)
    indicator.BackgroundTransparency = 1
    indicator.Text = "root@sudo:~# "
    indicator.TextColor3 = CYAN_ACCENT
    indicator.TextSize = 16
    indicator.Font = Enum.Font.Code
    indicator.TextXAlignment = Enum.TextXAlignment.Left
    indicator.Parent = container

    local box = Instance.new("TextBox")
    box.Size = UDim2.fromScale(0.85, 1)
    box.Position = UDim2.fromScale(0.15, 0)
    box.BackgroundTransparency = 1
    box.Text = ""
    box.TextColor3 = TEXT_MAIN
    box.TextSize = 16
    box.Font = Enum.Font.Code
    box.TextXAlignment = Enum.TextXAlignment.Left
    box.ClearTextOnFocus = false;
    box.Parent = container

    box:CaptureFocus()

    while box:IsFocused() do
        task.wait()
    end
    
    box.TextEditable = false
    return box.Text
end

-- TERMINAL INTERACTION PROCESSOR LOOP
printTerm("SUDO SYSTEM CORE v4.1.0-PRODUCTION INITIALIZED", PURPLE_ACCENT)
printTerm("Type commands to configure ecosystem.", Color3.fromRGB(150, 150, 150))

-- Step 1: Install SudoGui
while true do
    local cmd = promptCommand()
    if cmd == "sudo install sudogui" then
        printTerm("Fetching setup scripts from main servers...", CYAN_ACCENT)
        task.wait(0.2)
        printTerm("Unpacking assets: [========================================] 100%")
        printTerm("Ecosystem binary module installed successfully.")
        break
    else
        printTerm("command not found: " .. tostring(cmd), Color3.fromRGB(240, 50, 50))
    end
end

-- Step 2: Fetch SudoGui via curl
while true do
    local cmd = promptCommand()
    if cmd == "curl fetch sudogui" then
        printTerm("sudogui fetched.", Color3.fromRGB(245, 210, 0))
        break
    else
        printTerm("command not found: " .. tostring(cmd), Color3.fromRGB(240, 50, 50))
    end
end

-- Step 3: Run bash and key authentication protocol
while true do
    local cmd = promptCommand()
    if cmd == "bash run sudogui" then
        printTerm("CRITICAL SECURITY CHALLENGE REQUIRED", PURPLE_ACCENT)
        printTerm("ENTER SECURITY ACCREDITATION KEY VIA INPUT PROMPT TO BIND PLATFORM:")
        
        local accessKey = promptCommand()
        if accessKey == "7622134" then
            printTerm("TOKEN CONFIRMED. BOOTING SYSTEM ENVIRONMENT...", CYAN_ACCENT)
            task.wait(0.5)
            unlocked = true
            break
        elseif accessKey == "1342276" then
            devModeActive = true
            printTerm("WELCOME IN DEV MODE 2 QUESTIONS LEFT", Color3.fromRGB(255, 128, 0))
            task.wait(0.8)
            
            printTerm("1st question. who is the owner of this script ? {A) hakerfilipcriminal B) Bluedoge_yt1 C) nosniy shit or sm} PICK")
            local q1 = promptCommand()
            if q1:upper() == "A" then
                printTerm("CORRECT ENCRYPTED SIGNATURE ID.", Color3.fromRGB(0, 255, 0))
            else
                player:Kick("incorrect.")
                while true do task.wait() end -- Crash safe-guard loop
            end
            
            task.wait(0.5)
            printTerm("2ND QUESTION owners fav food? {A) pizza B) spaggethi}")
            local q2 = promptCommand()
            if q2:upper() == "A" or q2:upper() == "B" then
                printTerm("CORRECT. SECURITY CONFIRMED. GRANTED DEV TERMINAL ACCESS TERMINATION SECTOR.", Color3.fromRGB(0, 255, 0))
                task.wait(0.8)
                unlocked = true
                break
            else
                printTerm("INVALID ANSWER SELECTION. KERNEL HALTED.", Color3.fromRGB(240, 50, 50))
            end
        else
            printTerm("TOKEN INVALIDATION ENCOUNTERED. SECURITY BREACH RECORDED.", Color3.fromRGB(240, 50, 50))
        end
    else
        printTerm("command not found: " .. tostring(cmd), Color3.fromRGB(240, 50, 50))
    end
end

TerminalGui:Destroy()

-- MAIN INTERACTION FRAMEWORK
local gui = Instance.new("ScreenGui")
gui.Name = "SudoGui"
gui.Parent = PlayerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromScale(0.72, 0.75)
main.Position = UDim2.fromScale(0.14, 0.12)
main.BackgroundColor3 = BG_DARK
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = devModeActive and PURPLE_ACCENT or CYAN_ACCENT
mainStroke.Thickness = 1.5
mainStroke.Parent = main

-- FRAME DRAGGING SUBROUTINE
do
    local drag = false
    local sp = Vector3.new()
    local sf = UDim2.new()

    main.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = true
            sp = i.Position
            sf = main.Position
        end
    end)

    UIS.InputChanged:Connect(function(i)
        if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
            local d = i.Position - sp
            main.Position = UDim2.fromScale(
                sf.X.Scale + d.X / camera.ViewportSize.X,
                sf.Y.Scale + d.Y / camera.ViewportSize.Y
            )
        end
    end)

    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = false
        end
    end)
end

-- SIDEBAR MODULE NAVIGATION PANEL
local side = Instance.new("ScrollingFrame")
side.Size = UDim2.fromScale(0.22, 0.86)
side.Position = UDim2.fromScale(0.02, 0.12)
side.BackgroundColor3 = PANEL_DARK
side.BackgroundTransparency = 0
side.BorderSizePixel = 0
side.CanvasSize = UDim2.new(0, 0, 0, 0)
side.ScrollBarThickness = 0
side.Parent = main

local sideCorner = Instance.new("UICorner")
sideCorner.Parent = side

local sideLayout = Instance.new("UIListLayout")
sideLayout.Padding = UDim.new(0, 6)
sideLayout.SortOrder = Enum.SortOrder.LayoutOrder
sideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideLayout.Parent = side

sideLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    side.CanvasSize = UDim2.new(0, 0, 0, sideLayout.AbsoluteContentSize.Y + 10)
end)

-- SCROLLING PAGE ARCHITECTURE MANAGEMENT
local pages = {}

local function newPage(name)
    local p = Instance.new("ScrollingFrame")
    p.Size = UDim2.fromScale(0.72, 0.86)
    p.Position = UDim2.fromScale(0.26, 0.12)
    p.BackgroundTransparency = 1
    p.BorderSizePixel = 0
    p.Visible = false
    p.CanvasSize = UDim2.new(0, 0, 0, 0)
    p.ScrollBarThickness = 4
    p.ScrollBarImageColor3 = PURPLE_ACCENT
    p.Parent = main

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = p

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        p.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 15)
    end)

    pages[name] = p
    return p
end

local function tabButton(name, page)
    local b = Instance.new("TextButton")
    b.Size = UDim2.fromOffset(130, 38)
    b.Text = (devModeActive and "#/" or "./") .. name:lower()
    b.TextScaled = true
    b.Font = Enum.Font.Code
    b.BackgroundColor3 = COMPONENT_BG
    b.TextColor3 = devModeActive and PURPLE_ACCENT or TEXT_MAIN
    b.Parent = side

    local bCorner = Instance.new("UICorner")
    bCorner.Parent = b

    b.MouseButton1Click:Connect(function()
        for _, v in pairs(pages) do v.Visible = false end
        page.Visible = true
    end)
end

-- INITIALIZE CHANNELS
local pPlayer = newPage("Player")
local pESP = newPage("ESP")
local pExecutor = newPage("Executor")
local pScripts = newPage("Scripts")
local pUsers = newPage("Users")
local pSettings = newPage("Settings")
pPlayer.Visible = true

tabButton("Player", pPlayer)
tabButton("ESP", pESP)
tabButton("Executor", pExecutor)
tabButton("Scripts", pScripts)
tabButton("Users", pUsers)
tabButton("Settings", pSettings)

-- REUSABLE BUILD UI HELPERS
local function toggle(parent, text, cb)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.96, 0, 0, 45)
    b.Text = text .. " [OFF]"
    b.TextScaled = true
    b.Font = Enum.Font.Code
    b.BackgroundColor3 = COMPONENT_BG
    b.TextColor3 = Color3.fromRGB(180, 180, 180)
    b.Parent = parent

    local bCorner = Instance.new("UICorner")
    bCorner.Parent = b

    local on = false
    b.MouseButton1Click:Connect(function()
        on = not on
        b.Text = text .. (on and " [ON]" or " [OFF]")
        b.TextColor3 = on and (devModeActive and PURPLE_ACCENT or CYAN_ACCENT) or Color3.fromRGB(180, 180, 180)
        cb(on)
    end)
end

local function slider(parent, text, min, max, cb)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0.96, 0, 0, 45)
    f.BackgroundColor3 = PANEL_DARK
    f.Parent = parent

    local fCorner = Instance.new("UICorner")
    fCorner.Parent = f

    local t = Instance.new("TextLabel")
    t.Size = UDim2.fromScale(0.4, 1)
    t.BackgroundTransparency = 1
    t.Text = text
    t.TextScaled = true
    t.Font = Enum.Font.Code
    t.TextColor3 = TEXT_MAIN
    t.Parent = f

    local bar = Instance.new("Frame")
    bar.Size = UDim2.fromScale(0.5, 0.25)
    bar.Position = UDim2.fromScale(0.45, 0.38)
    bar.BackgroundColor3 = COMPONENT_BG
    bar.Parent = f

    local fill = Instance.new("Frame")
    fill.Size = UDim2.fromScale(0, 1)
    fill.BackgroundColor3 = PURPLE_ACCENT
    fill.Parent = bar

    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            local mv
            mv = UIS.InputChanged:Connect(function(m)
                if m.UserInputType == Enum.UserInputType.MouseMovement then
                    local p = math.clamp((m.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                    fill.Size = UDim2.fromScale(p, 1)
                    cb(math.floor(min + (max - min) * p))
                end
            end)
            
            local disconnectConnection
            disconnectConnection = UIS.InputEnded:Connect(function()
                mv:Disconnect()
                if disconnectConnection then disconnectConnection:Disconnect() end
            end)
        end
    end)
end

-- ENVIRONMENT PLAYER CONTROL MATRIX
slider(pPlayer, "Speed Mod", 16, 300, function(v) if hum then hum.WalkSpeed = v end end)
slider(pPlayer, "Jump Force", 50, 300, function(v) if hum then hum.JumpPower = v end end)
slider(pPlayer, "Hip Offset", 0, 10, function(v) if hum then hum.HipHeight = v end end)

local flying = false
toggle(pPlayer, "Flight Engine", function(v)
    flying = v
    if hum then hum.PlatformStand = v end
end)

local noclip = false
toggle(pPlayer, "Noclip Matrix", function(v) noclip = v end)

RS.Stepped:Connect(function()
    if noclip and char then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") and p.CanCollide then
                p.CanCollide = false
            end
        end
    end
end)

-- INSTANT INTERACTION INTERCEPTOR
local instantInteract = false
toggle(pPlayer, "Instant Interact", function(v) instantInteract = v end)

ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
    if instantInteract then
        if type(fireproximityprompt) == "function" then
            fireproximityprompt(prompt)
        end
    end
end)

-- GRAPHICS ENVIRONMENT MODIFIERS
toggle(pSettings, "FullBright Matrix", function(v)
    Lighting.Brightness = v and 5 or 1
    Lighting.ClockTime = v and 14 or 12
end)

-- SENSORY OVERLAP MODULE (ESP)
local espActive = false
toggle(pESP, "Sensory Overlap (ESP)", function(on)
    espActive = on
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character then
            local oldEsp = plr.Character:FindFirstChild("ESP")
            if oldEsp then oldEsp:Destroy() end
            
            if espActive then
                local h = Instance.new("Highlight")
                h.Name = "ESP"
                h.FillColor = devModeActive and PURPLE_ACCENT or CYAN_ACCENT
                h.OutlineColor = PURPLE_ACCENT
                h.Parent = plr.Character
            end
        end
    end
end)

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(c)
        if espActive then
            task.wait(0.5)
            if not c:FindFirstChild("ESP") then
                local h = Instance.new("Highlight")
                h.Name = "ESP"
                h.FillColor = devModeActive and PURPLE_ACCENT or CYAN_ACCENT
                h.OutlineColor = PURPLE_ACCENT
                h.Parent = c
            end
        end
    end)
end)

-- INTEGRATED PORTABLE RUNTIME EXECUTOR SYSTEM
local ExecBox = Instance.new("TextBox")
ExecBox.Size = UDim2.new(0.96, 0, 0, 200)
ExecBox.ClearTextOnFocus = false
ExecBox.MultiLine = true
ExecBox.TextXAlignment = Enum.TextXAlignment.Left
ExecBox.TextYAlignment = Enum.TextYAlignment.Top
ExecBox.BackgroundColor3 = PANEL_DARK
ExecBox.TextColor3 = TEXT_MAIN
ExecBox.PlaceholderText = "-- Sudo Shell: Input raw runtime Lua scripts or external library endpoints here..."
ExecBox.Font = Enum.Font.Code
ExecBox.TextSize = 14
ExecBox.Parent = pExecutor

local execBoxCorner = Instance.new("UICorner")
execBoxCorner.Parent = ExecBox

local RunExecBtn = Instance.new("TextButton")
RunExecBtn.Size = UDim2.new(0.96, 0, 0, 45)
RunExecBtn.Text = "EXECUTE PAYLOAD"
RunExecBtn.TextScaled = true
RunExecBtn.Font = Enum.Font.Code
RunExecBtn.BackgroundColor3 = PURPLE_ACCENT
RunExecBtn.TextColor3 = TEXT_MAIN
RunExecBtn.Parent = pExecutor

local runExecBtnCorner = Instance.new("UICorner")
runExecBtnCorner.Parent = RunExecBtn

RunExecBtn.MouseButton1Click:Connect(function()
    if ExecBox.Text ~= "" then
        local success, err = pcall(function()
            if type(loadstring) == "function" then
                local func = loadstring(ExecBox.Text)
                if func then
                    func()
                else
                    warn("Syntax structure compilation failed.")
                end
            end
        end)
        if not success then warn("Execution Crash Safety Trip: " .. tostring(err)) end
    end
end)

-- SYSTEM SCRIPT HUB FETCH LIST
local SCRIPTS = {
    iy = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
    bn2 = "https://raw.githubusercontent.com/EnesXVC/Breakin2/main/script",
    dmc = "https://rawscripts.net/raw/Universal-Script-DarkMoon-Client-46431",
    uniadm = "https://rawscripts.net/raw/Universal-Script-un*led-admin-82103",
    antiknock = "https://rawscripts.net/raw/Universal-Script-Anti-Knockback-script-81139",
    ug2 = "https://rawscripts.net/raw/Universal-Script-unexpected-g2-80546"
}

local function loadScript(id)
    local url = SCRIPTS[id]
    if url then
        local success, err = pcall(function()
            if type(loadstring) == "function" then
                local func = loadstring(game:HttpGet(url, true))
                if func then func() end
            end
        end)
        if not success then warn("Failed external payload source fetch: " .. tostring(err)) end
    end
end

for k, _ in pairs(SCRIPTS) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.96, 0, 0, 40)
    b.Text = "fetch // " .. k
    b.TextScaled = true
    b.Font = Enum.Font.Code
    b.BackgroundColor3 = COMPONENT_BG
    b.TextColor3 = devModeActive and PURPLE_ACCENT or CYAN_ACCENT
    b.Parent = pScripts

    local bCorner = Instance.new("UICorner")
    bCorner.Parent = b
    
    b.MouseButton1Click:Connect(function() loadScript(k) end)
end

-- DATA INTERCEPT NETWORK USERS LIST
local function refreshUsers()
    for _, child in ipairs(pUsers:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.96, 0, 0, 40)
        b.Text = "id // " .. plr.Name .. " [" .. tostring(plr.UserId) .. "]"
        b.TextScaled = true
        b.Font = Enum.Font.Code
        b.BackgroundColor3 = COMPONENT_BG
        b.TextColor3 = TEXT_MAIN
        b.Parent = pUsers

        local bCorner = Instance.new("UICorner")
        bCorner.Parent = b

        b.MouseButton1Click:Connect(function()
            if type(setclipboard) == "function" then
                setclipboard(plr.Name .. " " .. tostring(plr.UserId))
            end
        end)
    end
end
Players.PlayerAdded:Connect(refreshUsers)
Players.PlayerRemoving:Connect(refreshUsers)
refreshUsers()

-- INTERCEPT DATA CHAT PROTOCOLS
player.Chatted:Connect(function(msg)
    msg = msg:lower()
    if msg == "?fly" then
        flying = true
        if hum then hum.PlatformStand = true end
    elseif msg == "?unfly" then
        flying = false
        if hum then hum.PlatformStand = false end
    elseif msg:sub(1, 5) == "?load" then
        loadScript(msg:sub(7))
    end
end)

-- KINETIC RIGID-BODY FLIGHT CALCULATOR
RS.RenderStepped:Connect(function()
    if flying and hrp and char then
        local vel = Vector3.new(0, 0, 0)
        if UIS:IsKeyDown(Enum.KeyCode.W) then vel = vel + camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then vel = vel - camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then vel = vel - camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then vel = vel + camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then vel = vel + Vector3.new(0, -1, 0) end

        local targetSpeed = hum and hum.WalkSpeed or 16
        hrp.Velocity = vel * targetSpeed

        if vel.X == 0 and vel.Y == 0 and vel.Z == 0 then
            hrp.Velocity = Vector3.new(0, 0.1, 0)
        end
    end
end)

-- HUD DISPLAY INTERRUPT TOGGLE
UIS.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.G then
        main.Visible = not main.Visible
    end
end)