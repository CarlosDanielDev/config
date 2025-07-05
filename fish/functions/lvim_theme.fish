function lvim_theme --description "Switch LunarVim theme between tokyonight and cyber-wave"
    set -l config_file ~/.config/lvim/config.lua
    
    echo "Starting theme switch process..."
    echo "Checking config file..."
    
    # Check if config file exists and is accessible
    if not test -f $config_file
        echo "Error: Config file not found at $config_file"
        return 1
    end
    
    # Check if config file is writable
    if not test -w $config_file
        echo "Error: Config file is not writable at $config_file"
        return 1
    end
    
    echo "Config file is accessible and writable."
    
    # If no arguments provided, show current theme and usage
    if test (count $argv) -eq 0
        echo "Current theme:" (grep "colorscheme" $config_file | string trim)
        echo "Usage: lvim_theme [tokyonight|cyber-wave]"
        return 0
    end
    
    set -l theme $argv[1]
    
    # Validate theme name
    if test "$theme" != "tokyonight" -a "$theme" != "cyber-wave"
        echo "Error: Invalid theme. Theme must be either 'tokyonight' or 'cyber-wave'"
        echo "Usage: lvim_theme [tokyonight|cyber-wave]"
        return 1
    end
    
    # Create backup
    echo "Creating backup of config file..."
    cp -v $config_file $config_file.backup
    
    # Check backup operation success
    if test $status -ne 0
        echo "Error: Failed to create backup of config file"
        return 1
    end
    
    echo "Backup created successfully at $config_file.backup"
    
    # Update theme
    echo "Updating theme to $theme..."
    sed -i "" "s/lvim.colorscheme = \"[^\"]*\"/lvim.colorscheme = \"$theme\"/" $config_file
    
    # Check sed operation success
    if test $status -ne 0
        echo "Error: Failed to update theme in config file"
        return 1
    end
    
    # Verify change
    echo "Verifying theme change..."
    grep --color=auto "colorscheme" $config_file
    
    # Check if plugin needs to be added
    echo "Checking if theme plugin is present..."
    if test "$theme" = "tokyonight" 
        if not grep -q "folke/tokyonight.nvim" $config_file
            echo "Adding tokyonight plugin to config..."
            sed -i "" "/lvim.plugins = {/a\\
  { \"folke/tokyonight.nvim\" }," $config_file
            echo "Plugin added successfully."
        else
            echo "Tokyonight plugin already present in config."
        end
    else if test "$theme" = "cyber-wave"
        if not grep -q "taybart/cyberwave" $config_file
            echo "Adding cyber-wave plugin to config..."
            sed -i "" "/lvim.plugins = {/a\\
  { \"taybart/cyberwave\" }," $config_file
            echo "Plugin added successfully."
        else
            echo "Cyber-wave plugin already present in config."
        end
    end
    
    echo "Theme switch complete! Please restart LunarVim for changes to take effect."
end

