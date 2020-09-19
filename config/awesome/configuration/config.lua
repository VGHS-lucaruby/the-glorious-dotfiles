return {
	widget = {
		email  = {
			address       = '',
			app_password  = '',
			imap_server   = 'imap.gmail.com',
			port          = '993'
		},

		weather = {
			key           = '',
			city_id       = '',
			units         = 'metric',
			update_interval = 1200
		},

		network = {
			wired_interface = 'enp0s0',
			wireless_interface = 'wlan0'
		},

		clock = {
			military_mode = false,
		},

		screen_recorder = {
			resolution = '2160x1440',
			offset = '0,0',
			audio = false,
			save_directory = '$(xdg-user-dir VIDEOS)/Recordings/',
			mic_level = '20',
			fps = '60'
		}
	},

	module = {
		auto_start = {
			debug_mode = false
		},

		dynamic_wallpaper = {
			wall_dir = 'theme/wallpapers/',
			valid_picture_formats = {"jpg", "png", "jpeg"},
			-- Leave this table empty for full auto scheduling
			wallpaper_schedule = {
				['06:00:00'] = 'Wallpaper-Morning.png',
				['18:00:00'] = 'Wallpapper-Evening.png',
			-- Example of just using auto-scheduling with keywords
			--[[
				'midnight',
				'morning',
				'noon',
				'afternoon',
				'evening',
				'night'
			--]]
			},
			stretch = false
		},

		lockscreen = {
			military_clock = true,
			fallback_password = 'toor',
			capture_intruder = true,
			face_capture_dir = '$(xdg-user-dir PICTURES)/Intruders/',
			blur_background = true,
			wall_dir = 'theme/wallpapers/',
			default_wall_name = 'morning-wallpaper.jpg',
			tmp_wall_dir = '/tmp/awesomewm/' .. os.getenv('USER') .. '/'
		}
	}
}
