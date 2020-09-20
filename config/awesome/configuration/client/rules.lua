local awful = require('awful')
local gears = require('gears')
local ruled = require('ruled')
local client_keys = require('configuration.client.keys')
local client_buttons = require('configuration.client.buttons')

ruled.client.connect_signal(
	'request::rules',
	function()

		-- All clients will match this rule.
		ruled.client.append_rule {
			id         = 'global',
			rule       = { },
			properties = {
				focus     = awful.client.focus.filter,
				raise     = true,
				floating = false,
				maximized = false,
				above = false,
				below = false,
				ontop = false,
				sticky = false,
				maximized_horizontal = false,
				maximized_vertical = false,
				round_corners = true,
				keys = client_keys,
				buttons = client_buttons,
				screen    = awful.screen.preferred,
				shape = function(cr, width, height)
					gears.shape.rectangle(cr, width, height)
				end,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen
			}
		}

		-- Titlebar rules
		ruled.client.append_rule {
			id 		= 'titlebars',
			rule_any   = {
				type = {
					'normal',
					'dialog'
				}
			},
			properties = {
				titlebars_enabled = true
			}
		}

		-- Dialogs
		ruled.client.append_rule {
			id         = 'dialog',
			rule_any   = { 
				type  = { 'dialog' },
				class = { 'Wicd-client.py', 'calendar.google.com' }
			},
			properties = { 
				titlebars_enabled = true,
				floating = true,
				above = true,
				draw_backdrop = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Modals
		ruled.client.append_rule {
			id         = 'dialog',
			rule_any   = { 
				type = { 'modal' }
			},
			properties = { 
				titlebars_enabled = true,
				floating = true,
				above = true,
				draw_backdrop = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Utilities
		ruled.client.append_rule {
			id         = 'utility',
			rule_any   = { 
				type = { 'utility' }
			},
			properties = { 
				titlebars_enabled = false,
				floating = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

		-- Splash
		ruled.client.append_rule {
			id         = 'splash',
			rule_any   = { 
				type = { 'splash' }
			},
			properties = {
				titlebars_enabled = false,
				round_corners = false,
				floating = true,
				above = true,
				skip_decoration = true,
				placement = awful.placement.centered
			}
		}

	-- Browsers
	ruled.client.append_rule {
		id         = "web_browsers",
		rule_any   = { 
			class = {
				"Vivaldi",
				"firefox",
				"Tor Browser"
			}
		},
		properties = { 
			tag = '1'
		}
	}

	-- File managers
	ruled.client.append_rule {
		id         = "file_managers",
		rule_any   = {  
			class = {
				"dolphin",
				"ark",
				"Nemo",
				"File-roller"
			}
		},
		properties = { 
			tag = '2',
			switchtotag = true
		}
	}

	-- Gaming
	ruled.client.append_rule {
		id         = "gaming",
		rule_any   = {  
			class = {
				"Wine",
				"Win64",
				"steam",
				"Albion Online",
				"Civ6Sub",
				"WineDesktop",
				"portal2_linux",
				"DRAG"
			},
		},
		properties = { 
			tag = '3',
			skip_decoration = true,
			draw_backdrop = false,
			switchtotag = true,
			floating = false,
			hide_titlebars = true
		}
	}

	-- Steam
	ruled.client.append_rule {
		id         = "file_managers",
		rule_any   = {  
			class = {
				"Steam",
				"Lutris"
			}
		},
		properties = { 
			tag = '4',
			switchtotag = true
		}
	}

	-- Social
	ruled.client.append_rule {
		id         = "social",
		rule_any   = { 
			class = {
				"discord",
				"Teams"
			}
		},
		properties = { 
			tag = '5'
		}
	}

	-- Email
	ruled.client.append_rule {
		id         = "email",
		rule_any   = {  
			class = {
				"Thunderbird"

			}
		},
		properties = { 
			tag = '6'
		}
	}

	-- Multimedia
	ruled.client.append_rule {
		id         = "multimedia",
		rule_any   = {  
			class = {
				"mpv",
				"Spotify",
				"Google Play Music Desktop Player"
			}
		},
		properties = { 
			tag = '7',
			draw_backdrop = false
		}
	}

	-- terminal emulators
	ruled.client.append_rule {
		id         = "terminals",
		rule_any   = { 
			class = { 
				"URxvt",
				"XTerm",
				"UXTerm",
				"kitty",
				"K3rmit"
			}
		},
		except_any = {
			-- Exclude the QuakeTerminal
			instance = { "QuakeTerminal" }
		},
		properties = {
			tag = '8',
			switchtotag = true,
			draw_backdrop = false,
			size_hints_honor = false
		}
	}

	-- text editors
	ruled.client.append_rule {
		id         = "text_editors",
		rule_any   = {  
			class = {
				"Geany",
				"Atom",
				"Subl3",
				"code-oss"
			},
			name  = {
				"LibreOffice",
				"libreoffice"
			}
		},
		properties = { 
			tag = '9'
		}
	}

		-- Image viewers
		ruled.client.append_rule {
			id        = 'image_viewers',
			rule_any  = {
				class    = {
					'feh',
					'Pqiv',
					'Sxiv'
				},
			},
			properties = { 
				titlebars_enabled = true,
				skip_decoration = true,
				floating = true,
				ontop = false,
				placement = awful.placement.centered
			}
		}

		-- Discord updater
		ruled.client.append_rule {
			id        = 'discord_updater',
			rule_any  = {
				name = {'Discord Updater'}
			},
			properties = { 
				round_corners = false,
				skip_decoration = true,
				titlebars_enabled = false,
				floating = true,
				ontop = true,
				placement = awful.placement.centered
			}
		}

		-- Floating
		ruled.client.append_rule {
			id       = 'floating',
			rule_any = {
				instance    = {
					'file_progress',
					'Popup',
					'nm-connection-editor',
				},
				class = { 
					'scrcpy' ,
					'Mugshot',
					'Pulseeffects'
				}
			},
			properties = { 
				titlebars_enabled = true,
				skip_decoration = true,
				ontop = true,
				floating = true,
				focus = awful.client.focus.filter,
				raise = true,
				keys = client_keys,
				buttons = client_buttons,
				placement = awful.placement.centered
			}
		}
		
	end
)


-- Normally we'd do this with a rule, but some program like spotify doesn't set its class or name
-- until after it starts up, so we need to catch that signal.

-- If the application is fullscreen in its settings, make sure to set `c.fullscreen = false` first
-- before moving to the desired tag or else the tag where the program spawn will cause panels to hide. 
-- After moving the program to specified tag you can set `c.fullscreen = true` now

client.connect_signal(
	'property::class',
	function(c)
		if c.class == 'Spotify' then
			local window_mode = false

			-- Check if fullscreen or window mode
			if c.fullscreen then
				window_mode = false
				c.fullscreen = false
			else
				window_mode = true
			end

			-- Check if Spotify is already open
			local stk = function (c)
				return ruled.client.match(c, { class = 'Spotify' })
			end

			local stk_count = 0
			for c in awful.client.iterate(stk) do
				stk_count = stk_count + 1
			end

			-- If Spotify is already open, don't open a new instance
			if stk_count > 1 then
				c:kill()
				-- Switch to previous instance
				for c in awful.client.iterate(stk) do
					c:jump_to(false)
				end
			else
				-- Move the instance to specified tag on this screen
				local t = awful.tag.find_by_name(awful.screen.focused(), '6')
				c:move_to_tag(t)
				t:view_only()

				-- Fullscreen mode if not window mode
				if not window_mode then
					c.fullscreen = true
				else
					c.floating = true
				end
			end
		end
	end
)
