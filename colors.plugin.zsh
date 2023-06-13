#!/usr/bin/env zsh

if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

autoload -Uz colortrans test_color_24bit test_color_codes test_color_names

if [[ -z "$NO_COLOR" && "$CLICOLOR" != 0 ]]; then
  export CLICOLOR=1
  typeset -Ag c; c=(
    reset '[0m'

    # Modificators
    bold '[1m'
    dim '[2m'
    faint '[2m'
    coursive '[3m'
    italic '[3m'
    underline '[4m'
    blink '[5m'
    inveverse '[7m'
    reverse '[7m'
    hidden '[8m'
    conceal '[8m'
    strike '[9m'
    strikethrough '[9m'
    double_underline '[4;21m'
    overline '[53m'

    # Reset Modificators
    reset_text '[22m'
    no_coursive '[23m'
    no_italic '[23m'
    no_underline '[24m'
    no_blink '[25m'
    no_inveverse '[27m'
    no_reverse '[27m'
    no_hidden '[28m'
    no_strike '[29m'
    no_strikethrough '[29m'

    # White-Gray-Black Colors
    default '[39m'
    base '[39m'
    base1 '[37;97m'
    white '[37;97m' # Do not use this. Just for compatibility
    base2 '[37m'
    light_grey '[37m' # Do not use this. Just for compatibility
    base3 '[30;90m'
    grey '[30;90m'  # Do not use this. Just for compatibility
    base4 '[30m'
    black '[30m' # Do not use this. Just for compatibility

    # Colors
    red '[31m'
    orange '[31;91m'
    yellow '[33m'
    chartreuse '[33;93m'
    green '[32m'
    springgreen '[32;92m'
    cyan '[36m'
    dodgerblue '[36;96m'
    blue '[34m'
    purple '[34;94m'
    violet '[35m'
    magenta '[35;95m'

    light_red '[31;91m' # Do not use this. Just for compatibility
    light_green '[32;92m' # Do not use this. Just for compatibility
    light_yellow '[33;93m' # Do not use this. Just for compatibility
    light_blue '[34;94m' # Do not use this. Just for compatibility
    light_magenta '[35;95m' # Do not use this. Just for compatibility
    light_cyan '[36;96m' # Do not use this. Just for compatibility

    # White-Gray-Black Background Colors
    bg_default '[49m'
    bg_base '[49m'
    bg_base1 '[47;107m'
    bg_white '[47;107m' # Do not use this. Just for compatibility
    bg_base2 '[47m'
    bg_light_grey '[47m' # Do not use this. Just for compatibility
    bg_base3 '[40;100m'
    bg_grey '[40;100m'  # Do not use this. Just for compatibility
    bg_base4 '[40m'
    bg_black '[40m' # Do not use this. Just for compatibility

    # Background Colors
    bg_red '[41m'
    bg_orange '[41;101m'
    bg_yellow '[43m'
    bg_chartreuse '[43;103m'
    bg_green '[42m'
    bg_springgreen '[42;102m'
    bg_cyan '[46m'
    bg_dodgerblue '[46;106m'
    bg_blue '[44m'
    bg_purple '[44;104m'
    bg_violet '[45m'
    bg_magenta '[45;105m'

    bg_light_red '[41;101m' # Do not use this. Just for compatibility
    bg_light_green '[42;102m' # Do not use this. Just for compatibility
    bg_light_yellow '[43;103m' # Do not use this. Just for compatibility
    bg_light_blue '[44;104m' # Do not use this. Just for compatibility
    bg_light_magenta '[45;105m' # Do not use this. Just for compatibility
    bg_light_cyan '[46;106m' # Do not use this. Just for compatibility


    ### RAW

    raw_reset '0'

    raw_bold '[1m'
    raw_dim '[2m'
    raw_faint '[2m'
    raw_coursive '[3m'
    raw_italic '[3m'
    raw_underline '[4m'
    raw_blink '[5m'
    raw_inveverse '[7m'
    raw_reverse '[7m'
    raw_hidden '[8m'
    raw_conceal '[8m'
    raw_strike '[9m'
    raw_strikethrough '[9m'
    raw_double_underline '[4;21m'
    raw_overline '[53m'

    raw_reset_text '[22m'
    raw_no_coursive '[23m'
    raw_no_italic '[23m'
    raw_no_underline '[24m'
    raw_no_blink '[25m'
    raw_no_inveverse '[27m'
    raw_no_reverse '[27m'
    raw_no_hidden '[28m'
    raw_no_strike '[29m'
    raw_no_strikethrough '[29m'

    raw_default '39'
    raw_base '39'
    raw_base1 '37;97'
    raw_white '37;97' # Do not use this. Just for compatibility
    raw_base2 '37'
    raw_light_grey '37' # Do not use this. Just for compatibility
    raw_base3 '30;90'
    raw_grey '30;90'  # Do not use this. Just for compatibility
    raw_base4 '30'
    raw_black '30' # Do not use this. Just for compatibility

    raw_red '31'
    raw_orange '31;91'
    raw_yellow '33'
    raw_chartreuse '33;93'
    raw_green '32'
    raw_springgreen '32;92'
    raw_cyan '36'
    raw_dodgerblue '36;96'
    raw_blue '34'
    raw_purple '34;94'
    raw_violet '35'
    raw_magenta '35;95'

    raw_light_red '31;91' # Do not use this. Just for compatibility
    raw_light_green '32;92' # Do not use this. Just for compatibility
    raw_light_yellow '33;93' # Do not use this. Just for compatibility
    raw_light_blue '34;94' # Do not use this. Just for compatibility
    raw_light_magenta '35;95' # Do not use this. Just for compatibility
    raw_light_cyan '36;96' # Do not use this. Just for compatibility

    raw_bg_default '49'
    raw_bg_base '49'
    raw_bg_base1 '47;107'
    raw_white '47;107' # Do not use this. Just for compatibility
    raw_bg_base2 '47'
    raw_bg_light_grey '47m' # Do not use this. Just for compatibility
    raw_bg_base3 '40;100'
    raw_bg_grey '40;100'  # Do not use this. Just for compatibility
    raw_bg_base4 '40'
    raw_bg_black '40' # Do not use this. Just for compatibility

    raw_bg_red '41'
    raw_bg_orange '41;101'
    raw_bg_yellow '43'
    raw_bg_chartreuse '43;103'
    raw_bg_green '42'
    raw_bg_springgreen '42;102'
    raw_bg_cyan '46'
    raw_bg_dodgerblue '46;106'
    raw_bg_blue '44'
    raw_bg_purple '44;104'
    raw_bg_violet '45'
    raw_bg_magenta '45;105'


    raw_bg_light_red '41;101' # Do not use this. Just for compatibility
    raw_bg_light_green '42;102' # Do not use this. Just for compatibility
    raw_bg_light_yellow '43;103' # Do not use this. Just for compatibility
    raw_bg_light_blue '44;104' # Do not use this. Just for compatibility
    raw_bg_light_magenta '45;105' # Do not use this. Just for compatibility
    raw_bg_light_cyan '46;106' # Do not use this. Just for compatibility

  )
else
  export CLICOLOR=0
  export NO_COLOR=1
fi
