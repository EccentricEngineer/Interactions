# LovSquad: Community based growth for content creators.

[www.lovsquad.com](https://project.com)

## Install

### Clone the repository

```shell
git@github.com:c-cle/lovsquad.git
cd lovsquad
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.3`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.0.3
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set environment variables

Using [Figaro](https://github.com/laserlemon/figaro):

See [config/application.yml.sample](https://github.com/c-cle/lovsquad/blob/master/config/application.yml.sample) and contact the developer: [input your email](mailto:your-email) (sensitive data).

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Add heroku remotes

Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a lovsquad
heroku git:remote --remote heroku-staging -a lovsquad-staging
```

## Serve

```shell
rails s
```

## Deploy

### With Heroku pipeline (recommended)

Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a lovsquad-staging
```

### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku
```
