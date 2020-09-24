local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local icons = require('theme.icons')

local tags = {
	{
		icon = icons.web_browser,
		type = 'chrome',
		default_app = 'vivaldi-snapshot',
		gap = beautiful.useless_gap
	},	
	{
		icon = icons.file_manager,
		type = 'files',
		default_app = 'nemo',
		gap = beautiful.useless_gap
	},
	{
		icon = icons.games,
		type = 'game',
		default_app = 'wine',
		gap = beautiful.useless_gap
	},
	{
		icon = icons.steam,
		type = 'steam',
		default_app = 'steam-native',
		gap = beautiful.useless_gap
	},
    {
	    icon = icons.discord,
	    type = 'social',
	    default_app = 'discord-canary',
	    screen = 1
	},
	{
		icon = icons.email,
		type = 'email',
		default_app = 'thunderbird',
		gap = beautiful.useless_gap
	},
	{
		icon = icons.spotify,
		type = 'music',
		default_app = 'spotify',
		gap = beautiful.useless_gap
	},
	{
		icon = icons.terminal,
		type = 'terminal',
		default_app = 'kitty',
		gap = beautiful.useless_gap
	},
	{
		icon = icons.text_editor,
		type = 'code',
		default_app = 'code',
		gap = beautiful.useless_gap
	}
}

-- Set tags layout
tag.connect_signal(
	'request::default_layouts',
	function()
	    awful.layout.append_default_layouts({
			awful.layout.suit.spiral.dwindle,
			awful.layout.suit.tile,
			awful.layout.suit.floating,
			awful.layout.suit.max
	    })
	end
)

-- Create tags for each screen
screen.connect_signal(
	'request::desktop_decoration',
	function(s)
		for i, tag in pairs(tags) do
			awful.tag.add(
				i,
				{
					icon = tag.icon,
					icon_only = true,
					layout = tag.layout or awful.layout.suit.spiral.dwindle,
					gap_single_client = true,
					gap = tag.gap,
					screen = s,
					default_app = tag.default_app,
					selected = i == 1
				}
			)
		end
	end
)

-- Change tag's client's shape and gap on change
tag.connect_signal(
	'property::layout',
	function(t)
		local current_layout = awful.tag.getproperty(t, 'layout')
		if (current_layout == awful.layout.suit.max) then
			-- Set clients gap to 0 and shape to rectangle if maximized
			t.gap = 0
			for _, c in ipairs(t:clients()) do
				if not c.floating then
					c.shape = function(cr, width, height)
						gears.shape.rectangle(cr, width, height)
					end
				else
					c.shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end
				end
			end
		else
			-- Set clients gap and shape
			t.gap = beautiful.useless_gap
			for _, c in ipairs(t:clients()) do
				if not c.round_corners or c.maximized then
					c.shape = function(cr, width, height)
						gears.shape.rectangle(cr, width, height)
					end
				else
					c.shape = function(cr, width, height)
						gears.shape.rounded_rect(cr, width, height, beautiful.client_radius)
					end
				end
			end
		end
	end
)

-- Focus on urgent clients
awful.tag.attached_connect_signal(
	s,
	'property::selected',
	function()
		local urgent_clients = function (c)
			return awful.rules.match(c, {urgent = true})
		end
		for c in awful.client.iterate(urgent_clients) do
			if c.first_tag == mouse.screen.selected_tag then
				client.focus = c
				c:raise()
			end
		end
	end
)
