# Theme switching function for lvim
function switch_lvim_theme --argument theme
    if test -z "$theme"
        echo "Usage: switch_lvim_theme [tokyonight|cyber-wave]"
        return 1
    end
    
    if test "$theme" != "tokyonight" -a "$theme" != "cyber-wave"
        echo "Error: Theme must be either tokyonight or cyber-wave"
        return 1
    end
    
    set -l config_file ~/.config/lvim/config.lua
    
    # Create backup
    cp "$config_file" "$config_file.backup"
    
    # Update theme
    sed -i "" "s/lvim.colorscheme = \"[^\"]*\"/lvim.colorscheme = \"$theme\"/" "$config_file"
    
    echo "Switched to $theme theme. Please restart LunarVim."
end
