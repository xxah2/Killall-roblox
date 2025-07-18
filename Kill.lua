-- Asegúrate de ejecutarlo dentro del juego Prison Life

-- Crear botón flotante
local ScreenGui = Instance.new("ScreenGui")
local KillButton = Instance.new("TextButton")

ScreenGui.Name = "AdminKillGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

KillButton.Name = "KillAllBtn"
KillButton.Parent = ScreenGui
KillButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
KillButton.Position = UDim2.new(0.85, 0, 0.4, 0)
KillButton.Size = UDim2.new(0, 100, 0, 40)
KillButton.Font = Enum.Font.SourceSansBold
KillButton.Text = "KILL ALL"
KillButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KillButton.TextSize = 18

-- Acción al hacer clic
KillButton.MouseButton1Click:Connect(function()
    local LocalPlayer = game.Players.LocalPlayer

    local killed = 0

    for _, target in pairs(game.Players:GetPlayers()) do
        if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("Humanoid") then
            local humanoid = target.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                humanoid.Health = 0
                killed = killed + 1
            end
        end
    end

    -- Mostrar mensaje de confirmación
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "[KILL ALL] Ejecutado con éxito. Jugadores eliminados: " .. killed;
        Color = Color3.fromRGB(255, 80, 80);
        Font = Enum.Font.SourceSansBold;
        FontSize = Enum.FontSize.Size24;
    })
end)
