# Weather in terminal
function weather ()
{
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Taipei}?${2:-0q}"
}