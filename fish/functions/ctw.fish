# connect to wifi`:w
function ctw
    command nmcli dev wifi connect $argv -a
end
