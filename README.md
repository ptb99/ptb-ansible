# ptb-ansible

Ansible configs to setup various Raspberry Pi (and other) projects


I've found configuring Raspberry Pis for various purposes has gotten
repetitive, with a bunch of common steps and a few unique steps for each
specific application.  This begs for some form of scripting/automation, and
it seems that Ansible is well-suited for this purpose.

I looked around and found a number of other folks using Ansible for Pis, but
decided I didn't like any of those solutions.  For one, I didn't want to
edit locale files directly, but wanted to use "raspi-config nonint" so that
any future improvements in Raspbian's utilities automatically get
incorporated.  Second, I eventually figured out that I needed to split the
general configuration into a "role" and leave my specific settings in
individual playbooks.  Hence the structure that I ended up with here.

One other comment on the general approach.  The idea is to create the
/boot/ssh file after writing the initial SD card image, and then boot up the
Pi with wired ethernet.  This brings it up on the LAN as hostname
"raspberrypi" and allows for the basic configuration (timezone, locale,
etc.) to be done as well as for the target hostname to be set and my local
wifi settings to be installed.  After that, the Pi is rebooted (and can be
unplugged from ethernet) and Ansible can be rerun for the hostname/role that
is desired.  This is accomplished with custom playbooks for each role, which
can then include a common task file for standard addon packages that I
always install (like python3-pip and jove).

This all may or may not be useful to anyone else, but I'll make it available
if this approach makes sense to you.
