# Slow Mobius

[Slow Mobius](https://www.youtube.com/watch?v=j-5wmWuJHMI) lets you control
system time on OSX from the command line.

## Installation

Like other gems.

## Usage

Run `sudo bin/repl` to get to a prompt.  It takes commands that look like this:
`1m,-2d,3H,-4M,5y`.  This will change the date forward one month, backwards two
days, etc.  You only need to specify the fields you want to change.  `reset`
will sync the clock with the real time.

## Todo
* better reset (ditch the applescript)
* linux support
* undo
