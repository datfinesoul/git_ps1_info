============
git_ps1_info
============
:Version: 1.0.0
:Code: http://github.com/datfinesoul/git_ps1_info
:Keywords: bash git ps1

installation
------------
Add the following line somewhere before your PS1="..." entry in your .bash_profile file::

	source sourced_git_ps1_info.bash

Then, in your PS1="..." entry, add the following in the location you want the additional
GIT info to appear::

	\$(git_ps1_info)

eg.::

	PS1="\h \w \$(git_ps1_info) $ "

will create a prompt looking something like this::

	mymachinename ~/code/git_ps1_info (master) $

information
-----------
When you are on a branch the prompt usually looks like this (eg. master)::

	(master)

If you are on an un-named commit, it will show the abbreviated commit message::

	(405c6b9)

And if you are on a merge commmit, it will show you the merge parents as well::

	(master < e19faca dbcbc8f)

In addition, if there are any outstanding changes, (not including untracked files),
the current branch name will be highlighted in red.
