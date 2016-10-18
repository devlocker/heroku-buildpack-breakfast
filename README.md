# Breakfast Static Buildpack

## Purpose

This buildpack is meant to be used with Breakfast. When deploying Rails apps to Heroku, static assets will need to be compiled. This buildpack sees to it that static assets are compiled and that a corresponding asset manifest is generated.

## Features
* Easily customizable to your build needs with its `compile` hook!
* If your app doesn't have a Procfile, default web task `bundle exec rails server` will be run
* Can configure versions for Node and NPM
* Caches Node and NPM modules

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

Create a `breakfast_static_buildpack.config` file in your app's root dir if you want to override the defaults. The file's syntax is bash.

If you don't specify a config option, then the default option from the buildpack's [`breakfast_static_buildpack.config`](https://github.com/devlocker/heroku-buildpack-breakfast/blob/master/breakfast_static_buildpack.config) file will be used.


__Here's a full config file with all available options:__

```bash
# Clean out cache contents from previous deploys
clean_cache=false

# We can set the version of Node to use for the app here
node_version=5.3.0

# We can set the version of NPM to use for the app here
npm_version=2.10.1
```

## FAQ

1. Do I need `heroku-buildpack-nodejs` with this?
- No, this buildpack installs Node for you.
