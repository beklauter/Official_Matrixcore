-- autorun.lua

if (CLIENT) then return end

util.AddNetworkString("Core:Notify");

AddCSLuaFile("steifus/cl_steifus_autorun.lua"); -- Client
AddCSLuaFile("steifus/sh_steifus_autorun.lua"); -- Shared
include("steifus/sh_steifus_autorun.lua"); -- Shared