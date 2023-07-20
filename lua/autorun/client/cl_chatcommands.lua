-- chatcommands.lua

hook.Add( "OnPlayerChat", "DiscordCommand", function( ply, strText, bTeam, bDead )
    if ( ply != LocalPlayer() ) then return end

    strText = string.lower( strText )

    if ( strText == "!discord" or strText == "!dc" or strText == "/dc" or strText == "/discord"  ) then
        ply:ChatPrint( "Trete hier unserem Discord bei: https://discord.gg/zASeKNj97c" )
        return true
    end
end )

-- test zwecke only
hook.Add( "PlayerSay", "RagdollCommand", function( ply, text, public )
    if ( string.lower( text ) == "/ragdoll" ) then
        if IsValid(ply) and ply:Alive() then
            local ragdoll = ents.Create("prop_ragdoll")
            ragdoll:SetModel(ply:GetModel())
            ragdoll:SetPos(ply:GetPos())
            ragdoll:SetAngles(ply:GetAngles())
            ragdoll:Spawn()

            local ragdollPhysics = ragdoll:GetPhysicsObject()
            if IsValid(ragdollPhysics) then
                ragdollPhysics:SetVelocity(ply:GetVelocity())
            end

            ply:Spectate(OBS_MODE_CHASE)
            ply:SpectateEntity(ragdoll)
            ply:StripWeapons()
            ply:SetMoveType(MOVETYPE_OBSERVER)

            timer.Simple(10, function()
                if IsValid(ply) and ply:Alive() then
                    ply:UnSpectate()
                    ply:Spawn()
                    ply:SetPos(ragdoll:GetPos())
                    ragdoll:Remove()
                end
            end)
        end

        return ""
    end
end )

hook.Add( "OnPlayerChat", "ForumCommand", function( ply, strText, bTeam, bDead )
    if ( ply != LocalPlayer() ) then return end

    strText = string.lower( strText )

    if ( strText == "!forum" or strText == "/forum" ) then
        ply:ChatPrint( "Hier unser Forum Link: https://star-evolved-v2.noclip.me/" )
        return true
    end
end )

hook.Add( "OnPlayerChat", "DonationCommand", function( ply, strText, bTeam, bDead )
    if ( ply != LocalPlayer() ) then return end

    strText = string.lower( strText )

    if ( strText == "!donate" or strText == "!donation" or strText == "/donate" or strText == "/donation" ) then
        ply:ChatPrint( "Hier kannst du donaten: https://ascensionroleplay.tip4serv.com/" )
        return true
    end
end )

hook.Add( "OnPlayerChat", "ChillBillCommand", function( ply, strText, bTeam, bDead )
    if ( ply != LocalPlayer() ) then return end

    strText = string.lower( strText )

    if ( strText == "!chillbill" or strText == "/chillbill" and util.IsValidSound("steifus geil/chillbill.mp3") ) then
        ply:EmitSound( "steifus geil/chillbill.mp3" )
        return true
    else
        ply:ChatPrint( "Dieser Command Existiert nicht?!" )
        timer.Simple( 1, function()
            ply:ChatPrint( "Nein... Der Sound ist einfach nur nicht da. RIP Chill Bill!" )
        end )
    end
end )

hook.Add( "OnPlayerChat", "SocialsCommand", function( ply, strText, bTeam, bDead )
    if ( ply != LocalPlayer() ) then return end

    strText = string.lower( strText )

    if ( strText == "!socials" or strText == "!social" or strText == "/socials" or strText == "/social"  ) then
        local frame = vgui.Create( "DFrame" )
        frame:SetSize( 500, 500 )
        frame:Center()
        frame:SetTitle( " " )
        frame:SetVisible( true )
        frame:SetDraggable( false )
        frame:ShowCloseButton( false )
        frame:MakePopup()
        frame.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
        end

        local closeBtn = vgui.Create( "DButton", frame )
        closeBtn:SetText( " " )
        closeBtn:SetPos( 460, 10 )
        closeBtn:SetSize( 30, 30 )
        closeBtn.DoClick = function()
            frame:Close()
        end
        closeBtn.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 255, 70) )
            draw.SimpleText( "X", "DermaDefault", closeBtn:GetWide() / 2, closeBtn:GetTall() / 2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local donateBtn = vgui.Create( "DButton", frame )
        donateBtn:SetText( " " )
        donateBtn:SetPos( 50, 50 )
        donateBtn:SetSize( 100, 50 )
        donateBtn.DoClick = function()
            gui.OpenURL( "https://ascensionroleplay.tip4serv.com/" )
        end
        donateBtn.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 255, 70) )
            draw.SimpleText( "Donate", "DermaDefault", donateBtn:GetWide() / 2, donateBtn:GetTall() / 2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local discordBtn = vgui.Create( "DButton", frame )
        discordBtn:SetText( " " )
        discordBtn:SetPos( 100, 150 )
        discordBtn:SetSize( 100, 50 )
        discordBtn.DoClick = function()
            gui.OpenURL( "https://discord.gg/zASeKNj97c" )
        end
        discordBtn.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 255, 70) )
            draw.SimpleText( "Discord", "DermaDefault", discordBtn:GetWide() / 2, discordBtn:GetTall() / 2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local forumBtn = vgui.Create( "DButton", frame )
        forumBtn:SetText( " " )
        forumBtn:SetPos( 150, 250 )
        forumBtn:SetSize( 100, 50 )
        forumBtn.DoClick = function()
            gui.OpenURL( "https://star-evolved-v2.noclip.me/" )
        end
        forumBtn.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 255, 70) )
            draw.SimpleText( "Forum", "DermaDefault", forumBtn:GetWide() / 2, forumBtn:GetTall() / 2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        local kolliBtn = vgui.Create( "DButton", frame )
        kolliBtn:SetText( " " )
        kolliBtn:SetPos( 200, 350 )
        kolliBtn:SetSize( 100, 50 )
        kolliBtn.DoClick = function()
            gui.OpenURL( "https://steamcommunity.com/sharedfiles/filedetails/?id=2905822882" )
        end
        kolliBtn.Paint = function( self, w, h )
            draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 255, 70) )
            draw.SimpleText( "Kollektion", "DermaDefault", kolliBtn:GetWide() / 2, kolliBtn:GetTall() / 2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
        end

        return true
    end
end )