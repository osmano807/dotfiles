# -*- coding: utf-8 -*-

# import subprocess

from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%a, %d %b %X",)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
                format="{temp:.0f}°C",)

# The battery monitor has many formatting options, see README for details
#
# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
status.register("battery",
                format="{status} "
                "{percentage_design:3.0f}% ",
                alert=True,
                alert_percentage=10,
                status={
                    "DIS": "↓",
                    "CHR": "↑",
                    "FULL": "=",
                },)

# Has all the options of the normal network and adds some
# wireless specific things like quality and network names.
#
# Note: requires both netifaces-py3 and basiciw
status.register("wireless",
                interface="wlp1s0",
                format_up="{essid} {quality:3.0f}%",)

status.register("alsa",
                format="♪ {volume} {muted}",
                # color="#FF0000",
                color_muted="#888888",)

status.run()
