# dice
Simple command line dice roller

## Usage
Invoke from shell with either a single argument or an even number of arguments.

Invoking with a single argument will roll one die with that many sides.

Using an even number of arguments will take them as pairs and roll X number of dice with Y sides and output each roll along with the total sum of these rolls.

## Examples
    [user@example ~]$ ./dice.sh 6
    Rolling 1d6
      Result: 2
    [user@example ~]$ ./dice.sh 3 6 2 20 10 4
    Rolling 3d6
      Rolls: 5 1 6
      Total: 12
    Rolling 2d20
      Rolls: 19 4
      Total: 23
    Rolling 10d4
      Rolls: 2 2 4 3 4 3 1 3 4 3
      Total: 29

## License
Released unter The Unlicense
