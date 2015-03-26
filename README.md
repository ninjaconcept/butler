# Butler

The butler serves you assets, get it?

The butler bundles together various gems and assets suitable for rapid development across NC apps.

Currently, the butler provides these gems:

- "sass", [">= 3.2.0", "< 3.5"]
- "bootstrap-sass", '~> 3.3.3'
- "haml-rails", '~> 0.8'
- "jquery-rails", '~> 4.0.3'
- "jquery-ui-rails", '~> 5.0.3'
- "jquery-fileupload-rails", '~> 0.4.4'
- 'momentjs-rails', '~> 2.9.0'
- 'bootstrap3-datetimepicker-rails', '~> 3.1.3'
- 'font-awesome-rails', '~> 4.3.0'
- 'bourbon', '~> 3.2.4'
- 'cocoon', '~> 1.2.6'
- 'simple_form', '~> 3.1.0'
- 'kaminari', '~> 0.16.3'

	The butler also provides custom designs for Kaminari. See Kaminari README for 	details.

- 'rails-i18n', '~> 4.0.4'

Additionally, the Butler provides javascript files,

- jquery.autogrow (https://plugins.jquery.com/autogrow/)
- clndr (http://kylestetz.github.io/CLNDR/)
- json3 (https://github.com/bestiejs/json3)
- underscore
- bootstrap-markdown (http://github.com/toopay/bootstrap-markdown)
- marked (https://github.com/chjj/marked)

Note: more js files are being imported through gems declared above.

Finally, the Butler provides some images for you to use in your app. Some of
these images are used in the admin scaffold (See below), and therefore it would
make sense to override them in `app/images/butler/myimage.svg`. An example is brand,
which is supposed to stand for your brand.



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

Use as follows:

```rails g butler:admin_scaffold MODEL ATTRIBUTES```

For instance,

```rails g butler:admin_scaffold Post title:string content:text```


## Contributing

1. Fork it ( https://github.com/ninjaconcept/butler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
