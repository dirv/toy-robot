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

## Next up / incomplete work

The `Simulator#perform_with_io` method does not have any automated tests. If I had more time I'd likely write tests for this, but to do that I'd need to implement a command to break out of `loop` expression, e.g. `EXIT`.
