Travis.ci:
[![Build Status](https://travis-ci.org/ElizabethRamos/cookbook.svg?branch=master)](https://travis-ci.org/ElizabethRamos/cookbook)

## CookBook

This is CookBook, an application for sending kitchen recipes.
It was done with the goal of improving my knowledge in Rails and exercising the use of good practices
Feel free to propose new features, and review the code.

## How does it work

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

And we already have some recipes on seeds:

```
$ rails db:seed
```


Yay! You're ready to run the app in a local server:

```
$ rails server
```

## Tests

Development with 100% coverage of features tests. I'm using Rspec and Capybara.

## Code Quality

I'm learning, and because of this, I try to revise my code constantly, studying best practices and asking for code review for more experienced devs.
Also, I'm using Rubocop to do the code analysis.

## Continuous Integration

Each commit (including the tests) goes through an automated build (including testing) to detect integration errors as quickly as possible. For this, I'm using travis.ci.
