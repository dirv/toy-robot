# toy-robot

Implements a toy robot simulation.

## To run

You'll need Ruby installed on your machine. At a terminal, type:

```bash
bin/run
```

You can then enter commands, like this:

```
PLACE 0,0,NORTH
MOVE
REPORT
LEFT
RIGHT
```

To exit from the simulation, type Ctrl+C.

## Running tests

Tests cases are inclued in the `spec` directory. For example, see `spec/simulator_spec.rb`.

```bash
bundle install
bundle exec rspec
```

## My approach

I started by drafting a quick plan of how I wanted to structure the simulation. I settled on an immutable `Robot` class for recording the current position, a `Parser` class for parsing commands, and a `Simulator` class for running the simulation.

I used TDD for the `Robot` and `Parser` classes. For the `Simulator` class, as I was running out of time I created the implementation first and then wrote some brief tests for `#perform_action` afterwards. (Given more time I would have written a more specific set of test cases for this method.)

I used Git commits to show the approach I used, including refactorings - for example, I pulled out a `Tabletop` class for storing the dimensions of the tabletop.

## Next up / incomplete work

The `Simulator#perform_with_io` method does not have any automated tests. If I had more time I'd likely write tests for this, but to do that I'd need to implement a command to break out of `loop` expression, e.g. `EXIT`.

I would also need to replace use of the `Kernel` class in this function -- likely I would pass in an `io = Kernel` object to the constructor and in the tests I'd override this with a `StringIO` instance.
