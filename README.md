# Slow Mobius

[Slow Mobius](https://www.youtube.com/watch?v=j-5wmWuJHMI) lets you control
system time on OSX from the command line.

## Usage

Use at your own risk - this thing is poorly tested and hacky, and it's caused me
to see some errors when using `sudo`.

`sudo bin/repl` brings up a prompt.  It takes commands that look like this:
`1m,-2d,3H,-4M,5y`.  This will change the date forward one month, backward two
days, forward 3 hours, backward 4 minutes, and forward 5 years.  You only need
to specify the fields you want to change.  `reset` will sync the clock with the
real time.  You can also run `sudo bin/reset` from the command line to
reset. `undo` will go back to the previous time.

## Todo
* linux support
* fix gem build `require`s
* better output
* command line config options
