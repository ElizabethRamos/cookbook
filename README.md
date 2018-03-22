
## CookBook
Travis.ci:
[![Build Status](https://travis-ci.org/ElizabethRamos/cookbook.svg?branch=master)](https://travis-ci.org/ElizabethRamos/cookbook)

This is CookBook, an application for sending kitchen recipes.
It was done with the goal of improving my knowledge in Rails and exercising the use of good practices like: TDD, continuous integration and code refactoring.
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
