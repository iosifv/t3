# System commands
function kill-ds-store {
  find . -name "*.DS_Store" -type f -delete
}

# https://superuser.com/questions/1700177/how-can-i-calculate-how-much-energy-in-watt-hours-my-mac-laptop-uses-over-a-gi
function system-wattage {
ioreg -rw0 -c AppleSmartBattery | grep BatteryData | grep -o '"AdapterPower"=[0-9]*' | cut -c 16- | xargs -I %  lldb --batch -o "    print/f %" | grep -o '$0 = [0-9.]*' | cut -c 6-
}