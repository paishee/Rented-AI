-- workspace setup
--[[

workspace [
    Noisai: module { ... }

    Character: folder [
        ns_level: number
        ns_path: folder [
            First: part { 
                ns_index: number
                ns_footsteps: sound
                ns_jumpscare: sound
                Sprite: decal/texture
            }

            Second: part { 
                ns_index: number
                ns_footsteps: sound
                ns_jumpscare: sound
                Sprite: decal/texture
            }

            Last: part { 
                ns_index: number
                ns_footsteps: sound
                ns_jumpscare: sound
                Sprite: decal/texture
            }
        ]
    ]
]

]]


-- code example
--[[

local Noisai = require('workspace.Noisai');
local char = workspace.Character

Noisai.new(char);

]]


local Signal = require(script.Parent.Parent.Signal);
local PathElement = require(script.Parent.Parent.PathElement)


return (function(Noisai)

	function Noisai.new(Character)
		
		local self = setmetatable( {

			Character = Character,
			At = 1,

			--[[ data ]]
			Level = Character.ns_level.Value,
			Path = {},
			
			
			--[[ sound effects ]]
			Footsteps = Character.ns_footsteps,
			Jumpscare = Character.ns_jumpscare,

			--[[ signals ]]
			Moving = Signal.new(),
			Stuck = Signal.new(),
			Active = Signal.new()

		}, Noisai )
		
		
		local Path = Character.ns_path
		
		
		for _, p in pairs(Path:GetChildren()) do
			self.Path[p.ns_index.Value] = PathElement.new(p)
		end
		

		return self;
	end

end)
