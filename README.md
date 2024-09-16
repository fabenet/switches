Switches
===========

Console based light switching game.

Gameplay
--------

* This is a singleplayer game
* The game board consists of a 5 by 5 grid of lights
* When the game starts, a pattern of these lights is switched on, based on a randomly selected starting pattern
* Pressing any of the lights will toggle it **and** the four adjacent lights (top, right, bottom, left)
* The goal of the game is to switch all the lights on
* The amount of button presses is used as the metric of the gamer's performance

Example
-------

The game board might start as following:

```
column:   0   1   2   3   4
row:    ┌───┬───┬───┬───┬───┐
   0    │   │   │   │   │   │       x = light is on
        ├───┼───┼───┼───┼───┤
   1    │   │ x │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   2    │   │ x │   │ x │   │
        ├───┼───┼───┼───┼───┤
   3    │   │ x │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   4    │   │   │   │   │   │
        └───┴───┴───┴───┴───┘
```

The user enters the field `2,1` (row 2, column 1), this toggles all adjacent lights:

```
          0   1   2   3   4
        ┌───┬───┬───┬───┬───┐
   0    │   │   │   │   │   │
        ├───┼───┼───┼───┼───┤
   1    │   │   │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   2    │ x │   │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   3    │   │   │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   4    │   │   │   │   │   │
        └───┴───┴───┴───┴───┘
```

The user may also select a field on the edge which will also toggle the adjacent lights, e.g. `0,0`:

```
          0   1   2   3   4
        ┌───┬───┬───┬───┬───┐
   0    │ x │ x │   │   │   │
        ├───┼───┼───┼───┼───┤
   1    │ x │   │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   2    │ x │   │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   3    │   │   │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   4    │   │   │   │   │   │
        └───┴───┴───┴───┴───┘
```

A full board is the goal of the game:

```
          0   1   2   3   4
        ┌───┬───┬───┬───┬───┐
   0    │ x │ x │ x │ x │ x │
        ├───┼───┼───┼───┼───┤
   1    │ x │ x │ x │ x │ x │
        ├───┼───┼───┼───┼───┤
   2    │ x │ x │ x │ x │ x │
        ├───┼───┼───┼───┼───┤
   3    │ x │ x │ x │ x │ x │
        ├───┼───┼───┼───┼───┤
   4    │ x │ x │ x │ x │ x │
        └───┴───┴───┴───┴───┘
```

Starting patterns
-------------

The game should start choosing one of the following patterns randomly:


```
          0   1   2   3   4
        ┌───┬───┬───┬───┬───┐
   0    │   │   │   │   │   │
        ├───┼───┼───┼───┼───┤
   1    │   │ x │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   2    │   │ x │   │ x │   │
        ├───┼───┼───┼───┼───┤
   3    │   │ x │ x │ x │   │
        ├───┼───┼───┼───┼───┤
   4    │   │   │   │   │   │
        └───┴───┴───┴───┴───┘

          0   1   2   3   4
        ┌───┬───┬───┬───┬───┐
   0    │ x │   │   │   │ x │
        ├───┼───┼───┼───┼───┤
   1    │   │ x │   │ x │   │
        ├───┼───┼───┼───┼───┤
   2    │   │   │ x │   │   │
        ├───┼───┼───┼───┼───┤
   3    │   │ x │   │ x │   │
        ├───┼───┼───┼───┼───┤
   4    │ x │   │   │   │ x │
        └───┴───┴───┴───┴───┘

          0   1   2   3   4
        ┌───┬───┬───┬───┬───┐
   0    │   │   │ x │   │   │
        ├───┼───┼───┼───┼───┤
   1    │   │ x │   │ x │   │
        ├───┼───┼───┼───┼───┤
   2    │ x │   │ x │   │ x │
        ├───┼───┼───┼───┼───┤
   3    │   │ x │   │ x │   │
        ├───┼───┼───┼───┼───┤
   4    │   │   │ x │   │   │
        └───┴───┴───┴───┴───┘
```

## Setup

```shell
git clone git@github.com:cankoeks/switches.git
cd switches
gem install bundler
```

Install ruby-3.3.0 and ensure the version with:

```shell
ruby -v # => 3.3.0
```

Install dependencies with:

```shell
bundle install
```

## Development

To start your game run:

```shell
bin/switches
```

## Test

```shell
 rake test
```

## Development

A test driven approach is appreciated.

Tests should be written with `minitest/spec` syntax using minitest assertions.
