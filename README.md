# Butler

The butler serves you assets, get it?

Currently the Butler bundles stylesheets suitable for admin interfaces.

## Installation

Add this line to your application's Gemfile:

```
gem 'butler', git: 'git@github.com:ninjaconcept/butler'
```

Or if you wish to make changes to the butler,

```
gem 'butler', path: "PATH TO YOUR LOCAL COPY OF THE BUTLER"
```

And then execute:

    $ bundle

## Usage

Append the following line to your `app/assets/stylesheets/application.css` file:

```
/*= require butler */
```

And in `app/assets/stylesheets/application.js` file:

```
//= require butler
```

The butler is currently **a work in progress**. Things are broken and we still do not
know what to include by default and what to ask the user to provide (such as a current_user method).

# Admin Scaffold Usage

Generates admin controller with admin layout and with specific views for all model attributes.

### Usage

```rails g butler:admin_scaffold MODEL ATTRIBUTES```

### Example

```rails g butler:admin_scaffold Post title:string content:text```

# Dependecies

## Simple Form

## Kaminari

https://github.com/amatsuda/kaminari

## Contributing

1. Fork it ( https://github.com/ninjaconcept/butler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
