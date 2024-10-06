SNt:AddToggle("Auto Sail Rough Sea", _G.BiirTrax, function(state)
    if state then
        _G.BiirTrax = true
    else
        _G.BiirTrax = false
    end

    if _G.BiirTrax then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16921.853515625, 9.0863618850708, 433.9601135253906) 
        wait(0.5) 

        local args = {
            [1] = "BuyBoat",
            [2] = "PirateBrigade"
        }

        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

        function two(gotoCFrame) --- Tween
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            end)
            if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude <= 200 then
                pcall(function() 
                    tweenz:Cancel()
                end)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = gotoCFrame
            else
                local tween_s = game:service("TweenService")
                local info = TweenInfo.new((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - gotoCFrame.Position).Magnitude / 325, Enum.EasingStyle.Linear)
                tween, err = pcall(function()
                    tweenz = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = gotoCFrame})
                    tweenz:Play()
                end)
                if not tween then return err end
            end
            function _TweenCanCle()
                tweenz:Cancel()
            end
        end
        two(CFrame.new(-30939.830078125, 3.729933261871338, 9256.4208984375))

        for _, v in next, workspace.Boats.PirateBrigade:GetDescendants() do
            if v.Name:find("VehicleSeat") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
    end
end)

-- Logika ketinggian boat (terbang melayang)
spawn(function()
    while wait() do
        pcall(function()
            if _G.BiirTrax then
                wait(0.8) 
                local targetModelNames = "PirateBrigade"
                local models = workspace.Boats:GetChildren()

                for _, targetModelName in ipairs(targetModelNames) do
                    local targetModel = workspace:FindFirstChild(targetModelName)

                    if targetModel then
                        local speed = 10.5
                        local hoverHeight = 50 -- Atur ketinggian terbang di sini
                        
                        local forwardDirection = targetModel.PrimaryPart.CFrame.lookVector
                        local targetPosition = targetModel.PrimaryPart.Position + forwardDirection * 10 + Vector3.new(0, hoverHeight, 0) -- Tambah ketinggian pada sumbu Y
                        
                        while (targetModel.PrimaryPart.Position - targetPosition).Magnitude > 0.1 do
                            -- Tambahkan logika ketinggian (hoverHeight) dan kecepatan (speed)
                            targetModel:SetPrimaryPartCFrame(CFrame.new(targetModel.PrimaryPart.Position + forwardDirection * speed + Vector3.new(0, hoverHeight, 0)))
                            task.wait()
                            if not _G.BiirTrax then
                                break
                            end
                        end
                    end
                end
            end
        end)
    end
end)
