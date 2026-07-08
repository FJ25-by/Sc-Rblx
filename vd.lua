-- YUJI ADMIN PANEL v4.3 (Auto Kill, Auto Vault Remote, Auto Parry)
-- Shortcut: F (Fly), J (Infinite Jump), L (Anti Lag), K (Anti AFK), H (Walk on Water)

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

print("[START] YUJI v4.3 Loading...")

-- === WARNA ===
local C = {
    bg = Color3.fromRGB(10, 14, 22),
    sidebar = Color3.fromRGB(7, 11, 18),
    panel = Color3.fromRGB(13, 18, 28),
    accent = Color3.fromRGB(0, 180, 255),
    accentDim = Color3.fromRGB(0, 80, 130),
    text = Color3.fromRGB(210, 230, 245),
    textDim = Color3.fromRGB(100, 130, 160),
    rowHover = Color3.fromRGB(20, 30, 50),
    rowAlt = Color3.fromRGB(16, 22, 36),
    btnRed = Color3.fromRGB(180, 50, 50),
    btnBlue = Color3.fromRGB(0, 120, 220),
    divider = Color3.fromRGB(25, 40, 65),
    topbar = Color3.fromRGB(8, 13, 22),
    inputBg = Color3.fromRGB(20, 28, 45),
    toggleOff = Color3.fromRGB(40, 50, 70),
    toggleOn = Color3.fromRGB(0, 180, 255),
}

-- === ROOT GUI ===
if CoreGui:FindFirstChild("YUJI_LYNX") then CoreGui:FindFirstChild("YUJI_LYNX"):Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "YUJI_LYNX"
screenGui.Parent = CoreGui
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- === ICON ===
local iconBtn = Instance.new("TextButton")
iconBtn.Size = UDim2.new(0, 32, 0, 32)
iconBtn.Position = UDim2.new(0, 20, 0.5, -16)
iconBtn.BackgroundColor3 = C.sidebar
iconBtn.BorderSizePixel = 0
iconBtn.Text = "Y"
iconBtn.TextColor3 = C.accent
iconBtn.TextSize = 14
iconBtn.Font = Enum.Font.GothamBold
iconBtn.Visible = false
iconBtn.ZIndex = 50
iconBtn.Parent = screenGui
Instance.new("UICorner", iconBtn).CornerRadius = UDim.new(0, 7)
local _is = Instance.new("UIStroke", iconBtn)
_is.Color = C.accent
_is.Thickness = 1.5

-- === MAIN FRAME ===
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 440, 0, 320)
mainFrame.Position = UDim2.new(0, 60, 0, 60)
mainFrame.BackgroundColor3 = C.bg
mainFrame.BorderSizePixel = 0
mainFrame.ZIndex = 10
mainFrame.Parent = screenGui
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
local _ms = Instance.new("UIStroke", mainFrame)
_ms.Color = Color3.fromRGB(0, 80, 130)
_ms.Thickness = 1

-- === TOPBAR ===
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 32)
topBar.BackgroundColor3 = C.topbar
topBar.BorderSizePixel = 0
topBar.ZIndex = 11
topBar.Parent = mainFrame
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 10)

local topLogo = Instance.new("TextLabel", topBar)
topLogo.Size = UDim2.new(0, 80, 1, 0)
topLogo.Position = UDim2.new(0, 10, 0, 0)
topLogo.BackgroundTransparency = 1
topLogo.Text = "YUJI"
topLogo.TextColor3 = C.accent
topLogo.TextSize = 14
topLogo.Font = Enum.Font.GothamBold
topLogo.TextXAlignment = Enum.TextXAlignment.Left
topLogo.ZIndex = 12

local topGameName = Instance.new("TextLabel", topBar)
topGameName.Size = UDim2.new(0, 180, 1, 0)
topGameName.Position = UDim2.new(0, 100, 0, 0)
topGameName.BackgroundTransparency = 1
topGameName.Text = "Admin Panel"
topGameName.TextColor3 = C.textDim
topGameName.TextSize = 12
topGameName.Font = Enum.Font.Gotham
topGameName.TextXAlignment = Enum.TextXAlignment.Left
topGameName.ZIndex = 12

local minimizeBtn = Instance.new("TextButton", topBar)
minimizeBtn.Size = UDim2.new(0, 26, 0, 20)
minimizeBtn.Position = UDim2.new(1, -34, 0.5, -10)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 45, 70)
minimizeBtn.Text = "—"
minimizeBtn.TextColor3 = C.text
minimizeBtn.TextSize = 11
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.BorderSizePixel = 0
minimizeBtn.ZIndex = 12
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 4)

-- === SIDEBAR ===
local sideBar = Instance.new("Frame", mainFrame)
sideBar.Size = UDim2.new(0, 135, 1, -32)
sideBar.Position = UDim2.new(0, 0, 0, 32)
sideBar.BackgroundColor3 = C.sidebar
sideBar.BorderSizePixel = 0
sideBar.ZIndex = 11
Instance.new("UICorner", sideBar).CornerRadius = UDim.new(0, 10)

local searchBox = Instance.new("TextBox", sideBar)
searchBox.Size = UDim2.new(1, -16, 0, 26)
searchBox.Position = UDim2.new(0, 8, 0, 8)
searchBox.BackgroundColor3 = Color3.fromRGB(18, 26, 42)
searchBox.PlaceholderText = "Search..."
searchBox.PlaceholderColor3 = C.textDim
searchBox.Text = ""
searchBox.TextColor3 = C.text
searchBox.TextSize = 10
searchBox.Font = Enum.Font.Gotham
searchBox.BorderSizePixel = 0
searchBox.ClearTextOnFocus = false
searchBox.ZIndex = 13
Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 5)

local sideTabList = Instance.new("Frame", sideBar)
sideTabList.Size = UDim2.new(1, 0, 1, -44)
sideTabList.Position = UDim2.new(0, 0, 0, 42)
sideTabList.BackgroundTransparency = 1
sideTabList.ZIndex = 12
local _sl = Instance.new("UIListLayout", sideTabList)
_sl.SortOrder = Enum.SortOrder.LayoutOrder
_sl.Padding = UDim.new(0, 1)

-- === CONTENT AREA ===
local contentArea = Instance.new("Frame", mainFrame)
contentArea.Size = UDim2.new(1, -135, 1, -32)
contentArea.Position = UDim2.new(0, 135, 0, 32)
contentArea.BackgroundColor3 = C.panel
contentArea.BorderSizePixel = 0
contentArea.ZIndex = 11
Instance.new("UICorner", contentArea).CornerRadius = UDim.new(0, 10)

local contentHeader = Instance.new("TextLabel", contentArea)
contentHeader.Size = UDim2.new(1, -20, 0, 28)
contentHeader.Position = UDim2.new(0, 18, 0, 5)
contentHeader.BackgroundTransparency = 1
contentHeader.Text = "Main"
contentHeader.TextColor3 = C.text
contentHeader.TextSize = 15
contentHeader.Font = Enum.Font.GothamBold
contentHeader.TextXAlignment = Enum.TextXAlignment.Left
contentHeader.ZIndex = 12

local _ha = Instance.new("Frame", contentArea)
_ha.Size = UDim2.new(0, 3, 0, 18)
_ha.Position = UDim2.new(0, 12, 0, 10)
_ha.BackgroundColor3 = C.accent
_ha.BorderSizePixel = 0
_ha.ZIndex = 12

local _hl = Instance.new("Frame", contentArea)
_hl.Size = UDim2.new(1, -20, 0, 1)
_hl.Position = UDim2.new(0, 10, 0, 36)
_hl.BackgroundColor3 = C.divider
_hl.BorderSizePixel = 0
_hl.ZIndex = 12

local scrollFrame = Instance.new("ScrollingFrame", contentArea)
scrollFrame.Size = UDim2.new(1, -10, 1, -46)
scrollFrame.Position = UDim2.new(0, 5, 0, 40)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.ScrollBarThickness = 3
scrollFrame.ScrollBarImageColor3 = C.accent
scrollFrame.BorderSizePixel = 0
scrollFrame.ZIndex = 12
local scrollLayout = Instance.new("UIListLayout", scrollFrame)
scrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
scrollLayout.Padding = UDim.new(0, 2)

-- ==== HELPER FUNCTIONS ====
local tabSetters = {}

local function makeSideTab(labelText, icon, order)
    local btn = Instance.new("TextButton", sideTabList)
    btn.Size = UDim2.new(1, 0, 0, 34)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.ZIndex = 13

    local accentBar = Instance.new("Frame", btn)
    accentBar.Size = UDim2.new(0, 3, 0.6, 0)
    accentBar.Position = UDim2.new(0, 0, 0.2, 0)
    accentBar.BackgroundColor3 = C.accent
    accentBar.BorderSizePixel = 0
    accentBar.Visible = false
    accentBar.ZIndex = 14

    local iconLbl = Instance.new("TextLabel", btn)
    iconLbl.Size = UDim2.new(0, 22, 1, 0)
    iconLbl.Position = UDim2.new(0, 10, 0, 0)
    iconLbl.BackgroundTransparency = 1
    iconLbl.Text = icon
    iconLbl.TextColor3 = C.textDim
    iconLbl.TextSize = 14
    iconLbl.Font = Enum.Font.GothamBold
    iconLbl.ZIndex = 14

    local textLbl = Instance.new("TextLabel", btn)
    textLbl.Size = UDim2.new(1, -36, 1, 0)
    textLbl.Position = UDim2.new(0, 34, 0, 0)
    textLbl.BackgroundTransparency = 1
    textLbl.Text = labelText
    textLbl.TextColor3 = C.textDim
    textLbl.TextSize = 11
    textLbl.Font = Enum.Font.Gotham
    textLbl.TextXAlignment = Enum.TextXAlignment.Left
    textLbl.ZIndex = 14

    local function setActive(active)
        if active then
            btn.BackgroundTransparency = 0
            btn.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
            accentBar.Visible = true
            iconLbl.TextColor3 = C.accent
            textLbl.TextColor3 = C.text
            textLbl.Font = Enum.Font.GothamBold
        else
            btn.BackgroundTransparency = 1
            accentBar.Visible = false
            iconLbl.TextColor3 = C.textDim
            textLbl.TextColor3 = C.textDim
            textLbl.Font = Enum.Font.Gotham
        end
    end
    return btn, setActive
end

local function makeUtilityToggleRow(parent, labelText, layoutOrder, onToggle)
    local row = Instance.new("Frame", parent)
    row.Name = labelText
    row.Size = UDim2.new(1, 0, 0, 36)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.LayoutOrder = layoutOrder
    row.ZIndex = 15

    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1, -60, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = C.text
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 16

    local track = Instance.new("Frame", row)
    track.Size = UDim2.new(0, 44, 0, 24)
    track.Position = UDim2.new(1, -44, 0.5, -12)
    track.BackgroundColor3 = C.toggleOff
    track.BorderSizePixel = 0
    track.ZIndex = 16
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame", track)
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = UDim2.new(0, 3, 0.5, -9)
    knob.BackgroundColor3 = Color3.fromRGB(180, 200, 220)
    knob.BorderSizePixel = 0
    knob.ZIndex = 17
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local isOn = false
    local clickArea = Instance.new("TextButton", track)
    clickArea.Size = UDim2.new(1, 0, 1, 0)
    clickArea.BackgroundTransparency = 1
    clickArea.Text = ""
    clickArea.ZIndex = 18

    local function setState(state)
        isOn = state
        if isOn then
            TweenService:Create(track, TweenInfo.new(0.15), {BackgroundColor3 = C.toggleOn}):Play()
            TweenService:Create(knob, TweenInfo.new(0.15), {Position = UDim2.new(0, 23, 0.5, -9)}):Play()
            knob.BackgroundColor3 = Color3.fromRGB(220, 240, 255)
        else
            TweenService:Create(track, TweenInfo.new(0.15), {BackgroundColor3 = C.toggleOff}):Play()
            TweenService:Create(knob, TweenInfo.new(0.15), {Position = UDim2.new(0, 3, 0.5, -9)}):Play()
            knob.BackgroundColor3 = Color3.fromRGB(180, 200, 220)
        end
    end
    clickArea.MouseButton1Click:Connect(function()
        setState(not isOn)
        if onToggle then onToggle(isOn) end
    end)
    local function getState() return isOn end
    return row, setState, getState
end

local function makeSpeedInputRow(parent, layoutOrder)
    local row = Instance.new("Frame", parent)
    row.Name = "SpeedValueRow"
    row.Size = UDim2.new(1, 0, 0, 36)
    row.BackgroundTransparency = 1
    row.BorderSizePixel = 0
    row.LayoutOrder = layoutOrder
    row.ZIndex = 15

    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(0.52, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = "Speed Value"
    lbl.TextColor3 = C.text
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 16

    local inputBox = Instance.new("TextBox", row)
    inputBox.Size = UDim2.new(0.44, 0, 0.72, 0)
    inputBox.Position = UDim2.new(0.56, 0, 0.14, 0)
    inputBox.BackgroundColor3 = C.inputBg
    inputBox.BorderSizePixel = 0
    inputBox.Text = "22"
    inputBox.TextColor3 = C.text
    inputBox.TextSize = 12
    inputBox.Font = Enum.Font.GothamBold
    inputBox.ClearTextOnFocus = false
    inputBox.TextXAlignment = Enum.TextXAlignment.Center
    inputBox.ZIndex = 16
    Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 5)
    local _is2 = Instance.new("UIStroke", inputBox)
    _is2.Color = Color3.fromRGB(0, 80, 130)
    _is2.Thickness = 1
    return inputBox
end

local function makeExpandableSection(parent, title, order, buildContent)
    local wrapper = Instance.new("Frame", parent)
    wrapper.Name = title
    wrapper.BackgroundColor3 = C.rowAlt
    wrapper.BorderSizePixel = 0
    wrapper.LayoutOrder = order
    wrapper.ZIndex = 13
    wrapper.AutomaticSize = Enum.AutomaticSize.Y
    wrapper.Size = UDim2.new(1, 0, 0, 0)
    wrapper.ClipsDescendants = true
    Instance.new("UICorner", wrapper).CornerRadius = UDim.new(0, 6)

    local inner = Instance.new("Frame", wrapper)
    inner.Size = UDim2.new(1, 0, 0, 0)
    inner.BackgroundTransparency = 1
    inner.AutomaticSize = Enum.AutomaticSize.Y
    inner.ZIndex = 13
    local innerLayout = Instance.new("UIListLayout", inner)
    innerLayout.SortOrder = Enum.SortOrder.LayoutOrder
    innerLayout.Padding = UDim.new(0, 0)

    local header = Instance.new("Frame", inner)
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 38)
    header.BackgroundTransparency = 1
    header.LayoutOrder = 0
    header.ZIndex = 14

    local titleLbl = Instance.new("TextLabel", header)
    titleLbl.Size = UDim2.new(1, -50, 1, 0)
    titleLbl.Position = UDim2.new(0, 12, 0, 0)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = title
    titleLbl.TextColor3 = C.text
    titleLbl.TextSize = 12
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.ZIndex = 15

    local arrowLbl = Instance.new("TextLabel", header)
    arrowLbl.Size = UDim2.new(0, 20, 1, 0)
    arrowLbl.Position = UDim2.new(1, -28, 0, 0)
    arrowLbl.BackgroundTransparency = 1
    arrowLbl.Text = "▼"
    arrowLbl.TextColor3 = C.accent
    arrowLbl.TextSize = 10
    arrowLbl.Font = Enum.Font.GothamBold
    arrowLbl.ZIndex = 15

    local divider = Instance.new("Frame", header)
    divider.Name = "Divider"
    divider.Size = UDim2.new(1, -16, 0, 1)
    divider.Position = UDim2.new(0, 8, 1, -1)
    divider.BackgroundColor3 = C.divider
    divider.BorderSizePixel = 0
    divider.ZIndex = 14

    local contentContainer = Instance.new("Frame", inner)
    contentContainer.Name = "Content"
    contentContainer.Size = UDim2.new(1, 0, 0, 0)
    contentContainer.BackgroundTransparency = 1
    contentContainer.AutomaticSize = Enum.AutomaticSize.Y
    contentContainer.LayoutOrder = 1
    contentContainer.ZIndex = 14
    local _ccl = Instance.new("UIListLayout", contentContainer)
    _ccl.SortOrder = Enum.SortOrder.LayoutOrder
    _ccl.Padding = UDim.new(0, 0)
    local _ccp = Instance.new("UIPadding", contentContainer)
    _ccp.PaddingLeft = UDim.new(0, 12)
    _ccp.PaddingRight = UDim.new(0, 12)
    _ccp.PaddingTop = UDim.new(0, 4)
    _ccp.PaddingBottom = UDim.new(0, 10)

    buildContent(contentContainer)

    local collapsed = false
    local function setCollapsed(state)
        collapsed = state
        contentContainer.Visible = not collapsed
        divider.Visible = not collapsed
        arrowLbl.Text = collapsed and "▲" or "▼"
    end

    local headerBtn = Instance.new("TextButton", header)
    headerBtn.Size = UDim2.new(1, 0, 0, 38)
    headerBtn.BackgroundTransparency = 1
    headerBtn.Text = ""
    headerBtn.ZIndex = 16
    headerBtn.LayoutOrder = -1
    headerBtn.MouseButton1Click:Connect(function() setCollapsed(not collapsed) end)
    setCollapsed(false)
    return wrapper
end

local function makeActionRow(parent, labelText, color, callback, order)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 34)
    row.BackgroundColor3 = color or C.rowAlt
    row.BorderSizePixel = 0
    row.LayoutOrder = order or 0
    row.ZIndex = 13
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)

    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1, -12, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = C.text
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 14

    local clickBtn = Instance.new("TextButton", row)
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.BackgroundTransparency = 1
    clickBtn.Text = ""
    clickBtn.ZIndex = 15
    clickBtn.MouseButton1Click:Connect(function() if callback then callback() end end)
end

local function createDropdownButton(parent, labelText, options, defaultOption, onSelect, layoutOrder)
    local wrapper = Instance.new("Frame", parent)
    wrapper.Size = UDim2.new(1, 0, 0, 36)
    wrapper.BackgroundTransparency = 1
    wrapper.LayoutOrder = layoutOrder or 1
    wrapper.ZIndex = 15

    local lbl = Instance.new("TextLabel", wrapper)
    lbl.Size = UDim2.new(0.52, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = C.text
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 16

    local dropdownBtn = Instance.new("TextButton", wrapper)
    dropdownBtn.Size = UDim2.new(0.44, 0, 0.72, 0)
    dropdownBtn.Position = UDim2.new(0.54, 0, 0.14, 0)
    dropdownBtn.BackgroundColor3 = C.inputBg
    dropdownBtn.BorderSizePixel = 0
    dropdownBtn.Text = defaultOption .. " ↕"
    dropdownBtn.TextColor3 = C.accent
    dropdownBtn.TextSize = 10
    dropdownBtn.Font = Enum.Font.GothamBold
    dropdownBtn.ZIndex = 17
    Instance.new("UICorner", dropdownBtn).CornerRadius = UDim.new(0, 5)

    local currentSelected = defaultOption
    local isOpen = false
    local dropFrame = nil

    local function setSelected(selected)
        currentSelected = selected
        dropdownBtn.Text = selected .. " ▼"
        if onSelect then onSelect(selected) end
    end

    dropdownBtn.MouseButton1Click:Connect(function()
        if isOpen then
            if dropFrame then dropFrame:Destroy() end
            isOpen = false
            return
        end

        dropFrame = Instance.new("Frame", screenGui)
        dropFrame.Size = UDim2.new(0, 140, 0, math.min(150, #options * 30 + 4))
        dropFrame.BackgroundColor3 = C.inputBg
        dropFrame.BorderSizePixel = 0
        dropFrame.ZIndex = 1000
        Instance.new("UICorner", dropFrame).CornerRadius = UDim.new(0, 5)

        local btnPos = dropdownBtn.AbsolutePosition
        dropFrame.Position = UDim2.new(0, btnPos.X + dropdownBtn.AbsoluteSize.X + 2, 0, btnPos.Y)

        local scroll = Instance.new("ScrollingFrame", dropFrame)
        scroll.Size = UDim2.new(1, 0, 1, 0)
        scroll.BackgroundTransparency = 1
        scroll.ScrollingDirection = Enum.ScrollingDirection.Y
        scroll.CanvasSize = UDim2.new(0, 0, 0, #options * 30)
        scroll.ScrollBarThickness = 3

        local layout = Instance.new("UIListLayout", scroll)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 1)

        for _, opt in ipairs(options) do
            local btn = Instance.new("TextButton", scroll)
            btn.Size = UDim2.new(1, 0, 0, 28)
            btn.BackgroundColor3 = C.inputBg
            btn.BorderSizePixel = 0
            btn.Text = ""
            btn.ZIndex = 1001

            local textLbl = Instance.new("TextLabel", btn)
            textLbl.Size = UDim2.new(1, 0, 1, 0)
            textLbl.BackgroundTransparency = 1
            textLbl.Text = opt
            textLbl.TextColor3 = (opt == currentSelected) and C.accent or C.textDim
            textLbl.TextSize = 10
            textLbl.Font = Enum.Font.GothamBold
            textLbl.ZIndex = 1002

            btn.MouseButton1Click:Connect(function()
                setSelected(opt)
                if dropFrame then dropFrame:Destroy() end
                isOpen = false
            end)
        end

        isOpen = true

        local function onInputBegan(input)
            if not isOpen then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                task.wait(0.1)
                local mousePos = UserInputService:GetMouseLocation()
                local btnAbs = dropdownBtn.AbsolutePosition
                local btnSize = dropdownBtn.AbsoluteSize
                local frameAbs = dropFrame and dropFrame.AbsolutePosition
                local frameSize = dropFrame and dropFrame.AbsoluteSize

                local inBtn = (mousePos.X >= btnAbs.X and mousePos.X <= btnAbs.X + btnSize.X and
                               mousePos.Y >= btnAbs.Y and mousePos.Y <= btnAbs.Y + btnSize.Y)
                local inFrame = frameAbs and (mousePos.X >= frameAbs.X and mousePos.X <= frameAbs.X + frameSize.X and
                                              mousePos.Y >= frameAbs.Y and mousePos.Y <= frameAbs.Y + frameSize.Y)

                if not inBtn and not inFrame then
                    if dropFrame then dropFrame:Destroy() end
                    isOpen = false
                    inputConnection:Disconnect()
                end
            end
        end

        local inputConnection = UserInputService.InputBegan:Connect(onInputBegan)
    end)

    return wrapper, dropdownBtn, setSelected
end

-- ==== PAGES ====
local function makePage(name)
    local page = Instance.new("Frame", scrollFrame)
    page.Size = UDim2.new(1, 0, 0, 0)
    page.AutomaticSize = Enum.AutomaticSize.Y
    page.BackgroundTransparency = 1
    page.Visible = false
    page.ZIndex = 12
    page.Name = name
    local layout = Instance.new("UIListLayout", page)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 3)
    return page
end

local mainPage = makePage("Main")
local playersPage = makePage("Players")
local teleportPage = makePage("Teleport")
local worldPage = makePage("World")
local espPage = makePage("ESP")

-- ==== STATE VARIABLES ====
local isFlying = false
local flySpeed = 300
local bodyVelocity, bodyGyro, flyConnection
local isSpeedHack = false
local currentSpeedValue = 22
local normalSpeed = 16
local isInfiniteJump = false
local infiniteJumpConn = nil
local isAntiLag = false
local origLighting = {}
local origQuality = nil
local disabledEffects = {}
local isAntiAfk = false
local antiAfkThread = nil
local isNoclip = false
local noclipConn = nil
local isMoonwalk = false
local moonwalkConn = nil
local isUnlimitedZoom = false
local origMaxZoom = nil
local isWalkOnWater = false
local walkOnWaterConn = nil
local autoTpActive = false
local autoTpTarget = nil
local autoTpConnection = nil

-- AUTO VAULT
local isAutoVault = false
local autoVaultConn = nil
local vaultCooldown = false
local destroyCooldown = false
local VAULT_RANGE = 5
local DESTROY_RANGE = 5

-- AUTO PARRY
local isAutoParry = false
local autoParryConn = nil
local parryRange = 10
local parryCooldown = false

-- AUTO KILL
local isAutoKill = false
local autoKillConn = nil
local attackCooldown = false

-- FULL BRIGHT
local isFullBright = false
local origFullBrightLighting = {}
local fullBrightConn = nil

-- ESP
local ESP_RANGE = 1000
local espKillerEnabled = false
local espKillerColor = Color3.fromRGB(255, 60, 60)
local espKillerHighlights = {}
local espSurvivorEnabled = false
local espSurvivorColor = Color3.fromRGB(0, 180, 255)
local espSurvivorHighlights = {}
local espUpdateConn = nil

local ESP_COLORS = {
    {name = "Crystal Blue", color = Color3.fromRGB(0, 180, 255)},
    {name = "Neon Green", color = Color3.fromRGB(0, 255, 120)},
    {name = "Gold Yellow", color = Color3.fromRGB(255, 215, 0)},
    {name = "Hot Red", color = Color3.fromRGB(255, 50, 50)},
    {name = "Magenta", color = Color3.fromRGB(255, 0, 200)},
    {name = "Orange", color = Color3.fromRGB(255, 140, 0)},
    {name = "White", color = Color3.fromRGB(255, 255, 255)},
    {name = "Lime", color = Color3.fromRGB(100, 255, 0)},
    {name = "Purple", color = Color3.fromRGB(160, 60, 255)},
    {name = "Teal", color = Color3.fromRGB(0, 200, 180)},
}
local ESP_KILLER_COLORS = ESP_COLORS
local ESP_SURVIVOR_COLORS = ESP_COLORS

-- ESP OBJECT
local espObjectEnabled = false
local espObjectUpdateConn = nil
local espObjectHighlights = {}
local ESP_OBJECT_TYPES = {
    {key = "Generator", label = "ESP Generator", keywords = {"Generator"}, color = Color3.fromRGB(255, 200, 0), enabled = true},
    {key = "Gate", label = "ESP Gate", keywords = {"Gate"}, color = Color3.fromRGB(0, 220, 120), enabled = true},
    {key = "Hook", label = "ESP Hook", keywords = {"Hook"}, color = Color3.fromRGB(255, 80, 80), enabled = true},
    {key = "Pallet", label = "ESP Pallet", keywords = {"Palletwrong"}, color = Color3.fromRGB(180, 100, 255), enabled = true},
    {key = "Vault", label = "ESP Vault", keywords = {"Window", "Vaults", "inviswall", "Object_1"}, color = Color3.fromRGB(255, 0, 200), enabled = true},
    {key = "Zombie", label = "ESP Zombie", keywords = {"Zombie", "zombie", "Dummy", "dummy", "NPC", "npc", "ZombieDummy", "ZombieNPC", "Enemy", "enemy"}, color = Color3.fromRGB(255, 100, 0), enabled = true},
}

-- CROSSHAIR
local crosshairEnabled = false
local crosshairModel = "+"
local crosshairGui = nil
local crosshairModels = {
    {id = "+", label = "Cross", sym = "+", size = 28, font = Enum.Font.GothamBold},
    {id = "×", label = "X", sym = "×", size = 28, font = Enum.Font.GothamBold},
    {id = "•", label = "Dot", sym = "•", size = 24, font = Enum.Font.GothamBold},
    {id = "∆", label = "Triangle", sym = "∆", size = 22, font = Enum.Font.GothamBold},
    {id = "°", label = "Circle", sym = "°", size = 30, font = Enum.Font.GothamBold},
}

local checkpoints = {
    {name = "GATE Bay Harbor (Container)", pos = Vector3.new(-1364.4, 58.9, -1608.9)},
    {name = "GATE Woodview Cabin (Hutan)", pos = Vector3.new(-207.6, 29.2, -1457.2)},
    {name = "GATE Mount Massive Asylum (Parkiran)", pos = Vector3.new(-1830.2, 173.1, -3286.1)},
    {name = "GATE Mercy Rooftop Hospital (Atap Gedung)", pos = Vector3.new(3118.9, 460.7, -4916.3)},
    {name = "GATE Firelink Shrine (Kuil Runtuh)", pos = Vector3.new(-962.1, 145.6, -7610.6)},
    {name = "GATE Site 68", pos = Vector3.new(149.5, 284.1, -809.3)},
    {name = "GATE Valdelobos Village (Desa)", pos = Vector3.new(783.0, -19.9, -77.2)},
    {name = "GATE Bloodbath Club", pos = Vector3.new(1576.5, 152.3, -790.6)},
}

-- ==== NOTIFICATION ====
local function showNotification(message, duration)
    duration = duration or 3
    local notif = Instance.new("Frame", screenGui)
    notif.Size = UDim2.new(0, 270, 0, 44)
    notif.Position = UDim2.new(0.5, -135, 0, -60)
    notif.BackgroundColor3 = Color3.fromRGB(10, 16, 28)
    notif.ZIndex = 100
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 7)
    local _ns = Instance.new("UIStroke", notif)
    _ns.Color = C.accent
    _ns.Thickness = 1
    local _nb = Instance.new("Frame", notif)
    _nb.Size = UDim2.new(0, 3, 0.65, 0)
    _nb.Position = UDim2.new(0, 0, 0.175, 0)
    _nb.BackgroundColor3 = C.accent
    _nb.BorderSizePixel = 0
    _nb.ZIndex = 101
    local nl = Instance.new("TextLabel", notif)
    nl.Size = UDim2.new(1, -18, 1, 0)
    nl.Position = UDim2.new(0, 14, 0, 0)
    nl.BackgroundTransparency = 1
    nl.Text = message
    nl.TextColor3 = C.text
    nl.TextWrapped = true
    nl.TextSize = 11
    nl.Font = Enum.Font.Gotham
    nl.ZIndex = 101
    TweenService:Create(notif, TweenInfo.new(0.28, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -135, 0, 14)}):Play()
    task.delay(duration, function()
        if notif and notif.Parent then
            TweenService:Create(notif, TweenInfo.new(0.22), {Position = UDim2.new(0.5, -135, 0, -65)}):Play()
            task.delay(0.25, function() if notif and notif.Parent then notif:Destroy() end end)
        end
    end)
end

-- ==== IS KILLER ====
local function isKiller(player)
    if player.Team and player.Team.Name:lower():find("killer") then return true end
    local char = player.Character
    if char then
        if char:FindFirstChild("KillerTag") then return true end
        local attr = char:GetAttribute("Role")
        if attr and tostring(attr):lower():find("killer") then return true end
    end
    local pattr = player:GetAttribute("Role")
    if pattr and tostring(pattr):lower():find("killer") then return true end
    return false
end

-- ==================================================================
-- ESP HELPERS
-- ==================================================================
local function makeHighlight(character, fillColor, outlineColor)
    local h = Instance.new("Highlight")
    h.Name = "YUJI_ESP"
    h.Adornee = character
    h.FillColor = fillColor
    h.OutlineColor = outlineColor
    h.FillTransparency = 0.82
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = character
    return h
end

local function makeBillboard(character, player, color)
    local bb = Instance.new("BillboardGui")
    bb.Name = "YUJI_ESP_Label"
    bb.Size = UDim2.new(0, 110, 0, 30)
    bb.StudsOffset = Vector3.new(0, 3.5, 0)
    bb.AlwaysOnTop = true
    bb.Parent = character
    local nl = Instance.new("TextLabel", bb)
    nl.Size = UDim2.new(1, 0, 1, 0)
    nl.BackgroundTransparency = 1
    nl.Text = player.Name
    nl.TextColor3 = color
    nl.TextStrokeColor3 = Color3.new(0, 0, 0)
    nl.TextStrokeTransparency = 0.3
    nl.TextSize = 13
    nl.Font = Enum.Font.GothamBold
    nl.ZIndex = 5
    return bb
end

local function removeESPEntry(tbl, player)
    if tbl[player] then
        local d = tbl[player]
        pcall(function() if d.highlight and d.highlight.Parent then d.highlight:Destroy() end end)
        pcall(function() if d.label and d.label.Parent then d.label:Destroy() end end)
        tbl[player] = nil
    end
end

local function addESPEntry(tbl, player, fillColor, outlineColor)
    if player == Players.LocalPlayer then return end
    if tbl[player] then return end
    local char = player.Character
    if not char then return end
    tbl[player] = {
        highlight = makeHighlight(char, fillColor, outlineColor),
        label = makeBillboard(char, player, outlineColor),
    }
end

local function updateESPTableColors(tbl, fillColor, outlineColor)
    for _, data in pairs(tbl) do
        if data.highlight and data.highlight.Parent then
            data.highlight.FillColor = fillColor
            data.highlight.OutlineColor = outlineColor
        end
        if data.label and data.label.Parent then
            local l = data.label:FindFirstChildOfClass("TextLabel")
            if l then l.TextColor3 = outlineColor end
        end
    end
end

local function validateESPEntry(tbl, player)
    local d = tbl[player]
    if not d then return false end
    local char = player.Character
    if not char then return false end
    if not d.highlight or not d.highlight.Parent or d.highlight.Parent ~= char then
        pcall(function() if d.highlight then d.highlight:Destroy() end end)
        pcall(function() if d.label then d.label:Destroy() end end)
        tbl[player] = nil
        return false
    end
    return true
end

local function startESPLoop()
    if espUpdateConn then return end
    espUpdateConn = RunService.Heartbeat:Connect(function()
        if not espKillerEnabled and not espSurvivorEnabled then return end
        local lp = Players.LocalPlayer
        local lpChar = lp and lp.Character
        local lpHRP = lpChar and lpChar:FindFirstChild("HumanoidRootPart")

        for _, player in ipairs(Players:GetPlayers()) do
            if player == lp then continue end
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local inRange = true
            if lpHRP and hrp then
                inRange = (lpHRP.Position - hrp.Position).Magnitude <= ESP_RANGE
            end

            local killer = isKiller(player)

            if killer then
                if espKillerEnabled and inRange and char then
                    if not validateESPEntry(espKillerHighlights, player) then
                        addESPEntry(espKillerHighlights, player, espKillerColor, espKillerColor)
                    end
                else
                    removeESPEntry(espKillerHighlights, player)
                end
                removeESPEntry(espSurvivorHighlights, player)
            else
                if espSurvivorEnabled and inRange and char then
                    if not validateESPEntry(espSurvivorHighlights, player) then
                        addESPEntry(espSurvivorHighlights, player, espSurvivorColor, espSurvivorColor)
                    end
                else
                    removeESPEntry(espSurvivorHighlights, player)
                end
                removeESPEntry(espKillerHighlights, player)
            end
        end

        for player in pairs(espKillerHighlights) do
            if not player.Parent then removeESPEntry(espKillerHighlights, player) end
        end
        for player in pairs(espSurvivorHighlights) do
            if not player.Parent then removeESPEntry(espSurvivorHighlights, player) end
        end
    end)
end

local function stopESPLoopIfUnused()
    if not espKillerEnabled and not espSurvivorEnabled then
        if espUpdateConn then espUpdateConn:Disconnect() espUpdateConn = nil end
    end
end

local function startESPKiller()
    espKillerEnabled = true
    startESPLoop()
    showNotification("ESP Killer ON")
end
local function stopESPKiller()
    espKillerEnabled = false
    for player in pairs(espKillerHighlights) do
        removeESPEntry(espKillerHighlights, player)
    end
    espKillerHighlights = {}
    stopESPLoopIfUnused()
    showNotification("ESP Killer OFF")
end
local function startESPSurvivor()
    espSurvivorEnabled = true
    startESPLoop()
    showNotification("ESP Survivor ON")
end
local function stopESPSurvivor()
    espSurvivorEnabled = false
    for player in pairs(espSurvivorHighlights) do
        removeESPEntry(espSurvivorHighlights, player)
    end
    espSurvivorHighlights = {}
    stopESPLoopIfUnused()
    showNotification("ESP Survivor OFF")
end

-- ==================================================================
-- ESP OBJECT
-- ==================================================================
local function matchesKeywords(name, keywords)
    for _, kw in ipairs(keywords) do if name == kw then return true end end
    return false
end

local function getObjectTypeData(name)
    for _, t in ipairs(ESP_OBJECT_TYPES) do
        if t.enabled and matchesKeywords(name, t.keywords) then return t end
    end
    return nil
end

local function removeESPObject(instance)
    if espObjectHighlights[instance] then
        local d = espObjectHighlights[instance]
        pcall(function() if d.highlight and d.highlight.Parent then d.highlight:Destroy() end end)
        pcall(function() if d.billboard and d.billboard.Parent then d.billboard:Destroy() end end)
        espObjectHighlights[instance] = nil
    end
end

local function addESPObject(instance, typeData)
    if espObjectHighlights[instance] then return end
    local target = instance
    if instance:IsA("BasePart") and instance.Parent and instance.Parent:IsA("Model") then
        target = instance.Parent
        if espObjectHighlights[target] then return end
    end
    local h = Instance.new("Highlight")
    h.Name = "YUJI_ESPObj_" .. typeData.key
    h.Adornee = target
    h.FillColor = typeData.color
    h.OutlineColor = typeData.color
    h.FillTransparency = 0.75
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = target
    espObjectHighlights[target] = {highlight = h, typeKey = typeData.key}
end

local function clearAllESPObjects()
    for i in pairs(espObjectHighlights) do removeESPObject(i) end
    espObjectHighlights = {}
end

local function scanAndApplyESPObjects()
    local lp = Players.LocalPlayer
    local lpChar = lp and lp.Character
    local lpHRP = lpChar and lpChar:FindFirstChild("HumanoidRootPart")
    for _, d in ipairs(workspace:GetDescendants()) do
        local isPlayerChar = false
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl.Character and d:IsDescendantOf(pl.Character) then isPlayerChar = true break end
        end
        if isPlayerChar then continue end
        if d:IsA("Model") or d:IsA("BasePart") then
            local td = getObjectTypeData(d.Name)
            if td then
                local pos = d:IsA("BasePart") and d.Position or (d:IsA("Model") and d.PrimaryPart and d.PrimaryPart.Position)
                local inRange = true
                if lpHRP and pos then inRange = (lpHRP.Position - pos).Magnitude <= 700 end
                if inRange then addESPObject(d, td) end
            end
        end
    end
end

local function startESPObjects()
    espObjectEnabled = true
    scanAndApplyESPObjects()
    espObjectUpdateConn = workspace.DescendantAdded:Connect(function(d)
        if not espObjectEnabled then return end
        local isPlayerChar = false
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl.Character and d:IsDescendantOf(pl.Character) then isPlayerChar = true break end
        end
        if isPlayerChar then return end
        if d:IsA("Model") or d:IsA("BasePart") then
            local td = getObjectTypeData(d.Name)
            if td then addESPObject(d, td) end
        end
    end)
    showNotification("ESP Object ON")
end

local function stopESPObjects()
    espObjectEnabled = false
    if espObjectUpdateConn then espObjectUpdateConn:Disconnect() espObjectUpdateConn = nil end
    clearAllESPObjects()
    showNotification("ESP Object OFF")
end

-- ==================================================================
-- CROSSHAIR
-- ==================================================================
local function buildCrosshairLabel()
    local md = crosshairModels[1]
    for _, m in ipairs(crosshairModels) do if m.id == crosshairModel then md = m break end end
    if crosshairGui then
        local l = crosshairGui:FindFirstChildOfClass("TextLabel")
        if l then l.Text = md.sym l.TextSize = md.size l.Font = md.font end
        return
    end
    crosshairGui = Instance.new("ScreenGui")
    crosshairGui.Name = "YUJI_Crosshair"
    crosshairGui.ResetOnSpawn = false
    crosshairGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    crosshairGui.DisplayOrder = 999
    crosshairGui.IgnoreGuiInset = true
    crosshairGui.Parent = CoreGui
    local l = Instance.new("TextLabel", crosshairGui)
    l.Size = UDim2.new(0, 40, 0, 40)
    l.AnchorPoint = Vector2.new(0.5, 0.5)
    l.Position = UDim2.new(0.5, 0, 0.5, 0)
    l.BackgroundTransparency = 1
    l.Text = md.sym
    l.TextColor3 = Color3.fromRGB(255, 255, 255)
    l.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    l.TextStrokeTransparency = 0.2
    l.TextSize = md.size
    l.Font = md.font
    l.ZIndex = 100
end

local function showCrosshair()
    crosshairEnabled = true
    buildCrosshairLabel()
    if crosshairGui then crosshairGui.Enabled = true end
    showNotification("Crosshair ON  [" .. crosshairModel .. "]")
end
local function hideCrosshair()
    crosshairEnabled = false
    if crosshairGui then crosshairGui.Enabled = false end
    showNotification("Crosshair OFF")
end
local function setCrosshairModel(id)
    crosshairModel = id
    if crosshairEnabled then buildCrosshairLabel() showNotification("Crosshair → " .. id) end
end

-- ==================================================================
-- COLOR PICKER
-- ==================================================================
local function makeColorPicker(parent, colorList, defaultIdx, layoutOrder, onSelect)
    local wrapper = Instance.new("Frame", parent)
    wrapper.Size = UDim2.new(1, 0, 0, 54)
    wrapper.BackgroundTransparency = 1
    wrapper.LayoutOrder = layoutOrder
    wrapper.ZIndex = 15
    wrapper.ClipsDescendants = true

    local scroll = Instance.new("ScrollingFrame", wrapper)
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.BackgroundTransparency = 1
    scroll.ScrollingDirection = Enum.ScrollingDirection.X
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.X
    scroll.ScrollBarThickness = 2
    scroll.ScrollBarImageColor3 = C.accent
    scroll.BorderSizePixel = 0
    scroll.ZIndex = 16

    local rowLayout = Instance.new("UIListLayout", scroll)
    rowLayout.FillDirection = Enum.FillDirection.Horizontal
    rowLayout.Padding = UDim.new(0, 6)
    rowLayout.VerticalAlignment = Enum.VerticalAlignment.Center

    local pad = Instance.new("UIPadding", scroll)
    pad.PaddingLeft = UDim.new(0, 2)
    pad.PaddingTop = UDim.new(0, 4)

    local btnRefs = {}
    local selectedIdx = defaultIdx or 1

    local function applySelection(idx)
        selectedIdx = idx
        for i, bd in ipairs(btnRefs) do
            if i == idx then
                TweenService:Create(bd.frame, TweenInfo.new(0.12), {BackgroundColor3 = colorList[i].color, BackgroundTransparency = 0}):Play()
                bd.stroke.Thickness = 2.5
                bd.stroke.Color = Color3.fromRGB(255, 255, 255)
                bd.check.Visible = true
                bd.nameLbl.TextColor3 = C.text
            else
                TweenService:Create(bd.frame, TweenInfo.new(0.12), {BackgroundColor3 = colorList[i].color, BackgroundTransparency = 0.5}):Play()
                bd.stroke.Thickness = 1.5
                bd.stroke.Color = colorList[i].color
                bd.check.Visible = false
                bd.nameLbl.TextColor3 = C.textDim
            end
        end
        if onSelect then onSelect(colorList[idx].color, colorList[idx].name) end
    end

    for i, cd in ipairs(colorList) do
        local entry = Instance.new("Frame", scroll)
        entry.Size = UDim2.new(0, 40, 1, -4)
        entry.BackgroundTransparency = 1
        entry.ZIndex = 17

        local entryLayout = Instance.new("UIListLayout", entry)
        entryLayout.FillDirection = Enum.FillDirection.Vertical
        entryLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        entryLayout.Padding = UDim.new(0, 2)

        local circle = Instance.new("Frame", entry)
        circle.Size = UDim2.new(0, 32, 0, 32)
        circle.BackgroundColor3 = cd.color
        circle.BackgroundTransparency = (i == defaultIdx) and 0 or 0.5
        circle.BorderSizePixel = 0
        circle.ZIndex = 18
        Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)

        local stroke = Instance.new("UIStroke", circle)
        stroke.Color = (i == defaultIdx) and Color3.fromRGB(255, 255, 255) or cd.color
        stroke.Thickness = (i == defaultIdx) and 2.5 or 1.5

        local check = Instance.new("TextLabel", circle)
        check.Size = UDim2.new(1, 0, 1, 0)
        check.BackgroundTransparency = 1
        check.Text = "✓"
        check.TextColor3 = Color3.fromRGB(255, 255, 255)
        check.TextSize = 14
        check.Font = Enum.Font.GothamBold
        check.ZIndex = 19
        check.Visible = (i == defaultIdx)

        local nameLbl = Instance.new("TextLabel", entry)
        nameLbl.Size = UDim2.new(0, 42, 0, 12)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = cd.name
        nameLbl.TextColor3 = (i == defaultIdx) and C.text or C.textDim
        nameLbl.TextSize = 8
        nameLbl.Font = Enum.Font.Gotham
        nameLbl.TextXAlignment = Enum.TextXAlignment.Center
        nameLbl.ZIndex = 17

        local clickBtn = Instance.new("TextButton", circle)
        clickBtn.Size = UDim2.new(1, 0, 1, 0)
        clickBtn.BackgroundTransparency = 1
        clickBtn.Text = ""
        clickBtn.ZIndex = 20

        table.insert(btnRefs, {frame = circle, stroke = stroke, check = check, nameLbl = nameLbl})
        local idx = i
        clickBtn.MouseButton1Click:Connect(function() applySelection(idx) end)
    end

    return wrapper
end

-- ==================================================================
-- ADMIN FUNCTIONS
-- ==================================================================
local AdminFunctions = {}

function AdminFunctions:TeleportToPlayer(targetPlayer)
    local lp = Players.LocalPlayer
    if lp and lp.Character and targetPlayer and targetPlayer.Character then
        local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
        local tHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp and tHrp then hrp.CFrame = tHrp.CFrame showNotification("Teleported → " .. targetPlayer.Name)
        else showNotification("Parts not found!") end
    else showNotification("Character not found!") end
end

function AdminFunctions:TeleportToCheckpoint(name, pos)
    local player = Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(pos)
    showNotification("Teleported → " .. name)
end

function AdminFunctions:ToggleFly()
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then return end
    isFlying = not isFlying
    if isFlying then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid.PlatformStand = true
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.zero
        bodyVelocity.MaxForce = Vector3.new(4e4, 4e4, 4e4)
        bodyVelocity.P = 1250
        bodyVelocity.Parent = rootPart
        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(4e4, 4e4, 4e4)
        bodyGyro.P = 1250
        bodyGyro.D = 250
        bodyGyro.CFrame = rootPart.CFrame
        bodyGyro.Parent = rootPart
        showNotification("Fly ON  [F to toggle]")
    else
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        humanoid.PlatformStand = false
        if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
        if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
        showNotification("Fly OFF")
    end
end

function AdminFunctions:SetSpeed(value)
    local char = Players.LocalPlayer.Character
    if not char then return end
    local h = char:FindFirstChildOfClass("Humanoid")
    if h then h.WalkSpeed = value end
end

function AdminFunctions:ToggleInfiniteJump()
    isInfiniteJump = not isInfiniteJump
    if isInfiniteJump then
        if not infiniteJumpConn then
            infiniteJumpConn = RunService.Heartbeat:Connect(function()
                local char = Players.LocalPlayer and Players.LocalPlayer.Character
                if not char then return end
                local h = char:FindFirstChildOfClass("Humanoid")
                if h then h:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) end
            end)
        end
        if not _G.YUJI_JumpInput then
            _G.YUJI_JumpInput = UserInputService.JumpRequest:Connect(function()
                if not isInfiniteJump then return end
                local char = Players.LocalPlayer and Players.LocalPlayer.Character
                if not char then return end
                local h = char:FindFirstChildOfClass("Humanoid")
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        end
        showNotification("Infinite Jump ON  [J to toggle]")
    else
        if infiniteJumpConn then infiniteJumpConn:Disconnect() infiniteJumpConn = nil end
        if _G.YUJI_JumpInput then _G.YUJI_JumpInput:Disconnect() _G.YUJI_JumpInput = nil end
        showNotification("Infinite Jump OFF")
    end
end

local function toggleMoonwalk()
    isMoonwalk = not isMoonwalk
    if isMoonwalk then
        moonwalkConn = RunService.Heartbeat:Connect(function()
            local char = Players.LocalPlayer and Players.LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - workspace.CurrentCamera.CFrame.LookVector) end
        end)
        showNotification("Moonwalk ON")
    else
        if moonwalkConn then moonwalkConn:Disconnect() moonwalkConn = nil end
        showNotification("Moonwalk OFF")
    end
end

local function toggleUnlimitedZoom()
    isUnlimitedZoom = not isUnlimitedZoom
    if isUnlimitedZoom then
        origMaxZoom = Players.LocalPlayer.CameraMaxZoomDistance
        Players.LocalPlayer.CameraMaxZoomDistance = 999999
        showNotification("Unlimited Zoom ON")
    else
        Players.LocalPlayer.CameraMaxZoomDistance = origMaxZoom or 400
        showNotification("Unlimited Zoom OFF")
    end
end

function AdminFunctions:ToggleWalkOnWater()
    isWalkOnWater = not isWalkOnWater
    if isWalkOnWater then
        if not walkOnWaterConn then
            walkOnWaterConn = RunService.Heartbeat:Connect(function()
                local char = Players.LocalPlayer and Players.LocalPlayer.Character
                if not char then return end
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                local h = char:FindFirstChildOfClass("Humanoid")
                if not h or h.Health <= 0 then return end
                local rp = RaycastParams.new()
                rp.FilterType = Enum.RaycastFilterType.Blacklist
                rp.FilterDescendantsInstances = {char}
                local rr = workspace:Raycast(hrp.Position, Vector3.new(0, -10, 0), rp)
                if rr and rr.Instance.Material == Enum.Material.Water then
                    if hrp.Position.Y <= rr.Position.Y + 2 then
                        hrp.CFrame = CFrame.new(hrp.Position.X, rr.Position.Y + 1, hrp.Position.Z)
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
                        h.PlatformStand = true
                    end
                else
                    h.PlatformStand = false
                end
            end)
        end
        showNotification("Walk on Water ON  [H to toggle]")
    else
        if walkOnWaterConn then walkOnWaterConn:Disconnect() walkOnWaterConn = nil end
        local char = Players.LocalPlayer and Players.LocalPlayer.Character
        if char then
            local h = char:FindFirstChildOfClass("Humanoid")
            if h then h.PlatformStand = false end
        end
        showNotification("Walk on Water OFF")
    end
end

function AdminFunctions:RemoveParts()
    local count = 0
    for _, part in ipairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and part.Parent ~= game.Players then part:Destroy() count = count + 1 end
    end
    showNotification("Removed " .. count .. " parts")
end

function AdminFunctions:CheckPosition()
    local char = Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local p = char.HumanoidRootPart.Position
        showNotification(string.format("X:%.1f  Y:%.1f  Z:%.1f", p.X, p.Y, p.Z), 5)
    else showNotification("Character not found!") end
end

function AdminFunctions:RejoinServer()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, Players.LocalPlayer)
end

function AdminFunctions:BringPart()
    local char = Players.LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local targetPart = nil
    local ray = workspace:Raycast(hrp.Position, hrp.CFrame.LookVector * 50, {char})
    if ray then
        targetPart = ray.Instance
    else
        local cd = math.huge
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("BasePart") and part ~= hrp and not part:IsDescendantOf(char) then
                local d = (hrp.Position - part.Position).Magnitude
                if d < cd and d < 50 then cd = d targetPart = part end
            end
        end
    end
    if targetPart then
        targetPart.CFrame = CFrame.new(hrp.Position + hrp.CFrame.LookVector * 10)
        showNotification("Brought: " .. targetPart.Name)
    else showNotification("No part found nearby!") end
end

function AdminFunctions:FlingPlayer(targetPlayer)
    local char = Players.LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local tChar = targetPlayer.Character
    if not tChar then return end
    local tHrp = tChar:FindFirstChild("HumanoidRootPart")
    if not tHrp then return end
    local bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.new(0, 100, 0) + (hrp.CFrame.LookVector * 100)
    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    bv.P = 1e5
    bv.Parent = tHrp
    local bav = Instance.new("BodyAngularVelocity")
    bav.AngularVelocity = Vector3.new(0, 50, 0)
    bav.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    bav.Parent = tHrp
    showNotification("Flinging " .. targetPlayer.Name)
    task.delay(1, function() if bv then bv:Destroy() end if bav then bav:Destroy() end end)
end

-- ==================================================================
-- FULL BRIGHT
-- ==================================================================
local function toggleFullBright()
    isFullBright = not isFullBright
    if isFullBright then
        origFullBrightLighting = {
            Ambient = Lighting.Ambient,
            Brightness = Lighting.Brightness,
            GlobalShadows = Lighting.GlobalShadows,
            FogEnd = Lighting.FogEnd,
            FogStart = Lighting.FogStart,
            ClockTime = Lighting.ClockTime,
        }
        fullBrightConn = RunService.Heartbeat:Connect(function()
            if not isFullBright then return end
            pcall(function()
                Lighting.Ambient = Color3.new(1, 1, 1)
                Lighting.Brightness = 2
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 100000
                Lighting.FogStart = 0
                Lighting.ClockTime = 12
            end)
        end)
        showNotification("Full Bright ON")
    else
        if fullBrightConn then
            fullBrightConn:Disconnect()
            fullBrightConn = nil
        end
        for prop, val in pairs(origFullBrightLighting) do
            pcall(function() Lighting[prop] = val end)
        end
        showNotification("Full Bright OFF")
    end
end

-- ==================================================================
-- ANTI LAG
-- ==================================================================
local antiLagConn = nil
local antiLagDescendantConn = nil

local function applyAntiLag()
    pcall(function()
        Lighting.GlobalShadows = false
        Lighting.ShadowSoftness = 0
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.Brightness = 1.5
    end)
    pcall(function()
        local us = UserSettings():GetService("UserGameSettings")
        us.QualityLevel = 1
    end)
end

local function disableEffect(obj)
    if (obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam")
        or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles")) and obj.Enabled then
        obj.Enabled = false
        table.insert(disabledEffects, obj)
    end
end

local function toggleAntiLag()
    isAntiLag = not isAntiLag
    if isAntiLag then
        origLighting = {
            GlobalShadows = Lighting.GlobalShadows,
            ShadowSoftness = Lighting.ShadowSoftness,
            Ambient = Lighting.Ambient,
            Brightness = Lighting.Brightness,
        }
        antiLagConn = RunService.Heartbeat:Connect(function()
            if not isAntiLag then return end
            applyAntiLag()
        end)
        antiLagDescendantConn = workspace.DescendantAdded:Connect(function(obj)
            if not isAntiLag then return end
            disableEffect(obj)
        end)
        for _, c in ipairs(workspace:GetDescendants()) do
            disableEffect(c)
        end
        showNotification("Anti Lag ON  [L to toggle]")
    else
        if antiLagConn then antiLagConn:Disconnect() antiLagConn = nil end
        if antiLagDescendantConn then antiLagDescendantConn:Disconnect() antiLagDescendantConn = nil end
        for prop, val in pairs(origLighting) do
            pcall(function() Lighting[prop] = val end)
        end
        for _, eff in ipairs(disabledEffects) do
            pcall(function() if eff and eff.Parent then eff.Enabled = true end end)
        end
        disabledEffects = {}
        if origQuality then
            pcall(function()
                local us = UserSettings():GetService("UserGameSettings")
                us.QualityLevel = origQuality
            end)
        end
        showNotification("Anti Lag OFF")
    end
end

local function toggleAntiAfk()
    isAntiAfk = not isAntiAfk
    if isAntiAfk then
        antiAfkThread = coroutine.create(function()
            while isAntiAfk do
                wait(30)
                local player = Players.LocalPlayer
                if not player then continue end
                local char = player.Character or player.CharacterAdded:Wait()
                local h = char:FindFirstChildOfClass("Humanoid")
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if h and hrp and h.Health > 0 then
                    local cf = hrp.CFrame
                    hrp.CFrame = cf + cf.LookVector * 2
                    wait(0.1)
                    hrp.CFrame = cf
                end
            end
        end)
        coroutine.resume(antiAfkThread)
        showNotification("Anti AFK ON  [K to toggle]")
    else
        antiAfkThread = nil
        showNotification("Anti AFK OFF")
    end
end

local function toggleNoclip()
    isNoclip = not isNoclip
    if isNoclip then
        noclipConn = RunService.Heartbeat:Connect(function()
            local char = Players.LocalPlayer and Players.LocalPlayer.Character
            if not char then return end
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
            end
        end)
        showNotification("Noclip ON")
    else
        if noclipConn then noclipConn:Disconnect() noclipConn = nil end
        local char = Players.LocalPlayer and Players.LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = true end
            end
        end
        showNotification("Noclip OFF")
    end
end

-- ==================================================================
-- AUTO VAULT
-- ==================================================================
local function findVaultTrigger(hrp, maxDist)
    local nearest, nearDist = nil, math.huge
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Name == "VaultTrigger" or obj.Name:lower():find("window")) then
            local hasPrompt = false
            for _, child in ipairs(obj:GetDescendants()) do
                if child:IsA("ProximityPrompt") and child.Enabled then
                    hasPrompt = true
                    break
                end
            end
            if hasPrompt then
                local dist = (hrp.Position - obj.Position).Magnitude
                if dist < nearDist and dist <= maxDist then
                    nearDist = dist
                    nearest = obj
                end
            end
        end
    end
    return nearest, nearDist
end

local function performRemoteVault(trigger)
    if not trigger then return false end
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if not remotes then return false end
    local window = remotes:FindFirstChild("Window")
    if not window then return false end
    local vaultEvent = window:FindFirstChild("VaultEvent")
    local vaultComplete = window:FindFirstChild("VaultCompleteEvent")
    if not vaultEvent or not vaultComplete then return false end
    pcall(function()
        vaultEvent:FireServer(trigger, true)
        task.wait(0.1)
        vaultComplete:FireServer(trigger, false)
    end)
    return true
end

local function findPrompts(instance)
    local prompts = {}
    if instance:IsA("ProximityPrompt") then
        table.insert(prompts, instance)
    end
    for _, d in ipairs(instance:GetDescendants()) do
        if d:IsA("ProximityPrompt") then
            table.insert(prompts, d)
        end
    end
    return prompts
end

local function getObjectPosition(obj)
    if obj:IsA("BasePart") then
        return obj.Position
    elseif obj:IsA("Model") then
        if obj.PrimaryPart then return obj.PrimaryPart.Position end
        for _, p in ipairs(obj:GetDescendants()) do
            if p:IsA("BasePart") then return p.Position end
        end
    end
    return nil
end

local function isPalletUsed(model)
    local dropped = model:GetAttribute("Dropped") or model:GetAttribute("IsDown") or model:GetAttribute("Used") or model:GetAttribute("IsBroken")
    if dropped == true then return true end
    if model:FindFirstChild("Dropped") or model:FindFirstChild("Down") then return true end
    local mainPart = model:IsA("BasePart") and model or model.PrimaryPart
    if not mainPart then
        for _, p in ipairs(model:GetDescendants()) do
            if p:IsA("BasePart") then mainPart = p break end
        end
    end
    if mainPart then
        local _, _, _, r00, r01, r02, r10, r11, r12, r20, r21, r22 = mainPart.CFrame:GetComponents()
        if math.abs(r11) < 0.5 then return true end
    end
    local prompts = findPrompts(model)
    if #prompts == 0 then return true end
    local hasEnabled = false
    for _, pr in ipairs(prompts) do
        if pr.Enabled then hasEnabled = true break end
    end
    if not hasEnabled then return true end
    return false
end

local function fireProximityPrompt(prompt)
    if not prompt or not prompt.Enabled then return false end
    local ok = pcall(function()
        if typeof(fireproximityprompt) == "function" then
            fireproximityprompt(prompt)
        else
            prompt:InputHoldBegin()
            task.wait(math.max(prompt.HoldDuration, 0.05) + 0.05)
            prompt:InputHoldEnd()
        end
    end)
    return ok
end

local function performDestroyPalletPrompt(obj)
    local prompts = findPrompts(obj)
    for _, pr in ipairs(prompts) do
        if pr.Enabled then
            local actionLower = (pr.ActionText or ""):lower()
            local objLower = (pr.ObjectText or ""):lower()
            if actionLower:find("destroy") or actionLower:find("break") or actionLower:find("smash") or objLower:find("pallet") or actionLower:find("hancur") then
                fireProximityPrompt(pr)
                return true
            end
        end
    end
    for _, pr in ipairs(prompts) do
        if pr.Enabled then
            fireProximityPrompt(pr)
            return true
        end
    end
    return false
end

local AUTO_VAULT_FPS = 0.12
local lastVaultTick = 0
local cachedPallets = {}
local lastCache = 0
local CACHE_DELAY = 2

local function refreshVaultCache()
    cachedPallets = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "Palletwrong" then
            table.insert(cachedPallets, obj)
        end
    end
end

local function getNearestObject(list, hrp, maxDist, checkUsed)
    local nearest = nil
    local nearestDist = maxDist
    for i = 1, #list do
        local obj = list[i]
        if obj and obj.Parent then
            if checkUsed == nil or checkUsed(obj) then
                local pos = getObjectPosition(obj)
                if pos then
                    local dist = (hrp.Position - pos).Magnitude
                    if dist < nearestDist then
                        nearestDist = dist
                        nearest = obj
                    end
                end
            end
        end
    end
    return nearest, nearestDist
end

local function startAutoVault()
    if isAutoVault then return end
    isAutoVault = true
    refreshVaultCache()
    autoVaultConn = RunService.RenderStepped:Connect(function()
        if not isAutoVault then return end
        local now = tick()
        if now - lastVaultTick < AUTO_VAULT_FPS then return end
        lastVaultTick = now
        if now - lastCache > CACHE_DELAY then
            lastCache = now
            refreshVaultCache()
        end
        local lp = Players.LocalPlayer
        local char = lp.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end
        local amKiller = isKiller(lp)

        pcall(function()
            if not amKiller then
                if vaultCooldown then return end
                local trigger, dist = findVaultTrigger(hrp, VAULT_RANGE)
                if trigger then
                    vaultCooldown = true
                    performRemoteVault(trigger)
                    task.delay(0.6, function() vaultCooldown = false end)
                end
            else
                if not vaultCooldown then
                    local trigger = findVaultTrigger(hrp, VAULT_RANGE)
                    if trigger then
                        vaultCooldown = true
                        performRemoteVault(trigger)
                        task.delay(0.6, function() vaultCooldown = false end)
                    end
                end
                if not destroyCooldown then
                    local nearestPallet = getNearestObject(cachedPallets, hrp, DESTROY_RANGE, function(obj) return isPalletUsed(obj) end)
                    if nearestPallet then
                        destroyCooldown = true
                        performDestroyPalletPrompt(nearestPallet)
                        task.delay(0.8, function() destroyCooldown = false end)
                    end
                end
            end
        end)
    end)
    local roleTxt = isKiller(Players.LocalPlayer) and "Killer" or "Survivor"
    showNotification("Auto Vault ON [" .. roleTxt .. "]")
end

local function stopAutoVault()
    isAutoVault = false
    if autoVaultConn then autoVaultConn:Disconnect() autoVaultConn = nil end
    vaultCooldown = false
    destroyCooldown = false
    showNotification("Auto Vault OFF")
end

-- ==================================================================
-- AUTO KILL
-- ==================================================================
local function performAttack()
    local lp = Players.LocalPlayer
    local char = lp and lp.Character
    if not char then return false end

    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") then
            pcall(function()
                tool:Activate()
                task.wait(0.05)
                tool:Deactivate()
            end)
            return true
        end
    end

    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes then
        local possible = {
            remotes:FindFirstChild("Attack"),
            remotes:FindFirstChild("Hit"),
            remotes:FindFirstChild("Damage"),
            remotes:FindFirstChild("Kill"),
        }
        for _, r in ipairs(possible) do
            if r and r:IsA("RemoteEvent") then
                pcall(function() r:FireServer() end)
                return true
            end
        end
        for _, child in ipairs(remotes:GetChildren()) do
            if child:IsA("RemoteEvent") then
                local name = child.Name:lower()
                if name:find("attack") or name:find("hit") or name:find("damage") then
                    pcall(function() child:FireServer() end)
                    return true
                end
            end
        end
    end

    for _, child in ipairs(workspace:GetChildren()) do
        if child:IsA("RemoteEvent") then
            local name = child.Name:lower()
            if name:find("attack") or name:find("hit") then
                pcall(function() child:FireServer() end)
                return true
            end
        end
    end

    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)

    return false
end

local function startAutoKill()
    if isAutoKill then return end
    isAutoKill = true
    attackCooldown = false

    autoKillConn = RunService.Heartbeat:Connect(function()
        if not isAutoKill then return end

        local lp = Players.LocalPlayer
        local char = lp and lp.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local survivors = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= lp and not isKiller(player) then
                local pChar = player.Character
                if pChar then
                    local hum = pChar:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        local pHrp = pChar:FindFirstChild("HumanoidRootPart")
                        if pHrp then
                            table.insert(survivors, {player = player, hrp = pHrp, hum = hum})
                        end
                    end
                end
            end
        end

        if #survivors == 0 then
            stopAutoKill()
            showNotification("All survivors knocked! Auto Kill stopped.")
            return
        end

        local target = nil
        local minDist = math.huge
        for _, s in ipairs(survivors) do
            local dist = (hrp.Position - s.hrp.Position).Magnitude
            if dist < minDist then
                minDist = dist
                target = s
            end
        end

        if target and not attackCooldown then
            hrp.CFrame = target.hrp.CFrame
            performAttack()
            attackCooldown = true
            task.delay(0.15, function() attackCooldown = false end)
        end
    end)

    showNotification("Auto Kill ON")
end

local function stopAutoKill()
    isAutoKill = false
    attackCooldown = false
    if autoKillConn then
        autoKillConn:Disconnect()
        autoKillConn = nil
    end
    showNotification("Auto Kill OFF")
end

-- ==================================================================
-- AUTO PARRY
-- ==================================================================
local function performParry()
    local lp = Players.LocalPlayer
    local char = lp and lp.Character
    if not char then return false end

    local tool = char:FindFirstChild("Parrying Dagger")
    if not tool then
        for _, t in ipairs(lp.Backpack:GetChildren()) do
            if t.Name == "Parrying Dagger" then
                tool = t
                break
            end
        end
    end
    if not tool then return false end

    local remote = nil
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if remotes then
        local items = remotes:FindFirstChild("Items")
        if items then
            local dagger = items:FindFirstChild("Parrying Dagger")
            if dagger then
                remote = dagger:FindFirstChild("parry")
            end
        end
    end
    if not remote or not remote:IsA("RemoteEvent") then
        local toolRemote = tool:FindFirstChild("parry")
        if toolRemote and toolRemote:IsA("RemoteEvent") then
            remote = toolRemote
        end
    end
    if not remote then return false end

    pcall(function()
        remote:FireServer()
    end)
    return true
end

local function startAutoParry()
    if isAutoParry then return end
    isAutoParry = true
    parryCooldown = false

    autoParryConn = RunService.Heartbeat:Connect(function()
        if not isAutoParry then return end
        if parryCooldown then return end

        local lp = Players.LocalPlayer
        local char = lp and lp.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local amKiller = isKiller(lp)
        local target = nil
        local minDist = parryRange

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= lp then
                local isTargetKiller = isKiller(player)
                if (amKiller and not isTargetKiller) or (not amKiller and isTargetKiller) then
                    local pChar = player.Character
                    if pChar then
                        local pHrp = pChar:FindFirstChild("HumanoidRootPart")
                        if pHrp then
                            local dist = (hrp.Position - pHrp.Position).Magnitude
                            if dist < minDist then
                                minDist = dist
                                target = player
                            end
                        end
                    end
                end
            end
        end

        if target then
            performParry()
            parryCooldown = true
            task.delay(0.3, function() parryCooldown = false end)
        end
    end)

    showNotification("Auto Parry ON (Range: " .. parryRange .. ")")
end

local function stopAutoParry()
    isAutoParry = false
    if autoParryConn then
        autoParryConn:Disconnect()
        autoParryConn = nil
    end
    parryCooldown = false
    showNotification("Auto Parry OFF")
end

-- ==================================================================
-- AUTO TELEPORT
-- ==================================================================
local function stopAutoTeleport()
    if autoTpConnection then
        autoTpConnection:Disconnect()
        autoTpConnection = nil
    end
    autoTpActive = false
    autoTpTarget = nil
    showNotification("Auto Teleport stopped")
end

local function startAutoTeleport(targetPlayer)
    if autoTpActive then stopAutoTeleport() end
    if not targetPlayer or not targetPlayer.Parent then showNotification("Player not found!") return end
    autoTpTarget = targetPlayer
    autoTpActive = true
    showNotification("Auto Teleport → " .. targetPlayer.Name)

    autoTpConnection = RunService.RenderStepped:Connect(function()
        if not autoTpActive or not autoTpTarget or not autoTpTarget.Parent then
            stopAutoTeleport()
            return
        end
        local lp = Players.LocalPlayer
        local tChar = autoTpTarget.Character
        if lp and lp.Character and tChar then
            local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
            local tHrp = tChar:FindFirstChild("HumanoidRootPart")
            if hrp and tHrp then
                hrp.CFrame = tHrp.CFrame
            end
        end
    end)
end

-- ==================================================================
-- SPEED ENGINE
-- ==================================================================
local speedConn = nil
local speedBV = nil

local function stopSpeedEngine()
    if speedConn then speedConn:Disconnect() speedConn = nil end
    local char = Players.LocalPlayer and Players.LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local bv = hrp:FindFirstChild("YUJI_SpeedBV")
            if bv then bv:Destroy() end
        end
        local h = char:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed = normalSpeed end
    end
end

local function applyWalkSpeed(val)
    local char = Players.LocalPlayer and Players.LocalPlayer.Character
    if not char then return end
    local h = char:FindFirstChildOfClass("Humanoid")
    if h then h.WalkSpeed = val end
end

local function applyAttribute(val)
    local char = Players.LocalPlayer and Players.LocalPlayer.Character
    if not char then return end
    local h = char:FindFirstChildOfClass("Humanoid")
    if h then
        pcall(function() h:SetAttribute("WalkSpeed", val) end)
        h.WalkSpeed = val
    end
end

local function startCFramePush(multiplier)
    stopSpeedEngine()
    speedConn = RunService.Heartbeat:Connect(function(dt)
        local char = Players.LocalPlayer and Players.LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local h = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not h or h.Health <= 0 then return end
        local md = h.MoveDirection
        if md.Magnitude > 0.01 then
            hrp.CFrame = hrp.CFrame + md * (multiplier * dt * 1.5)
        end
    end)
end

local function startBodyVelocity(val)
    stopSpeedEngine()
    speedConn = RunService.Heartbeat:Connect(function(dt)
        local char = Players.LocalPlayer and Players.LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local h = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not h or h.Health <= 0 then return end
        local bv = hrp:FindFirstChild("YUJI_SpeedBV")
        if not bv then
            bv = Instance.new("BodyVelocity")
            bv.Name = "YUJI_SpeedBV"
            bv.MaxForce = Vector3.new(1e4, 0, 1e4)
            bv.P = 1e4
            bv.Velocity = Vector3.zero
            bv.Parent = hrp
        end
        local md = h.MoveDirection
        if md.Magnitude > 0.01 then
            bv.Velocity = md * val
        else
            bv.Velocity = Vector3.zero
        end
    end)
end

local function startHybrid(val)
    stopSpeedEngine()
    local char = Players.LocalPlayer and Players.LocalPlayer.Character
    if char then
        local h = char:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed = math.min(val * 0.5, 28) end
    end
    local boost = val * 0.012
    speedConn = RunService.Heartbeat:Connect(function(dt)
        local c = Players.LocalPlayer and Players.LocalPlayer.Character
        if not c then return end
        local hrp = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end
        local md = hum.MoveDirection
        if md.Magnitude > 0.01 then
            hrp.CFrame = hrp.CFrame + md * (boost * dt * 60)
        end
    end)
end

local METHOD_DESC = {
    ["WalkSpeed"] = "WalkSpeed (Direct)",
    ["Attribute"] = "Attribute Override",
    ["CFrame"] = "CFrame Push (bypass WS)",
    ["BodyVel"] = "BodyVelocity (bypass WS)",
    ["Hybrid"] = "Hybrid CFrame+WS (VD best)",
}
local METHOD_LIST = {"WalkSpeed", "Attribute", "CFrame", "BodyVel", "Hybrid"}

-- ==================================================================
-- AUTO GENERATOR RUSH
-- ==================================================================
local isAutoGenRush = false
local autoGenRushConn = nil
local genRushCooldown = false

local function findNearestGenerator(hrp)
    local nearest, nearDist = nil, math.huge
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("Model") or obj:IsA("BasePart")) then
            local nameLower = obj.Name:lower()
            if nameLower:find("generator") then
                local pos = obj:IsA("BasePart") and obj.Position or (obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position)
                if pos then
                    local dist = (hrp.Position - pos).Magnitude
                    if dist < nearDist then
                        nearDist = dist
                        nearest = obj
                    end
                end
            end
        end
    end
    return nearest, nearDist
end

local function findOtherGeneratorInRange(hrp, excludeGen, range)
    local best, bestDist = nil, math.huge
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj ~= excludeGen and (obj:IsA("Model") or obj:IsA("BasePart")) then
            local nameLower = obj.Name:lower()
            if nameLower:find("generator") then
                local pos = obj:IsA("BasePart") and obj.Position or (obj:IsA("Model") and obj.PrimaryPart and obj.PrimaryPart.Position)
                if pos then
                    local dist = (hrp.Position - pos).Magnitude
                    if dist <= range and dist < bestDist then
                        bestDist = dist
                        best = obj
                    end
                end
            end
        end
    end
    return best, bestDist
end

local function teleportToGenerator(gen, hrp)
    if not gen or not hrp then return false end
    local pos = gen:IsA("BasePart") and gen.Position or (gen:IsA("Model") and gen.PrimaryPart and gen.PrimaryPart.Position)
    if pos then
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 4))
        return true
    end
    return false
end

local function teleportToNearestGen(maxDist)
    local lp = Players.LocalPlayer
    local char = lp and lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local nearestGen, dist = findNearestGenerator(hrp)
    if nearestGen and dist <= maxDist then
        local pos = nearestGen:IsA("BasePart") and nearestGen.Position or (nearestGen:IsA("Model") and nearestGen.PrimaryPart and nearestGen.PrimaryPart.Position)
        if pos then
            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 4))
            showNotification("Teleported to Generator (" .. math.floor(dist) .. " studs)")
        end
    else
        showNotification("No generator within " .. maxDist .. " studs")
    end
end

local function startAutoGenRush()
    if isAutoGenRush then return end
    isAutoGenRush = true
    genRushCooldown = false
    autoGenRushConn = RunService.Heartbeat:Connect(function()
        if not isAutoGenRush then return end
        if genRushCooldown then return end

        local tpRange = _G.autoTpRange or 30
        local escapeRange = _G.killerEscapeRange or 20

        local lp = Players.LocalPlayer
        local char = lp and lp.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end

        local nearestGen, distToNearest = findNearestGenerator(hrp)
        if not nearestGen then return end

        local killerNear = false
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= lp and isKiller(player) then
                local kChar = player.Character
                local kHrp = kChar and kChar:FindFirstChild("HumanoidRootPart")
                if kHrp and (hrp.Position - kHrp.Position).Magnitude <= escapeRange then
                    killerNear = true
                    break
                end
            end
        end

        if killerNear then
            local otherGen, distOther = findOtherGeneratorInRange(hrp, nearestGen, tpRange)
            if otherGen then
                if teleportToGenerator(otherGen, hrp) then
                    showNotification("⚠ Killer near! Teleport ke generator lain", 1.5)
                    genRushCooldown = true
                    task.delay(1, function() genRushCooldown = false end)
                end
            else
                showNotification("⚠ Killer near! Tidak ada generator lain dalam range", 1.5)
                genRushCooldown = true
                task.delay(1.5, function() genRushCooldown = false end)
            end
        else
            if distToNearest > tpRange then
                if teleportToGenerator(nearestGen, hrp) then
                    showNotification("Auto teleport ke generator (" .. math.floor(distToNearest) .. " studs)", 1)
                    genRushCooldown = true
                    task.delay(1, function() genRushCooldown = false end)
                end
            end
        end
    end)
    showNotification("Auto Gen Rush ON (Range: " .. (_G.autoTpRange or 30) .. " | Escape: " .. (_G.killerEscapeRange or 20) .. ")")
end

local function stopAutoGenRush()
    isAutoGenRush = false
    if autoGenRushConn then autoGenRushConn:Disconnect() autoGenRushConn = nil end
    genRushCooldown = false
    showNotification("Auto Gen Rush OFF")
end

-- ==================================================================
-- FLY BUTTONS & SLIDER
-- ==================================================================
local flyInput = {forward = false, backward = false, left = false, right = false, up = false, down = false}
local BW, BH, GAP = 40, 40, 5

local dpadFrame = Instance.new("Frame", screenGui)
dpadFrame.Size = UDim2.new(0, BW * 3 + GAP * 2, 0, BH * 2 + GAP)
dpadFrame.Position = UDim2.new(0, 10, 1, -(BH * 2 + GAP + 90))
dpadFrame.BackgroundTransparency = 1
dpadFrame.Visible = false
dpadFrame.ZIndex = 60
dpadFrame.Name = "FlyDpad"

local udFrame = Instance.new("Frame", screenGui)
udFrame.Size = UDim2.new(0, BW, 0, BH * 2 + GAP)
udFrame.Position = UDim2.new(1, -(BW + 8 + 85), 1, -(BH * 2 + GAP + 80))
udFrame.BackgroundTransparency = 1
udFrame.Visible = false
udFrame.ZIndex = 60
udFrame.Name = "FlyUD"

local lblUD = Instance.new("TextLabel", udFrame)
lblUD.Size = UDim2.new(0, BW, 0, 14)
lblUD.Position = UDim2.new(0, 0, 1, 2)
lblUD.BackgroundTransparency = 1
lblUD.Text = "FLY"
lblUD.TextColor3 = Color3.fromRGB(0, 180, 255)
lblUD.TextSize = 9
lblUD.Font = Enum.Font.GothamBold
lblUD.ZIndex = 61

local function makeFlyBtn(parent, label, posX, posY, w, h, onDown, onUp)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, w, 0, h)
    btn.Position = UDim2.new(0, posX, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(10, 20, 40)
    btn.BackgroundTransparency = 0.25
    btn.Text = label
    btn.TextColor3 = Color3.fromRGB(200, 230, 255)
    btn.TextSize = 18
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.ZIndex = 61
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    local bs = Instance.new("UIStroke", btn)
    bs.Color = Color3.fromRGB(0, 180, 255)
    bs.Thickness = 1.5
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            btn.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
            btn.BackgroundTransparency = 0.15
            onDown()
        end
    end)
    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            btn.BackgroundColor3 = Color3.fromRGB(10, 20, 40)
            btn.BackgroundTransparency = 0.25
            onUp()
        end
    end)
    return btn
end

makeFlyBtn(dpadFrame, "↑", BW + GAP, 0, BW, BH, function() flyInput.forward = true end, function() flyInput.forward = false end)
makeFlyBtn(dpadFrame, "←", 0, BH + GAP, BW, BH, function() flyInput.left = true end, function() flyInput.left = false end)
makeFlyBtn(dpadFrame, "↓", BW + GAP, BH + GAP, BW, BH, function() flyInput.backward = true end, function() flyInput.backward = false end)
makeFlyBtn(dpadFrame, "→", (BW + GAP) * 2, BH + GAP, BW, BH, function() flyInput.right = true end, function() flyInput.right = false end)
makeFlyBtn(udFrame, "↑", 0, 0, BW, BH, function() flyInput.up = true end, function() flyInput.up = false end)
makeFlyBtn(udFrame, "↓", 0, BH + GAP, BW, BH, function() flyInput.down = true end, function() flyInput.down = false end)

local function flyControl()
    if not isFlying or not bodyVelocity or not bodyGyro then return end
    local char = Players.LocalPlayer.Character
    if not char then return end
    local rp = char:FindFirstChild("HumanoidRootPart")
    if not rp then return end
    bodyGyro.CFrame = workspace.CurrentCamera.CFrame
    local speed = flySpeed
    local dir = Vector3.zero
    local cam = workspace.CurrentCamera.CFrame
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.LookVector * speed end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.LookVector * speed end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.RightVector * speed end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.RightVector * speed end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, speed, 0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0, speed, 0) end
    if flyInput.forward then dir = dir + cam.LookVector * speed end
    if flyInput.backward then dir = dir - cam.LookVector * speed end
    if flyInput.right then dir = dir + cam.RightVector * speed end
    if flyInput.left then dir = dir - cam.RightVector * speed end
    if flyInput.up then dir = dir + Vector3.new(0, speed, 0) end
    if flyInput.down then dir = dir - Vector3.new(0, speed, 0) end
    bodyVelocity.Velocity = dir
end
flyConnection = RunService.Heartbeat:Connect(flyControl)

local sliderFrame = nil
pcall(function()
    sliderFrame = Instance.new("Frame", screenGui)
    local sliderWidth = BW * 3 + GAP * 2
    local sliderHeight = 54
    local sliderX = 10
    local dpadTotalHeight = BH * 2 + GAP + 90
    local sliderY = -(dpadTotalHeight + sliderHeight + 8)
    sliderFrame.Size = UDim2.new(0, sliderWidth, 0, sliderHeight)
    sliderFrame.Position = UDim2.new(0, sliderX, 1, sliderY)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(10, 20, 40)
    sliderFrame.BackgroundTransparency = 0.25
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Visible = false
    sliderFrame.ZIndex = 60
    sliderFrame.Name = "FlySpeedSliderPanel"
    Instance.new("UICorner", sliderFrame).CornerRadius = UDim.new(0, 8)
    local _slStroke = Instance.new("UIStroke", sliderFrame)
    _slStroke.Color = Color3.fromRGB(0, 180, 255)
    _slStroke.Thickness = 1.5

    local slLabelTop = Instance.new("TextLabel", sliderFrame)
    slLabelTop.Size = UDim2.new(1, -10, 0, 16)
    slLabelTop.Position = UDim2.new(0, 8, 0, 4)
    slLabelTop.BackgroundTransparency = 1
    slLabelTop.Text = "FLY SPEED"
    slLabelTop.TextColor3 = Color3.fromRGB(0, 180, 255)
    slLabelTop.TextSize = 9
    slLabelTop.Font = Enum.Font.GothamBold
    slLabelTop.TextXAlignment = Enum.TextXAlignment.Left
    slLabelTop.ZIndex = 61

    local slValueLbl = Instance.new("TextLabel", sliderFrame)
    slValueLbl.Size = UDim2.new(0, 50, 0, 16)
    slValueLbl.Position = UDim2.new(1, -58, 0, 4)
    slValueLbl.BackgroundTransparency = 1
    slValueLbl.Text = tostring(flySpeed)
    slValueLbl.TextColor3 = Color3.fromRGB(210, 230, 245)
    slValueLbl.TextSize = 9
    slValueLbl.Font = Enum.Font.GothamBold
    slValueLbl.TextXAlignment = Enum.TextXAlignment.Right
    slValueLbl.ZIndex = 61

    local SLIDER_MIN = 1
    local SLIDER_MAX = 500
    local SLIDER_PAD_X = 10
    local slTrackBg = Instance.new("Frame", sliderFrame)
    slTrackBg.Size = UDim2.new(1, -(SLIDER_PAD_X * 2), 0, 4)
    slTrackBg.Position = UDim2.new(0, SLIDER_PAD_X, 0, 32)
    slTrackBg.BackgroundColor3 = Color3.fromRGB(30, 45, 70)
    slTrackBg.BorderSizePixel = 0
    slTrackBg.ZIndex = 61
    Instance.new("UICorner", slTrackBg).CornerRadius = UDim.new(1, 0)

    local slTrackFill = Instance.new("Frame", slTrackBg)
    slTrackFill.Size = UDim2.new(0, 0, 1, 0)
    slTrackFill.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    slTrackFill.BorderSizePixel = 0
    slTrackFill.ZIndex = 62
    Instance.new("UICorner", slTrackFill).CornerRadius = UDim.new(1, 0)

    local slKnob = Instance.new("Frame", slTrackBg)
    slKnob.Size = UDim2.new(0, 16, 0, 16)
    slKnob.AnchorPoint = Vector2.new(0.5, 0.5)
    slKnob.Position = UDim2.new(0, 0, 0.5, 0)
    slKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    slKnob.BorderSizePixel = 0
    slKnob.ZIndex = 63
    Instance.new("UICorner", slKnob).CornerRadius = UDim.new(1, 0)
    local _knobStroke = Instance.new("UIStroke", slKnob)
    _knobStroke.Color = Color3.fromRGB(0, 180, 255)
    _knobStroke.Thickness = 2

    local slMinLbl = Instance.new("TextLabel", sliderFrame)
    slMinLbl.Size = UDim2.new(0, 20, 0, 12)
    slMinLbl.Position = UDim2.new(0, SLIDER_PAD_X, 0, 38)
    slMinLbl.BackgroundTransparency = 1
    slMinLbl.Text = "1"
    slMinLbl.TextColor3 = Color3.fromRGB(100, 130, 160)
    slMinLbl.TextSize = 8
    slMinLbl.Font = Enum.Font.Gotham
    slMinLbl.TextXAlignment = Enum.TextXAlignment.Left
    slMinLbl.ZIndex = 61

    local slMaxLbl = Instance.new("TextLabel", sliderFrame)
    slMaxLbl.Size = UDim2.new(0, 30, 0, 12)
    slMaxLbl.Position = UDim2.new(1, -(SLIDER_PAD_X + 30), 0, 38)
    slMaxLbl.BackgroundTransparency = 1
    slMaxLbl.Text = "500"
    slMaxLbl.TextColor3 = Color3.fromRGB(100, 130, 160)
    slMaxLbl.TextSize = 8
    slMaxLbl.Font = Enum.Font.Gotham
    slMaxLbl.TextXAlignment = Enum.TextXAlignment.Right
    slMaxLbl.ZIndex = 61

    local function updateSliderVisual(value)
        local ratio = (value - SLIDER_MIN) / (SLIDER_MAX - SLIDER_MIN)
        ratio = math.clamp(ratio, 0, 1)
        slTrackFill.Size = UDim2.new(ratio, 0, 1, 0)
        slKnob.Position = UDim2.new(ratio, 0, 0.5, 0)
        slValueLbl.Text = tostring(math.floor(value))
    end
    updateSliderVisual(flySpeed)

    local function getSliderValueFromInput(inputX)
        local trackAbsPos = slTrackBg.AbsolutePosition.X
        local trackAbsSize = slTrackBg.AbsoluteSize.X
        if trackAbsSize <= 0 then return flySpeed end
        local ratio = math.clamp((inputX - trackAbsPos) / trackAbsSize, 0, 1)
        return math.floor(SLIDER_MIN + ratio * (SLIDER_MAX - SLIDER_MIN))
    end

    local isDraggingSlider = false
    local slDragArea = Instance.new("TextButton", sliderFrame)
    slDragArea.Size = UDim2.new(1, -(SLIDER_PAD_X * 2), 0, 28)
    slDragArea.Position = UDim2.new(0, SLIDER_PAD_X, 0, 20)
    slDragArea.BackgroundTransparency = 1
    slDragArea.Text = ""
    slDragArea.ZIndex = 64

    slDragArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDraggingSlider = true
            local val = getSliderValueFromInput(input.Position.X)
            flySpeed = val
            updateSliderVisual(val)
        end
    end)

    slDragArea.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
            isDraggingSlider = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if isDraggingSlider and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local val = getSliderValueFromInput(input.Position.X)
            flySpeed = val
            updateSliderVisual(val)
        end
    end)
end)

local originalToggleFly = AdminFunctions.ToggleFly
function AdminFunctions:ToggleFly()
    originalToggleFly(self)
    if sliderFrame then sliderFrame.Visible = isFlying end
    dpadFrame.Visible = isFlying
    udFrame.Visible = isFlying
    if not isFlying then for k in pairs(flyInput) do flyInput[k] = false end end
end

-- ==================================================================
-- BUILD PAGES (UI)
-- ==================================================================
-- MAIN PAGE
do
    makeExpandableSection(mainPage, "Player Utility", 1, function(container)
        local speedInput = makeSpeedInputRow(container, 1)

        local speedMethod = "Hybrid"
        local function onMethodSelect(selected)
            speedMethod = selected
            showNotification("Speed Method → " .. (METHOD_DESC[selected] or selected))
            if isSpeedHack then
                local val = tonumber(speedInput.Text) or 22
                currentSpeedValue = val
                if speedMethod == "WalkSpeed" then applyWalkSpeed(val)
                elseif speedMethod == "Attribute" then applyAttribute(val)
                elseif speedMethod == "CFrame" then startCFramePush(val)
                elseif speedMethod == "BodyVel" then startBodyVelocity(val)
                elseif speedMethod == "Hybrid" then startHybrid(val) end
            end
        end

        createDropdownButton(container, "Speed Method", METHOD_LIST, speedMethod, onMethodSelect, 14)

        makeUtilityToggleRow(container, "Enable Run Speed", 2, function(isOn)
            if isOn then
                local val = tonumber(speedInput.Text) or 22
                currentSpeedValue = val
                isSpeedHack = true
                if speedMethod == "WalkSpeed" then applyWalkSpeed(val)
                elseif speedMethod == "Attribute" then applyAttribute(val)
                elseif speedMethod == "CFrame" then startCFramePush(val)
                elseif speedMethod == "BodyVel" then startBodyVelocity(val)
                elseif speedMethod == "Hybrid" then startHybrid(val) end
                Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
                    if not isSpeedHack then return end
                    newChar:WaitForChild("HumanoidRootPart", 5)
                    task.wait(0.5)
                    if speedMethod == "WalkSpeed" then applyWalkSpeed(currentSpeedValue)
                    elseif speedMethod == "Attribute" then applyAttribute(currentSpeedValue)
                    elseif speedMethod == "CFrame" then startCFramePush(currentSpeedValue)
                    elseif speedMethod == "BodyVel" then startBodyVelocity(currentSpeedValue)
                    elseif speedMethod == "Hybrid" then startHybrid(currentSpeedValue) end
                end)
            else
                isSpeedHack = false
                stopSpeedEngine()
                showNotification("Speed OFF — WalkSpeed reset ke normal")
            end
        end)

        makeUtilityToggleRow(container, "No Clip", 3, function(isOn) if isOn ~= isNoclip then toggleNoclip() end end)
        makeUtilityToggleRow(container, "Moonwalk", 4, function(isOn) if isOn ~= isMoonwalk then toggleMoonwalk() end end)
        makeUtilityToggleRow(container, "Unlimited Zoom", 5, function(isOn) if isOn ~= isUnlimitedZoom then toggleUnlimitedZoom() end end)

        local vaultRangeInput
        local vaultRangeRow = Instance.new("Frame", container)
        vaultRangeRow.Name = "VaultRangeRow"
        vaultRangeRow.Size = UDim2.new(1, 0, 0, 36)
        vaultRangeRow.BackgroundTransparency = 1
        vaultRangeRow.BorderSizePixel = 0
        vaultRangeRow.LayoutOrder = 6
        vaultRangeRow.ZIndex = 15

        local vrLbl = Instance.new("TextLabel", vaultRangeRow)
        vrLbl.Size = UDim2.new(0.52, 0, 1, 0)
        vrLbl.BackgroundTransparency = 1
        vrLbl.Text = "Vault/Destroy Range (studs)"
        vrLbl.TextColor3 = C.text
        vrLbl.TextSize = 11
        vrLbl.Font = Enum.Font.GothamBold
        vrLbl.TextXAlignment = Enum.TextXAlignment.Left
        vrLbl.ZIndex = 16

        vaultRangeInput = Instance.new("TextBox", vaultRangeRow)
        vaultRangeInput.Size = UDim2.new(0.44, 0, 0.72, 0)
        vaultRangeInput.Position = UDim2.new(0.56, 0, 0.14, 0)
        vaultRangeInput.BackgroundColor3 = C.inputBg
        vaultRangeInput.BorderSizePixel = 0
        vaultRangeInput.Text = tostring(VAULT_RANGE)
        vaultRangeInput.TextColor3 = C.accent
        vaultRangeInput.TextSize = 12
        vaultRangeInput.Font = Enum.Font.GothamBold
        vaultRangeInput.ClearTextOnFocus = false
        vaultRangeInput.TextXAlignment = Enum.TextXAlignment.Center
        vaultRangeInput.ZIndex = 16
        Instance.new("UICorner", vaultRangeInput).CornerRadius = UDim.new(0, 5)
        local _vrs = Instance.new("UIStroke", vaultRangeInput)
        _vrs.Color = Color3.fromRGB(0, 80, 130)
        _vrs.Thickness = 1

        vaultRangeInput.FocusLost:Connect(function()
            local val = tonumber(vaultRangeInput.Text)
            if val and val > 0 and val <= 30 then
                VAULT_RANGE = val
                DESTROY_RANGE = val
                showNotification("Range → " .. val .. " studs")
            else
                vaultRangeInput.Text = tostring(VAULT_RANGE)
                showNotification("Range valid: 1–30 studs")
            end
        end)

        local vaultDescLbl = Instance.new("TextLabel", container)
        vaultDescLbl.Size = UDim2.new(1, 0, 0, 28)
        vaultDescLbl.BackgroundTransparency = 1
        vaultDescLbl.Text = "Survivor: vault Window (Remote) | Killer: vault Window + destroy Pallet bekas"
        vaultDescLbl.TextColor3 = C.textDim
        vaultDescLbl.TextSize = 9
        vaultDescLbl.Font = Enum.Font.Gotham
        vaultDescLbl.TextWrapped = true
        vaultDescLbl.TextXAlignment = Enum.TextXAlignment.Left
        vaultDescLbl.LayoutOrder = 7
        vaultDescLbl.ZIndex = 16

        makeUtilityToggleRow(container, "Auto Vault / Destroy", 8, function(isOn)
            if isOn then
                local r = tonumber(vaultRangeInput.Text)
                if r then VAULT_RANGE = r DESTROY_RANGE = r end
                startAutoVault()
            else
                stopAutoVault()
            end
        end)
    end)

    -- Auto Kill
    makeExpandableSection(mainPage, "Auto Kill", 10, function(container)
        local infoLbl = Instance.new("TextLabel", container)
        infoLbl.Size = UDim2.new(1, 0, 0, 28)
        infoLbl.BackgroundTransparency = 1
        infoLbl.Text = "Teleport ke survivor terdekat yang masih hidup dan spam attack. Berhenti jika semua survivor knock."
        infoLbl.TextColor3 = C.textDim
        infoLbl.TextSize = 9
        infoLbl.Font = Enum.Font.Gotham
        infoLbl.TextWrapped = true
        infoLbl.TextXAlignment = Enum.TextXAlignment.Left
        infoLbl.LayoutOrder = 1
        makeUtilityToggleRow(container, "Enable Auto Kill", 2, function(isOn)
            if isOn then startAutoKill() else stopAutoKill() end
        end)
    end)

    -- Auto Parry
    makeExpandableSection(mainPage, "Auto Parry", 11, function(container)
        local rangeRow = Instance.new("Frame", container)
        rangeRow.Size = UDim2.new(1, 0, 0, 36)
        rangeRow.BackgroundTransparency = 1
        rangeRow.LayoutOrder = 1
        rangeRow.ZIndex = 15

        local rangeLbl = Instance.new("TextLabel", rangeRow)
        rangeLbl.Size = UDim2.new(0.52, 0, 1, 0)
        rangeLbl.BackgroundTransparency = 1
        rangeLbl.Text = "Parry Range (studs)"
        rangeLbl.TextColor3 = C.text
        rangeLbl.TextSize = 11
        rangeLbl.Font = Enum.Font.GothamBold
        rangeLbl.TextXAlignment = Enum.TextXAlignment.Left
        rangeLbl.ZIndex = 16

        local rangeInput = Instance.new("TextBox", rangeRow)
        rangeInput.Size = UDim2.new(0.44, 0, 0.72, 0)
        rangeInput.Position = UDim2.new(0.56, 0, 0.14, 0)
        rangeInput.BackgroundColor3 = C.inputBg
        rangeInput.BorderSizePixel = 0
        rangeInput.Text = tostring(parryRange)
        rangeInput.TextColor3 = C.accent
        rangeInput.TextSize = 12
        rangeInput.Font = Enum.Font.GothamBold
        rangeInput.ClearTextOnFocus = false
        rangeInput.TextXAlignment = Enum.TextXAlignment.Center
        rangeInput.ZIndex = 16
        Instance.new("UICorner", rangeInput).CornerRadius = UDim.new(0, 5)
        local _ris = Instance.new("UIStroke", rangeInput)
        _ris.Color = Color3.fromRGB(0, 80, 130)
        _ris.Thickness = 1

        rangeInput.FocusLost:Connect(function()
            local val = tonumber(rangeInput.Text)
            if val and val > 0 and val <= 30 then
                parryRange = val
                showNotification("Parry Range → " .. val)
            else
                rangeInput.Text = tostring(parryRange)
                showNotification("Range valid: 1–30")
            end
        end)

        local infoLbl = Instance.new("TextLabel", container)
        infoLbl.Size = UDim2.new(1, 0, 0, 28)
        infoLbl.BackgroundTransparency = 1
        infoLbl.Text = "Otomatis parry saat ada musuh dalam range (butuh Parrying Dagger)"
        infoLbl.TextColor3 = C.textDim
        infoLbl.TextSize = 9
        infoLbl.Font = Enum.Font.Gotham
        infoLbl.TextWrapped = true
        infoLbl.TextXAlignment = Enum.TextXAlignment.Left
        infoLbl.LayoutOrder = 2

        makeUtilityToggleRow(container, "Enable Auto Parry", 3, function(isOn)
            if isOn then
                local r = tonumber(rangeInput.Text)
                if r then parryRange = r end
                startAutoParry()
            else
                stopAutoParry()
            end
        end)
    end)

    makeExpandableSection(mainPage, "Auto Generator Rush", 12, function(container)
        local rangeRow = Instance.new("Frame", container)
        rangeRow.Size = UDim2.new(1, 0, 0, 36)
        rangeRow.BackgroundTransparency = 1
        rangeRow.LayoutOrder = 1
        local rangeLbl = Instance.new("TextLabel", rangeRow)
        rangeLbl.Size = UDim2.new(0.52, 0, 1, 0)
        rangeLbl.BackgroundTransparency = 1
        rangeLbl.Text = "Teleport Range to Generator"
        rangeLbl.TextColor3 = C.text
        rangeLbl.TextSize = 11
        rangeLbl.Font = Enum.Font.GothamBold
        rangeLbl.TextXAlignment = Enum.TextXAlignment.Left
        local rangeInput = Instance.new("TextBox", rangeRow)
        rangeInput.Size = UDim2.new(0.44, 0, 0.72, 0)
        rangeInput.Position = UDim2.new(0.56, 0, 0.14, 0)
        rangeInput.BackgroundColor3 = C.inputBg
        rangeInput.BorderSizePixel = 0
        rangeInput.Text = tostring(30)
        rangeInput.TextColor3 = C.accent
        rangeInput.TextSize = 12
        rangeInput.Font = Enum.Font.GothamBold
        rangeInput.ClearTextOnFocus = false
        rangeInput.TextXAlignment = Enum.TextXAlignment.Center
        Instance.new("UICorner", rangeInput).CornerRadius = UDim.new(0, 5)
        local _ris = Instance.new("UIStroke", rangeInput)
        _ris.Color = Color3.fromRGB(0, 80, 130)
        _ris.Thickness = 1

        local escapeRow = Instance.new("Frame", container)
        escapeRow.Size = UDim2.new(1, 0, 0, 36)
        escapeRow.BackgroundTransparency = 1
        escapeRow.LayoutOrder = 2
        local escapeLbl = Instance.new("TextLabel", escapeRow)
        escapeLbl.Size = UDim2.new(0.52, 0, 1, 0)
        escapeLbl.BackgroundTransparency = 1
        escapeLbl.Text = "Killer Escape Range"
        escapeLbl.TextColor3 = C.text
        escapeLbl.TextSize = 11
        escapeLbl.Font = Enum.Font.GothamBold
        escapeLbl.TextXAlignment = Enum.TextXAlignment.Left
        local escapeInput = Instance.new("TextBox", escapeRow)
        escapeInput.Size = UDim2.new(0.44, 0, 0.72, 0)
        escapeInput.Position = UDim2.new(0.56, 0, 0.14, 0)
        escapeInput.BackgroundColor3 = C.inputBg
        escapeInput.BorderSizePixel = 0
        escapeInput.Text = tostring(20)
        escapeInput.TextColor3 = C.accent
        escapeInput.TextSize = 12
        escapeInput.Font = Enum.Font.GothamBold
        escapeInput.ClearTextOnFocus = false
        escapeInput.TextXAlignment = Enum.TextXAlignment.Center
        Instance.new("UICorner", escapeInput).CornerRadius = UDim.new(0, 5)
        local _eis = Instance.new("UIStroke", escapeInput)
        _eis.Color = Color3.fromRGB(0, 80, 130)
        _eis.Thickness = 1

        local function updateRanges()
            local r = tonumber(rangeInput.Text) or 30
            local e = tonumber(escapeInput.Text) or 20
            _G.autoTpRange = r
            _G.killerEscapeRange = e
        end

        rangeInput.FocusLost:Connect(updateRanges)
        escapeInput.FocusLost:Connect(updateRanges)
        rangeInput:GetPropertyChangedSignal("Text"):Connect(function()
            if rangeInput:IsFocused() then updateRanges() end
        end)
        escapeInput:GetPropertyChangedSignal("Text"):Connect(function()
            if escapeInput:IsFocused() then updateRanges() end
        end)

        makeUtilityToggleRow(container, "Enable Auto Gen Rush", 3, function(isOn)
            if isOn then
                updateRanges()
                startAutoGenRush()
            else
                stopAutoGenRush()
            end
        end)
    end)

    -- Manual Teleport to Generator
    local genTpRow = Instance.new("Frame", mainPage)
    genTpRow.Size = UDim2.new(1, 0, 0, 36)
    genTpRow.BackgroundTransparency = 1
    genTpRow.LayoutOrder = 13
    local genTpLbl = Instance.new("TextLabel", genTpRow)
    genTpLbl.Size = UDim2.new(0.4, 0, 1, 0)
    genTpLbl.BackgroundTransparency = 1
    genTpLbl.Text = "Teleport to Gen (Max Studs)"
    genTpLbl.TextColor3 = C.text
    genTpLbl.TextSize = 11
    genTpLbl.Font = Enum.Font.GothamBold
    genTpLbl.TextXAlignment = Enum.TextXAlignment.Left
    local genTpInput = Instance.new("TextBox", genTpRow)
    genTpInput.Size = UDim2.new(0.25, 0, 0.7, 0)
    genTpInput.Position = UDim2.new(0.42, 0, 0.15, 0)
    genTpInput.BackgroundColor3 = C.inputBg
    genTpInput.BorderSizePixel = 0
    genTpInput.Text = "30"
    genTpInput.TextColor3 = C.accent
    genTpInput.TextSize = 12
    genTpInput.Font = Enum.Font.GothamBold
    genTpInput.ClearTextOnFocus = false
    genTpInput.TextXAlignment = Enum.TextXAlignment.Center
    Instance.new("UICorner", genTpInput).CornerRadius = UDim.new(0, 5)
    local genTpBtn = Instance.new("TextButton", genTpRow)
    genTpBtn.Size = UDim2.new(0.28, 0, 0.7, 0)
    genTpBtn.Position = UDim2.new(0.7, 0, 0.15, 0)
    genTpBtn.BackgroundColor3 = C.btnBlue
    genTpBtn.Text = "Teleport"
    genTpBtn.TextColor3 = C.text
    genTpBtn.TextSize = 10
    genTpBtn.Font = Enum.Font.GothamBold
    genTpBtn.BorderSizePixel = 0
    Instance.new("UICorner", genTpBtn).CornerRadius = UDim.new(0, 4)
    genTpBtn.MouseButton1Click:Connect(function()
        local maxDist = tonumber(genTpInput.Text) or 30
        teleportToNearestGen(maxDist)
    end)

    -- Toggle lainnya
    makeUtilityToggleRow(mainPage, "Fly  [F]", 2, function(isOn) if isOn ~= isFlying then AdminFunctions:ToggleFly() end end)
    makeUtilityToggleRow(mainPage, "Infinite Jump  [J]", 3, function(isOn) if isOn ~= isInfiniteJump then AdminFunctions:ToggleInfiniteJump() end end)
    makeUtilityToggleRow(mainPage, "Anti Lag  [L]", 4, function(isOn) if isOn ~= isAntiLag then toggleAntiLag() end end)
    makeUtilityToggleRow(mainPage, "Full Bright", 5, function(isOn) if isOn ~= isFullBright then toggleFullBright() end end)
    makeUtilityToggleRow(mainPage, "Anti AFK  [K]", 6, function(isOn) if isOn ~= isAntiAfk then toggleAntiAfk() end end)
    makeUtilityToggleRow(mainPage, "Walk on Water  [H]", 7, function(isOn) if isOn ~= isWalkOnWater then AdminFunctions:ToggleWalkOnWater() end end)
    makeUtilityToggleRow(mainPage, "Bring Part", 8, function(isOn) if isOn then AdminFunctions:BringPart() else showNotification("Bring Part off") end end)

    -- Crosshair
    makeExpandableSection(mainPage, "Crosshair", 9, function(container)
        makeUtilityToggleRow(container, "Enable Crosshair", 1, function(isOn)
            if isOn then showCrosshair() else hideCrosshair() end
        end)
        local _d = Instance.new("Frame", container)
        _d.Size = UDim2.new(1, 0, 0, 1)
        _d.BackgroundColor3 = C.divider
        _d.BorderSizePixel = 0
        _d.LayoutOrder = 2
        _d.ZIndex = 16

        local modelLabel = Instance.new("TextLabel", container)
        modelLabel.Size = UDim2.new(1, 0, 0, 20)
        modelLabel.BackgroundTransparency = 1
        modelLabel.Text = "Model"
        modelLabel.TextColor3 = C.textDim
        modelLabel.TextSize = 10
        modelLabel.Font = Enum.Font.Gotham
        modelLabel.TextXAlignment = Enum.TextXAlignment.Left
        modelLabel.LayoutOrder = 3
        modelLabel.ZIndex = 16

        local pickerRow = Instance.new("Frame", container)
        pickerRow.Size = UDim2.new(1, 0, 0, 50)
        pickerRow.BackgroundTransparency = 1
        pickerRow.LayoutOrder = 4
        pickerRow.ZIndex = 16
        local pickerLayout = Instance.new("UIListLayout", pickerRow)
        pickerLayout.FillDirection = Enum.FillDirection.Horizontal
        pickerLayout.Padding = UDim.new(0, 6)
        pickerLayout.VerticalAlignment = Enum.VerticalAlignment.Center

        local modelBtns = {}
        local function applyModelSelection(idx)
            local chosen = crosshairModels[idx]
            setCrosshairModel(chosen.id)
            for i, bd in ipairs(modelBtns) do
                if i == idx then
                    TweenService:Create(bd.frame, TweenInfo.new(0.12), {BackgroundColor3 = C.accent, BackgroundTransparency = 0}):Play()
                    bd.stroke.Thickness = 2.5
                    bd.stroke.Color = Color3.fromRGB(255, 255, 255)
                    bd.lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                else
                    TweenService:Create(bd.frame, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(20, 30, 50), BackgroundTransparency = 0}):Play()
                    bd.stroke.Thickness = 1.5
                    bd.stroke.Color = C.accentDim
                    bd.lbl.TextColor3 = C.textDim
                end
            end
        end
        for i, m in ipairs(crosshairModels) do
            local entry = Instance.new("Frame", pickerRow)
            entry.Size = UDim2.new(0, 0, 1, -4)
            entry.AutomaticSize = Enum.AutomaticSize.X
            entry.BackgroundTransparency = 1
            entry.ZIndex = 17
            local entryLayout = Instance.new("UIListLayout", entry)
            entryLayout.FillDirection = Enum.FillDirection.Vertical
            entryLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            entryLayout.Padding = UDim.new(0, 2)

            local circle = Instance.new("Frame", entry)
            circle.Size = UDim2.new(0, 36, 0, 36)
            circle.BackgroundColor3 = (i == 1) and C.accent or Color3.fromRGB(20, 30, 50)
            circle.BorderSizePixel = 0
            circle.ZIndex = 18
            Instance.new("UICorner", circle).CornerRadius = UDim.new(0, 8)
            local cStroke = Instance.new("UIStroke", circle)
            cStroke.Color = (i == 1) and Color3.fromRGB(255, 255, 255) or C.accentDim
            cStroke.Thickness = (i == 1) and 2.5 or 1.5
            local symLbl = Instance.new("TextLabel", circle)
            symLbl.Size = UDim2.new(1, 0, 1, 0)
            symLbl.BackgroundTransparency = 1
            symLbl.Text = m.sym
            symLbl.TextColor3 = (i == 1) and Color3.fromRGB(255, 255, 255) or C.textDim
            symLbl.TextSize = m.size - 6
            symLbl.Font = m.font
            symLbl.ZIndex = 19
            local subLbl = Instance.new("TextLabel", entry)
            subLbl.Size = UDim2.new(0, 42, 0, 12)
            subLbl.BackgroundTransparency = 1
            subLbl.Text = m.label
            subLbl.TextColor3 = C.textDim
            subLbl.TextSize = 8
            subLbl.Font = Enum.Font.Gotham
            subLbl.TextXAlignment = Enum.TextXAlignment.Center
            subLbl.ZIndex = 17
            local clickBtn = Instance.new("TextButton", circle)
            clickBtn.Size = UDim2.new(1, 0, 1, 0)
            clickBtn.BackgroundTransparency = 1
            clickBtn.Text = ""
            clickBtn.ZIndex = 20
            table.insert(modelBtns, {frame = circle, stroke = cStroke, lbl = symLbl})
            local capturedIdx = i
            clickBtn.MouseButton1Click:Connect(function() applyModelSelection(capturedIdx) end)
        end
    end)
end

-- TELEPORT PAGE
for i, cp in ipairs(checkpoints) do
    makeActionRow(teleportPage, cp.name, C.btnBlue, function()
        AdminFunctions:TeleportToCheckpoint(cp.name, cp.pos)
    end, i)
end

-- WORLD PAGE
makeActionRow(worldPage, "Bring Part", Color3.fromRGB(0, 60, 100), function() AdminFunctions:BringPart() end, 1)
makeActionRow(worldPage, "Remove All Parts", Color3.fromRGB(120, 20, 20), function() AdminFunctions:RemoveParts() end, 2)
makeActionRow(worldPage, "Check Position", C.rowAlt, function() AdminFunctions:CheckPosition() end, 3)
makeActionRow(worldPage, "Rejoin Server", C.btnRed, function() AdminFunctions:RejoinServer() end, 4)

-- ESP PAGE
do
    local infoRow = Instance.new("Frame", espPage)
    infoRow.Size = UDim2.new(1, 0, 0, 22)
    infoRow.BackgroundTransparency = 1
    infoRow.LayoutOrder = 0
    infoRow.ZIndex = 13
    local infoLbl = Instance.new("TextLabel", infoRow)
    infoLbl.Size = UDim2.new(1, 0, 1, 0)
    infoLbl.BackgroundTransparency = 1
    infoLbl.Text = "Highlight Killer & Survivor within " .. ESP_RANGE .. " studs"
    infoLbl.TextColor3 = C.textDim
    infoLbl.TextSize = 10
    infoLbl.Font = Enum.Font.Gotham
    infoLbl.TextXAlignment = Enum.TextXAlignment.Left
    infoLbl.ZIndex = 14

    makeExpandableSection(espPage, "ESP Killer", 1, function(container)
        local roleRow = Instance.new("Frame", container)
        roleRow.Size = UDim2.new(1, 0, 0, 20)
        roleRow.BackgroundTransparency = 1
        roleRow.LayoutOrder = 0
        roleRow.ZIndex = 15
        local roleLbl = Instance.new("TextLabel", roleRow)
        roleLbl.Size = UDim2.new(1, 0, 1, 0)
        roleLbl.BackgroundTransparency = 1
        roleLbl.Text = "▪ Deteksi via Team / Attribute 'Role' = Killer"
        roleLbl.TextColor3 = Color3.fromRGB(255, 100, 100)
        roleLbl.TextSize = 9
        roleLbl.Font = Enum.Font.Gotham
        roleLbl.TextXAlignment = Enum.TextXAlignment.Left
        roleLbl.ZIndex = 16

        makeUtilityToggleRow(container, "Enable ESP Killer", 1, function(isOn)
            if isOn then startESPKiller() else stopESPKiller() end
        end)

        local divRow = Instance.new("Frame", container)
        divRow.Size = UDim2.new(1, 0, 0, 18)
        divRow.BackgroundTransparency = 1
        divRow.LayoutOrder = 2
        divRow.ZIndex = 15
        local divLbl = Instance.new("TextLabel", divRow)
        divLbl.Size = UDim2.new(1, 0, 1, 0)
        divLbl.BackgroundTransparency = 1
        divLbl.Text = "Warna ESP Killer"
        divLbl.TextColor3 = C.textDim
        divLbl.TextSize = 9
        divLbl.Font = Enum.Font.Gotham
        divLbl.TextXAlignment = Enum.TextXAlignment.Left
        divLbl.ZIndex = 16

        makeColorPicker(container, ESP_KILLER_COLORS, 4, 3, function(color, name)
            espKillerColor = color
            updateESPTableColors(espKillerHighlights, color, color)
            showNotification("Killer Color → " .. name)
        end)
    end)

    makeExpandableSection(espPage, "ESP Survivor", 2, function(container)
        local roleRow = Instance.new("Frame", container)
        roleRow.Size = UDim2.new(1, 0, 0, 20)
        roleRow.BackgroundTransparency = 1
        roleRow.LayoutOrder = 0
        roleRow.ZIndex = 15
        local roleLbl = Instance.new("TextLabel", roleRow)
        roleLbl.Size = UDim2.new(1, 0, 1, 0)
        roleLbl.BackgroundTransparency = 1
        roleLbl.Text = "▪ Semua player yang bukan Killer = Survivor"
        roleLbl.TextColor3 = Color3.fromRGB(80, 200, 255)
        roleLbl.TextSize = 9
        roleLbl.Font = Enum.Font.Gotham
        roleLbl.TextXAlignment = Enum.TextXAlignment.Left
        roleLbl.ZIndex = 16

        makeUtilityToggleRow(container, "Enable ESP Survivor", 1, function(isOn)
            if isOn then startESPSurvivor() else stopESPSurvivor() end
        end)

        local divRow = Instance.new("Frame", container)
        divRow.Size = UDim2.new(1, 0, 0, 18)
        divRow.BackgroundTransparency = 1
        divRow.LayoutOrder = 2
        divRow.ZIndex = 15
        local divLbl = Instance.new("TextLabel", divRow)
        divLbl.Size = UDim2.new(1, 0, 1, 0)
        divLbl.BackgroundTransparency = 1
        divLbl.Text = "Warna ESP Survivor"
        divLbl.TextColor3 = C.textDim
        divLbl.TextSize = 9
        divLbl.Font = Enum.Font.Gotham
        divLbl.TextXAlignment = Enum.TextXAlignment.Left
        divLbl.ZIndex = 16

        makeColorPicker(container, ESP_SURVIVOR_COLORS, 1, 3, function(color, name)
            espSurvivorColor = color
            updateESPTableColors(espSurvivorHighlights, color, color)
            showNotification("Survivor Color → " .. name)
        end)
    end)

    local spacer = Instance.new("Frame", espPage)
    spacer.Size = UDim2.new(1, 0, 0, 6)
    spacer.BackgroundTransparency = 1
    spacer.LayoutOrder = 3
    spacer.ZIndex = 12

    makeExpandableSection(espPage, "ESP Object  (Violence District)", 4, function(container)
        local objInfo = Instance.new("Frame", container)
        objInfo.Size = UDim2.new(1, 0, 0, 20)
        objInfo.BackgroundTransparency = 1
        objInfo.LayoutOrder = 0
        objInfo.ZIndex = 15
        local objInfoLbl = Instance.new("TextLabel", objInfo)
        objInfoLbl.Size = UDim2.new(1, 0, 1, 0)
        objInfoLbl.BackgroundTransparency = 1
        objInfoLbl.Text = "Generator • Gate • Hook • Pallet  |  Range: 700 studs"
        objInfoLbl.TextColor3 = C.textDim
        objInfoLbl.TextSize = 9
        objInfoLbl.Font = Enum.Font.Gotham
        objInfoLbl.TextXAlignment = Enum.TextXAlignment.Left
        objInfoLbl.ZIndex = 16

        local typeToggleSetters = {}
        for ti, typeData in ipairs(ESP_OBJECT_TYPES) do
            local tRow = Instance.new("Frame", container)
            tRow.Size = UDim2.new(1, 0, 0, 36)
            tRow.BackgroundTransparency = 1
            tRow.BorderSizePixel = 0
            tRow.LayoutOrder = ti
            tRow.ZIndex = 15

            local dot = Instance.new("Frame", tRow)
            dot.Size = UDim2.new(0, 10, 0, 10)
            dot.Position = UDim2.new(0, 0, 0.5, -5)
            dot.BackgroundColor3 = typeData.color
            dot.BorderSizePixel = 0
            dot.ZIndex = 16
            Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

            local tLbl = Instance.new("TextLabel", tRow)
            tLbl.Size = UDim2.new(1, -70, 1, 0)
            tLbl.Position = UDim2.new(0, 18, 0, 0)
            tLbl.BackgroundTransparency = 1
            tLbl.Text = typeData.label
            tLbl.TextColor3 = C.text
            tLbl.TextSize = 11
            tLbl.Font = Enum.Font.GothamBold
            tLbl.TextXAlignment = Enum.TextXAlignment.Left
            tLbl.ZIndex = 16

            local tTrack = Instance.new("Frame", tRow)
            tTrack.Size = UDim2.new(0, 44, 0, 24)
            tTrack.Position = UDim2.new(1, -44, 0.5, -12)
            tTrack.BackgroundColor3 = typeData.enabled and C.toggleOn or C.toggleOff
            tTrack.BorderSizePixel = 0
            tTrack.ZIndex = 16
            Instance.new("UICorner", tTrack).CornerRadius = UDim.new(1, 0)

            local tKnob = Instance.new("Frame", tTrack)
            tKnob.Size = UDim2.new(0, 18, 0, 18)
            tKnob.Position = typeData.enabled and UDim2.new(0, 23, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
            tKnob.BackgroundColor3 = typeData.enabled and Color3.fromRGB(220, 240, 255) or Color3.fromRGB(180, 200, 220)
            tKnob.BorderSizePixel = 0
            tKnob.ZIndex = 17
            Instance.new("UICorner", tKnob).CornerRadius = UDim.new(1, 0)

            local tClickArea = Instance.new("TextButton", tTrack)
            tClickArea.Size = UDim2.new(1, 0, 1, 0)
            tClickArea.BackgroundTransparency = 1
            tClickArea.Text = ""
            tClickArea.ZIndex = 18

            local capturedTypeData = typeData
            local function setTypeToggle(state)
                capturedTypeData.enabled = state
                if state then
                    TweenService:Create(tTrack, TweenInfo.new(0.15), {BackgroundColor3 = C.toggleOn}):Play()
                    TweenService:Create(tKnob, TweenInfo.new(0.15), {Position = UDim2.new(0, 23, 0.5, -9)}):Play()
                    tKnob.BackgroundColor3 = Color3.fromRGB(220, 240, 255)
                else
                    TweenService:Create(tTrack, TweenInfo.new(0.15), {BackgroundColor3 = C.toggleOff}):Play()
                    TweenService:Create(tKnob, TweenInfo.new(0.15), {Position = UDim2.new(0, 3, 0.5, -9)}):Play()
                    tKnob.BackgroundColor3 = Color3.fromRGB(180, 200, 220)
                end
                if espObjectEnabled then
                    if not state then
                        for inst, data in pairs(espObjectHighlights) do
                            if data.typeKey == capturedTypeData.key then removeESPObject(inst) end
                        end
                    else
                        scanAndApplyESPObjects()
                    end
                end
            end
            typeToggleSetters[ti] = setTypeToggle
            tClickArea.MouseButton1Click:Connect(function() setTypeToggle(not capturedTypeData.enabled) end)
        end

        local masterDiv = Instance.new("Frame", container)
        masterDiv.Size = UDim2.new(1, 0, 0, 1)
        masterDiv.BackgroundColor3 = C.divider
        masterDiv.BorderSizePixel = 0
        masterDiv.LayoutOrder = #ESP_OBJECT_TYPES + 1
        masterDiv.ZIndex = 15

        makeUtilityToggleRow(container, "Enable All ESP Object", #ESP_OBJECT_TYPES + 2, function(isOn)
            if isOn then startESPObjects() else stopESPObjects() end
        end)
    end)
end

-- PLAYERS PAGE
playersPage.AutomaticSize = Enum.AutomaticSize.None
playersPage.Size = UDim2.new(1, 0, 0, 220)

local playersScroll = Instance.new("ScrollingFrame", playersPage)
playersScroll.Size = UDim2.new(1, 0, 1, 0)
playersScroll.BackgroundTransparency = 1
playersScroll.ScrollingDirection = Enum.ScrollingDirection.Y
playersScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
playersScroll.ScrollBarThickness = 3
playersScroll.ScrollBarImageColor3 = C.accent
playersScroll.BorderSizePixel = 0
playersScroll.ZIndex = 12
playersScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
local playersLayout = Instance.new("UIListLayout", playersScroll)
playersLayout.SortOrder = Enum.SortOrder.LayoutOrder
playersLayout.Padding = UDim.new(0, 4)
local playersPad = Instance.new("UIPadding", playersScroll)
playersPad.PaddingTop = UDim.new(0, 4)
playersPad.PaddingBottom = UDim.new(0, 6)
playersPad.PaddingLeft = UDim.new(0, 4)
playersPad.PaddingRight = UDim.new(0, 6)

local function refreshPlayerList()
    for _, child in ipairs(playersScroll:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    local allPlayers = Players:GetPlayers()
    local order = 1
    local hasOthers = false

    for _, player in ipairs(allPlayers) do
        if player ~= Players.LocalPlayer then
            hasOthers = true
            local playerRow = Instance.new("Frame", playersScroll)
            playerRow.Size = UDim2.new(1, 0, 0, 74)
            playerRow.BackgroundColor3 = C.rowAlt
            playerRow.BorderSizePixel = 0
            playerRow.LayoutOrder = order
            playerRow.ZIndex = 13
            Instance.new("UICorner", playerRow).CornerRadius = UDim.new(0, 6)
            local pStroke = Instance.new("UIStroke", playerRow)
            pStroke.Color = C.divider
            pStroke.Thickness = 1

            local avatarCircle = Instance.new("Frame", playerRow)
            avatarCircle.Size = UDim2.new(0, 32, 0, 32)
            avatarCircle.Position = UDim2.new(0, 8, 0, 8)
            avatarCircle.BackgroundColor3 = Color3.fromRGB(0, 60, 100)
            avatarCircle.BorderSizePixel = 0
            avatarCircle.ZIndex = 14
            Instance.new("UICorner", avatarCircle).CornerRadius = UDim.new(1, 0)
            local avatarLbl = Instance.new("TextLabel", avatarCircle)
            avatarLbl.Size = UDim2.new(1, 0, 1, 0)
            avatarLbl.BackgroundTransparency = 1
            avatarLbl.Text = string.upper(string.sub(player.Name, 1, 1))
            avatarLbl.TextColor3 = C.accent
            avatarLbl.TextSize = 14
            avatarLbl.Font = Enum.Font.GothamBold
            avatarLbl.ZIndex = 15

            local nameLbl = Instance.new("TextLabel", playerRow)
            nameLbl.Size = UDim2.new(1, -60, 0, 20)
            nameLbl.Position = UDim2.new(0, 48, 0, 8)
            nameLbl.BackgroundTransparency = 1
            nameLbl.Text = player.Name
            nameLbl.TextColor3 = C.text
            nameLbl.TextSize = 12
            nameLbl.Font = Enum.Font.GothamBold
            nameLbl.TextXAlignment = Enum.TextXAlignment.Left
            nameLbl.ZIndex = 14

            local displayLbl = Instance.new("TextLabel", playerRow)
            displayLbl.Size = UDim2.new(1, -60, 0, 14)
            displayLbl.Position = UDim2.new(0, 48, 0, 28)
            displayLbl.BackgroundTransparency = 1
            displayLbl.Text = "@" .. (player.DisplayName ~= player.Name and player.DisplayName or player.Name)
            displayLbl.TextColor3 = C.textDim
            displayLbl.TextSize = 9
            displayLbl.Font = Enum.Font.Gotham
            displayLbl.TextXAlignment = Enum.TextXAlignment.Left
            displayLbl.ZIndex = 14

            local btnFrame = Instance.new("Frame", playerRow)
            btnFrame.Size = UDim2.new(1, -12, 0, 26)
            btnFrame.Position = UDim2.new(0, 6, 0, 44)
            btnFrame.BackgroundTransparency = 1
            btnFrame.ZIndex = 14
            local btnLayout = Instance.new("UIListLayout", btnFrame)
            btnLayout.FillDirection = Enum.FillDirection.Horizontal
            btnLayout.Padding = UDim.new(0, 4)

            local bTeleport = Instance.new("TextButton", btnFrame)
            bTeleport.Size = UDim2.new(0.5, -4, 1, 0)
            bTeleport.BackgroundColor3 = Color3.fromRGB(0, 100, 180)
            bTeleport.Text = "TELEPORT"
            bTeleport.TextColor3 = Color3.fromRGB(230, 240, 255)
            bTeleport.TextSize = 9
            bTeleport.Font = Enum.Font.GothamBold
            bTeleport.BorderSizePixel = 0
            bTeleport.ZIndex = 15
            Instance.new("UICorner", bTeleport).CornerRadius = UDim.new(0, 4)
            bTeleport.MouseButton1Click:Connect(function() AdminFunctions:TeleportToPlayer(player) end)

            local autoTpFrame = Instance.new("Frame", btnFrame)
            autoTpFrame.Size = UDim2.new(0.5, -4, 1, 0)
            autoTpFrame.BackgroundTransparency = 1
            autoTpFrame.ZIndex = 14

            local autoTpLabel = Instance.new("TextLabel", autoTpFrame)
            autoTpLabel.Size = UDim2.new(0.55, 0, 1, 0)
            autoTpLabel.Position = UDim2.new(0, 0, 0, 0)
            autoTpLabel.BackgroundTransparency = 1
            autoTpLabel.Text = "AUTO TP"
            autoTpLabel.TextColor3 = C.text
            autoTpLabel.TextSize = 9
            autoTpLabel.Font = Enum.Font.GothamBold
            autoTpLabel.TextXAlignment = Enum.TextXAlignment.Left
            autoTpLabel.ZIndex = 15

            local track = Instance.new("Frame", autoTpFrame)
            track.Size = UDim2.new(0, 40, 0, 22)
            track.Position = UDim2.new(1, -40, 0.5, -11)
            track.BackgroundColor3 = (autoTpActive and autoTpTarget == player) and C.toggleOn or C.toggleOff
            track.BorderSizePixel = 0
            track.ZIndex = 15
            Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

            local knob = Instance.new("Frame", track)
            knob.Size = UDim2.new(0, 16, 0, 16)
            knob.Position = (autoTpActive and autoTpTarget == player) and UDim2.new(0, 21, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
            knob.BackgroundColor3 = (autoTpActive and autoTpTarget == player) and Color3.fromRGB(220, 240, 255) or Color3.fromRGB(180, 200, 220)
            knob.BorderSizePixel = 0
            knob.ZIndex = 16
            Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

            local clickArea = Instance.new("TextButton", track)
            clickArea.Size = UDim2.new(1, 0, 1, 0)
            clickArea.BackgroundTransparency = 1
            clickArea.Text = ""
            clickArea.ZIndex = 17

            clickArea.MouseButton1Click:Connect(function()
                if autoTpActive and autoTpTarget == player then
                    stopAutoTeleport()
                else
                    startAutoTeleport(player)
                end
                local newState = (autoTpActive and autoTpTarget == player)
                if newState then
                    track.BackgroundColor3 = C.toggleOn
                    knob:TweenPosition(UDim2.new(0, 21, 0.5, -8), "In", "Quad", 0.15)
                    knob.BackgroundColor3 = Color3.fromRGB(220, 240, 255)
                else
                    track.BackgroundColor3 = C.toggleOff
                    knob:TweenPosition(UDim2.new(0, 3, 0.5, -8), "In", "Quad", 0.15)
                    knob.BackgroundColor3 = Color3.fromRGB(180, 200, 220)
                end
            end)
            order = order + 1
        end
    end

    if not hasOthers then
        local emptyRow = Instance.new("Frame", playersScroll)
        emptyRow.Size = UDim2.new(1, 0, 0, 60)
        emptyRow.BackgroundColor3 = C.rowAlt
        emptyRow.BorderSizePixel = 0
        emptyRow.LayoutOrder = 1
        emptyRow.ZIndex = 13
        Instance.new("UICorner", emptyRow).CornerRadius = UDim.new(0, 6)
        local emptyLbl = Instance.new("TextLabel", emptyRow)
        emptyLbl.Size = UDim2.new(1, 0, 1, 0)
        emptyLbl.BackgroundTransparency = 1
        emptyLbl.Text = "No other players in server"
        emptyLbl.TextColor3 = C.textDim
        emptyLbl.TextSize = 11
        emptyLbl.Font = Enum.Font.Gotham
        emptyLbl.ZIndex = 14
    end
end

-- SIDEBAR TABS
local tabs = {
    {name = "Main", icon = "⚡", page = mainPage, order = 1},
    {name = "Players", icon = "👥", page = playersPage, order = 2},
    {name = "Teleport", icon = "📍", page = teleportPage, order = 3},
    {name = "World", icon = "🌍", page = worldPage, order = 4},
    {name = "ESP", icon = "👁", page = espPage, order = 5},
}

local function switchTab(index)
    for i, tabData in ipairs(tabs) do
        tabData.page.Visible = (i == index)
        if tabSetters[i] then tabSetters[i](i == index) end
    end
    contentHeader.Text = tabs[index].name
    if index == 2 then refreshPlayerList() end
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
end

for i, tabData in ipairs(tabs) do
    local btn, setter = makeSideTab(tabData.name, tabData.icon, tabData.order)
    tabSetters[i] = setter
    local idx = i
    btn.MouseButton1Click:Connect(function() switchTab(idx) end)
end

switchTab(1)
mainPage.Visible = true

-- MINIMIZE / RESTORE
local isMinimized = false
local function toggleMinimize()
    isMinimized = not isMinimized
    mainFrame.Visible = not isMinimized
    iconBtn.Visible = isMinimized
end
minimizeBtn.MouseButton1Click:Connect(toggleMinimize)
iconBtn.MouseButton1Click:Connect(function()
    if not iconBtn:GetAttribute("wasDragged") then toggleMinimize() end
    iconBtn:SetAttribute("wasDragged", false)
end)

-- DRAG SYSTEM
do
    local draggingMain, dragStartMain, frameStartMain = false
    topBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local relX = input.Position.X - topBar.AbsolutePosition.X
                if relX > topBar.AbsoluteSize.X - 50 then return end
            end
            draggingMain = true
            dragStartMain = UserInputService:GetMouseLocation()
            frameStartMain = Vector2.new(mainFrame.Position.X.Offset, mainFrame.Position.Y.Offset)
        end
    end)
    topBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingMain = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if draggingMain and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local mp = UserInputService:GetMouseLocation()
            local delta = mp - dragStartMain
            local vs = workspace.CurrentCamera.ViewportSize
            local newX = math.clamp(frameStartMain.X + delta.X, 0, vs.X - mainFrame.AbsoluteSize.X)
            local newY = math.clamp(frameStartMain.Y + delta.Y, 0, vs.Y - mainFrame.AbsoluteSize.Y)
            mainFrame.Position = UDim2.new(0, newX, 0, newY)
        end
    end)
end

do
    local draggingIcon, dragStartIcon, iconStartPos = false
    local totalMovedIcon = 0
    iconBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingIcon = true
            totalMovedIcon = 0
            dragStartIcon = UserInputService:GetMouseLocation()
            iconStartPos = Vector2.new(iconBtn.Position.X.Offset, iconBtn.Position.Y.Offset)
        end
    end)
    iconBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            draggingIcon = false
            iconBtn:SetAttribute("wasDragged", totalMovedIcon > 5)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if draggingIcon and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local mp = UserInputService:GetMouseLocation()
            local delta = mp - dragStartIcon
            totalMovedIcon = totalMovedIcon + delta.Magnitude
            local vs = workspace.CurrentCamera.ViewportSize
            local newX = math.clamp(iconStartPos.X + delta.X, 0, vs.X - iconBtn.AbsoluteSize.X)
            local newY = math.clamp(iconStartPos.Y + delta.Y, 0, vs.Y - iconBtn.AbsoluteSize.Y)
            iconBtn.Position = UDim2.new(0, newX, 0, newY)
        end
    end)
end

-- KEYBOARD SHORTCUTS
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then AdminFunctions:ToggleFly()
    elseif input.KeyCode == Enum.KeyCode.J then AdminFunctions:ToggleInfiniteJump()
    elseif input.KeyCode == Enum.KeyCode.L then toggleAntiLag()
    elseif input.KeyCode == Enum.KeyCode.K then toggleAntiAfk()
    elseif input.KeyCode == Enum.KeyCode.H then AdminFunctions:ToggleWalkOnWater() end
end)

-- PLAYER EVENTS
Players.PlayerAdded:Connect(function(player)
    if playersPage.Visible then task.wait(0.5) refreshPlayerList() end
    if espKillerEnabled or espSurvivorEnabled then task.wait(1) end
end)
Players.PlayerRemoving:Connect(function(player)
    if playersPage.Visible then refreshPlayerList() end
    if autoTpActive and autoTpTarget == player then stopAutoTeleport() end
    removeESPEntry(espKillerHighlights, player)
    removeESPEntry(espSurvivorHighlights, player)
end)

-- INIT
print("[FINISH] YUJI v4.3 Siap Digunakan")
showNotification("YUJI v4.3 (Auto Kill, Auto Vault, Auto Parry)", 4)

return AdminFunctions
