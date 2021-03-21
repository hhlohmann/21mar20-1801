# Backup / Copy template: Porteus hh rootcopy folder

This repo demonstrates a schema for maintaining a rootcopy folder.


## Porteus rootcopy folder

[Porteus] offers a special *writable* folder "[rootcopy]" whose contents are copied to the *read-only* live system at each boot up - it allows you to enhance and adjust your system without the danger of destroying it since in case you could just erase the whole rootcopy content (out of a [Porteus' "Always fresh" mode]) to get back a virgin system.


## Using the rootcopy folder systematically

For more than throw-away testing - but of course also for that - the content of the rootcopy folder should be controlled, i.e. versioned and commented regarding changes, both to know what-why-how exists and is interacting with the system and other rootcopy contents, and to be able to step back to a former (well-working) state.

### Bad: Git repo inside rootcopy

The obvious way of versioning the rootcopy folder in itself runs into the problem that the (hidden) Git directory will also be copied to the live system. Beside moving some extra amount of bytes, this may lead to unnoticed and / or unwanted "activation" of rootcopy's "sleeping" Git directory, resulting in mysterious "white noise" for indedepent processes.

### Better: Separate Git repo as copy template (serving as backup the other way)

Changes to rootcopy should be planned and prepared in a separate Git repo and then applied to rootcopy, being able to always skip back. Skipping back from changes that are made first in rootcopy and then "saved" in a separate Git repo might be more difficult, but in case "backing up" by a Git repo is at leasts something. **Doing changes first in repo implies at least some documentation** whereas documenting afterwards is hard.

### rootcopy vs. Porteus Modules

It is no good idea to maintain separate projects in one Git repo, and also it is no good idea to use rootcopy for things that should be separated out due to complexity and independent change management. For rootcopy these are "big" applications that should go into [Porteus Modules], e.g. common web browsers with frequent (security) updates - applications itself are obviously not to be versioned by a rootcopy repo. The rootcopy folder can hold smaller settings for "modularized" applications (for modules that are activated at runtime, i.e. after system boot, settings inside the module will overwrite competing ones loaded before from rootcopy; solutions may be keeping modules free from those settings or apply settings at any time by a script).

### rootcopy contents vs Git management

For ease of operations on content for rootcopy without intermingling repo management stuff like this README and Git's database (.git folder), the repo contains a folder "rootcopy" instead of hosting content for rootcopy at the repo's root.



## Applying changes in repo to rootcopy

Since rootcopy contents generally should be rather smalĺ, a brute force full copy of the whole rootcopy folder is legit. Otherwise rsync is the obvious solution, using these parameters at Porteus runtime:

`rsync --recursive --delete --links --checksum --verbose $PORTDIR/rootcopy/ rootcopy/`

> add `--dry-run` for preceding test

The `PORTDIR` environment variable is set by Porteus at runtime, for working with rootcopy offline you have to set it or substitute in the command with the actual path.



## Backing up changes from rootcopy to repo

See "Applying", just the other way round.



[Porteus]: http://porteus.org/
[Porteus' "Always fresh" mode]: http://www.porteus.org/info/tips-and-tricks.html#16
[Porteus Modules]: http://www.porteus.org/tutorials/9-modules/56-what-are-porteus-modules.html
[rootcopy]: http://www.porteus.org/tutorials/26-general-info-tutorials/112-howto-use-the-rootcopy-directory.html

()