# Breakfast Static Buildpack

Forked from the [Phoenix Buildpack](https://github.com/gjaldon/heroku-buildpack-phoenix-static).


## About

This buildpack is meant to be used with Breakfast. When deploying Rails apps to
Heroku, static assets will need to be compiled. This buildpack sees to it that
static assets are compiled and that a corresponding asset manifest is generated.

This buildpack takes care of

* Installing Node
* Building / Minifying Assets
* Digesting Assets

## Usage

```bash
# Create a Heroku instance for your project
heroku apps:create my_heroku_app

# Set and add the buildpacks for your Heroku app
heroku buildpacks:set https://github.com/devlocker/heroku-buildpack-breakfast

# Deploy
git push heroku master
```

## Configuration

Create a `breakfast_static_buildpack.config` file in your app's root dir if you
want to override the defaults. The file's syntax is bash.

If you don't specify a config option, then the default option from the
buildpack's [`breakfast_static_buildpack.config`](https://github.com/devlocker/heroku-buildpack-breakfast/blob/master/breakfast_static_buildpack.config)
file will be used.


__Here's a full config file with all available options:__

```bash
# Clean out cache contents from previous deploys
clean_cache=false

# We can set the version of Node to use for the app here
node_version=6.1.0
```

## FAQ

1. Do I need `heroku-buildpack-nodejs` with this?
  - No, this buildpack installs Node for you.
