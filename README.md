<div align="center">
  <h1>DGP-BACK</h1>
</div>

<div align="center">

[![Maintainability](https://api.codeclimate.com/v1/badges/d76af7e03021ed728c10/maintainability)](https://codeclimate.com/github/yohann-kevin/DGP/maintainability)

</div>

Back End of the daily galactic picture blog

## Technology

- Ruby and Ruby on Rails
- DB in sqlite3 on development and mysql2 for production
- Rails spec for test application
- Deploy with heroku
- Github action for continuous integration

## How to install this project

In order to install the project start by cloning the repository

```shell
git clone https://github.com/yohann-kevin/DGP.git

cd DGP
```

To start t will be necessary to install all the dependencies.

```shell
bundle install
```

If you don't have mysql on your machine, use this command

```shell
bundle install --without=production
```

Once the dependencies are installed, you will have to create the local database.

```shell
rails db:create
```

Then you need to load the database schema.

```shell
rails db:schema:load
```

And finally you can start server of this project

```shell
rails s
```

## How to contribute

To contribute to the happy API project please follow the instructions in CONTRIBUTING.md

## Contributor

- PERRIGUEY Yohann
