# Git-Got

[Git-Got][1] is a set of powershell cmdlets and functions that expose
functionality from [libgit2sharp][2]. Ideally, you load this module
into your powershell session and git is in memory, which should make
it run faster, which was always one of my chief gripes with git on
windows.

## Installation

You can use nuget to install Git-Got:

    > nuget install Git-Got

Then all you need to do is load the module in your profile script:

    > notepad $profile

add the line:

    Import-Module path/to/Git-Got.psm1

somewhere, save, start a new powershell session, and you're good to
go.

## Usage

Git-Got definds a bunch of functions to call into libgit2sharp. 

    > $repo = Get-Repository path\to\my\project

    > $repo.Branches | ForEach-Object { $_.Name }

To make it easier to work with on the command line, there are also a
couple of higher level wrapper functions, so instead of:

    > ....long ass invocation of extension methods in powershell...

you can say:

    > Get-Commits $repo -StartAt sha

## Status

This project is still under heavy development. If you find a loose
floorboard let me know, but don't hurt yourself.

[1]: http://github.com/cbilson/Git-Got
[2]: https://github.com/libgit2/libgit2sharp
