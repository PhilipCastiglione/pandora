# Pandora

A web app for helping choose what activities to do.

Live at: https://pandora.philipcastiglione.com/

## Technologies

Ruby on Rails, sqlite, Docker, Kamal

## Development

### Requirements

**Ruby Version:** 3.2.2

**System dependencies:**

```sh
gem install rails
bin/bundle install
```

**Configuration:**

You will need a master key file, kept in 1password.

**Database:**

```sh
bin/rails db:setup
```

**Tests:**

```sh
bin/rails test
```

### Deployment

With docker running:

```sh
export KAMAL_REGISTRY_TOKEN=...

bin/kamal deploy
```
