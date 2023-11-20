# PayrollGold SaaS

Free and Open Source payroll solution for Kenyan Businesses. You can host it yourself or use the version hosted at https://payrollgold.com

## Getting Started

#### Requirements

You'll need the following installed to run the template successfully:

* Ruby 3.0 or higher
* bundler - `gem install bundler`
* Redis - For ActionCable support (and Sidekiq, caching, etc)
* PostgreSQL - `brew install postgresql`
* Libvips or Imagemagick - `brew install vips imagemagick`
* Yarn - `brew install yarn` or [Install Yarn](https://yarnpkg.com/en/docs/install)
* Foreman (optional) - `gem install foreman` - helps run all your
  processes in development
* If you install [Overmind](https://github.com/DarthSim/overmind) (optional), it will be used in place of Foreman - `brew install tmux overmind`
* [Stripe CLI](https://stripe.com/docs/stripe-cli) for Stripe webhooks in development - `brew install stripe/stripe-cli/stripe`
* *MacOS Running Apple Silicone Only* - `arch -x86_64 brew install wkhtmltopdf`

All Homebrew dependencies are listed in `Brewfile`, so you can install them all at once like this:

```bash
brew bundle install --no-upgrade
```

#### Initial Setup

First, edit `config/database.yml` and change the database name. (optional)

Next, run `bin/setup` to install Rubygem and Javascript dependencies. This will also install foreman system wide for you and setup your database.

```bash
bin/setup
```

#### Running PayrollGold

To run your application, you'll use the `bin/dev` command:

```bash
bin/dev
```

This starts up Overmind (or fallback to Foreman) running the Procfile.dev config.

We've configured this to run the Rails server, CSS bundling, and JS bundling out of the box. You can add background workers like Sidekiq, the Stripe CLI, etc to have them run at the same time.

Here's a couple of useful Overmind commands:

```sh
# Debugging with byebug: connect to the `web` process to be able to input commands:
overmind connect web
# Then disconnect by hitting [Ctrl+B] (or your tmux prefix) and then [D].

# Restart a process without restarting all the other ones:
overmind restart web

# If something goes wrong, you can kill all running processes:
overmind kill
```

#### Windows Support

If you'd like to run PayrollGold on Windows, we recommend using WSL2. You can find instructions here: https://gorails.com/setup/windows

Alternatively, if you'd like to use Docker on Windows, you'll need to make sure you clone the repository and preserve the Linux line endings.

```bash
git clone git@github.com:username/myrepo.git --config core.autocrlf=input
```

## Production deployment

## Preparation

In order to prepare for deployment to production, perform the following steps:

1. Create a `.env` file by running: `cp .env.example .env`.
1. Run `RAILS_ENV=production rake secret` in order to generate a secret for use in production. Please keep this secret in a **very** safe location.
1. Add the secret to last line of the `.env.example` file. 

#### Running with Docker Compose

We include a sample Docker Compose configuration that runs Rails, Postgresql, and Redis for you.

Simply run:
```
docker-compose up
```

Then open http://localhost:3030

#### Running with Docker

If you'd like to run PayrollGold with Docker directly, you can run:

```bash
docker build --tag myapp .
docker run myapp
```
