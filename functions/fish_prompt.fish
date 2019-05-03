function fish_prompt
	# Store the exit code of the last command
	set -g sf_exit_code $status
	set -g SPACEFISH_VERSION 2.4.0

	# ------------------------------------------------------------------------------
	# Configuration
	# ------------------------------------------------------------------------------

	__sf_util_set_default SPACEFISH_PROMPT_ADD_NEWLINE true
	__sf_util_set_default SPACEFISH_PROMPT_FIRST_PREFIX_SHOW false
	__sf_util_set_default SPACEFISH_PROMPT_PREFIXES_SHOW true
	__sf_util_set_default SPACEFISH_PROMPT_SUFFIXES_SHOW true
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_PREFIX "via "
	__sf_util_set_default SPACEFISH_PROMPT_DEFAULT_SUFFIX " "
    __sf_util_set_default set SPACEFISH_PROMPT_ORDER time user host spotify dir git package node docker ruby golang php rust haskell julia aws conda pyenv kubecontext line_sep battery jobs exit_code char

	# ------------------------------------------------------------------------------
	# Sections
	# ------------------------------------------------------------------------------

	# Keep track of whether the prompt has already been opened
	set -g sf_prompt_opened $SPACEFISH_PROMPT_FIRST_PREFIX_SHOW

    set -g SPACEFISH_HOST_SHOW always
    set -g SPACEFISH_DIR_SHOW always
    set -g SPACEFISH_TIME_SHOW always
    set -g SPACEFISH_USER_SHOW always
    set -g SPACEFISH_PROMPT_PREFIXES_SHOW false
    set -g SPACEFISH_DIR_TRUNC_REPO true
    set -g SPACEFISH_DIR_TRUNC 2
    set -g SPACEFISH_HOST_COLOR_SSH green
    set -g SPACEFISH_HOST_COLOR red
    set -g SPACEFISH_USER_COLOR purple
    set -g SPACEFISH_PROMPT_ORDER time user host spotify dir git package node docker ruby golang rust haskell julia aws conda pyenv kubecontext line_sep battery jobs exit_code char

	if test "$SPACEFISH_PROMPT_ADD_NEWLINE" = "true"
		echo
	end

	for i in $SPACEFISH_PROMPT_ORDER
		eval __sf_section_$i
	end
	set_color normal
end
