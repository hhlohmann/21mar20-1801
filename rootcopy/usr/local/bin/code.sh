# hh wants to open files with VS Code from command line. This file
# serves as the missing VS Code instance in a PATH dir.

# The VS Code GUI app is /usr/share/code/code, as any GUI app it
# could (should) be started from CLI with "screen -d -m", i.e.
# `screen -d -m /usr/share/code/code -r "$1"` (cf.
# https://askubuntu.com/10547/q).
#
# **BUT** VS Code comes with its own wrapper script
# /usr/share/code/bin/code. This script also delivers an exec call
# with "--help" option, and it starts VS Code by itself in an own
# process.
#

# 
# Used Parameters:
#   - "-r" reuses a given instance / VS Coce process (default is
#     starting a new one)
#	- simply one given file is passed through
#	  - ! VS Code by itself creates new file if given file does
#         not exist, BUT that means that TYPOs in file names
#         are not catched as errors
#

/usr/share/code/bin/code -r "$1"

# ()
