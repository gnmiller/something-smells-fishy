#
# PHP
#
# PHP is a server-side scripting language designed primarily for web development.
# Link: http://www.php.net/

function __sf_section_spotify -d "Display the current spotify track"
	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_SPOTIFY_SHOW true
	__sf_util_set_default SPACEFISH_SPOTIFY_PREFIX $SPACEFISH_PROMPT_DEFAULT_PREFIX
	__sf_util_set_default SPACEFISH_SPOTIFY_SUFFIX $SPACEFISH_PROMPT_DEFAULT_SUFFIX
	__sf_util_set_default SPACEFISH_SPOTIFY_SYMBOL "▶️ "
	__sf_util_set_default SPACEFISH_SPOTIFY_COLOR green

	# ------------------------------------------------------------------------------
	# Section
	# ------------------------------------------------------------------------------

	# is shpotify set to show
	[ $SPACEFISH_SPOTIFY_SHOW = false ]; and return

    # ensure shpotify is available
	type -q spotify; or return

    # check if spotify is playing
    if test (spotify status | head -1 | grep -i "paused" | wc -l) -eq 1
        return
    end
    set -l spotify_track (spotify status | grep -E 'Artist|Track' | awk -F':' '{print $2" -"}' | tr '\n' ' ' | sed 's/  */ /g' | rev | cut -b 4- | rev | cut -b 2-)
    
	__sf_lib_section \
		$SPACEFISH_SPOTIFY_COLOR \
		$SPACEFISH_SPOTIFY_PREFIX \
		"$SPACEFISH_SPOTIFY_SYMBOL $spotify_track" \
		$SPACEFISH_SPOTIFY_SUFFIX
end
