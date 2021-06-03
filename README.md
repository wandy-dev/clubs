# Commands line using bash scripts

## clubs

Clubs is a framework for creating command line interface apps. Clubs is written in bash for the purpose being able to be run without adding anything to the system that is running it. (Unless you're running windows then something like WSL needs to be installed)

## Goals

The main purpose of clubs to to provide functionality to a bash script that requires a lot of boiler plate code that makes reading the script in question harder to read, especially for new contributors.

The following goals have not been implemented
  - Easy install
    - A user should be able to "build from source" even though bash is not a compiled language, this is a familiar interface
    - Alternatively a user should be able to run something like `wget https://clubs.com/install | bash` to allow for installation of the framework
    - The easy install should work for installing clubs for development, or any CLI that is written using clubs. If a user installs a script that is written in clubs it should either install clubs or if they already have clubs, it should only install the script
  - Easy update
    - Scripts written in clubs should be able to be updated from an update command that will fetch updates from the github repo of the script
    - Clubs CLI
      - A CLI to bootstrap a new script would be very nice to have. Currently to use clubs, you have to set up all the directory structure, and set variables that clubs needs inside your project. Being able to run `clubs new <project-name> would make using it much easier

## Setup

To get started using clubs, clone the repo then add the following to your script

```
#!/bin/bash
CLUBS_DIR=<location-of-clubs-repo>
COMMAND_DIR=<location-of-your-sub-commands> # this is only necessary if you plan to have sub commands (i.e. mycli mysub_command)

# Source code that sub commands depend on must go here.

source $CLUBS_DIR/main.sh
```

The comment in the above example is for functions that your sub commands use. If those functions themselves depend on clubs, you should source the parts that those functions depend on above the functions, and source `sub_commands.sh` below them, rather than sourcing `main.sh`

Ideally `COMMAND_DIR` should be `~/.config/<your-script>/sub` If a clubs bootstrap command line tool ever gets added, this would be where it will be created.

## Features

#### cecho (echo with color)

###### example

`cecho red "hello world"` prints hello world in red

###### options

black, red, green, yellow, blue, purple, cyan, white

#### error

This echoes the text passed in stylized in red text, and then calls `exit 1` to signify an error has occurred.

###### example

`error "invalid arguments"`

#### Sub commands

To add a sub commands to your script first set `COMMAND_DIR` with the directory containing your sub commands` This should be ~/.config/<your-script>/sub_<your-script>
Lets use a command foo as the name of our script

```
#!/bin/bash
COMMAND_DIR=~/.config/foo/sub_foo

source $CLUBS_DIR/main.sh
```

Now in your sub command directory, you can create a file for a foo sub command, the file should be named as so <your-command>_<your-sub-command>.sh

```
touch ~/.config/foo/sub_foo/foo_bar.sh
```

The contents of this file should be a function with a name using the same naming convention as the file we just created. The contents can be whatever you would like.

```
# ~/.config/foo/sub_foo/foo_bar.sh
foo_bar () {
  echo "hello $(whoami)"
}
```

Now lets try running our command

`$ foo bar` returns `hello wandy-dev`
