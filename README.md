# Description
This jiggler script is designed to run on the [TinyPilot Voyager 2](https://tinypilotkvm.com/). 

Be default it is setup to start at 8AM EST. To modify this simply edit the **OnCalendar** directive in [jiggler.timer](jiggler.timer) systemd config file

# Usage
Clone this repo then as root, run the the configure-jiggler.sh file on the tinypilot system to enable mouse jiggler.
```bash
./configure-jiggler.sh
```
