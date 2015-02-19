# Butler

The butler serves you assets, get it?

Currently the Butler bundles stylesheets suitable for admin interfaces.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'butler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install butler

## Usage

Append the following line to your app/assets/stylesheets/application.css file:

/*= require butler */

That's it.

# Admin Scaffold Usage
Generates admin controller with admin layout and with specific views for all model attributes.

### Usage

```rails g admin_scaffold MODEL ATTRIBUTES```

### Example

```rails g admin_scaffold Post title:string content:text```

## Used to build current app

### Articles

`rails g admin_scaffold Article title:string category_id:integer topic_id:integer status:string is_top:boolean is_trend:boolean content_short:text content:text image:string image_content:string publish_start:datetime publish_end:datetime updated_by:integer created_by:integer slug:string`


### Events

`rails g admin_scaffold Event title:string rubric_id:integer status:string image_id:integer content_short:text content:text location_name:string location_street:string location_zip:string location_city:string location_geo:string contact_name:string contact_street:string contact_zip:string contact_city:string contact_email:string contact_homepage:text is_top:boolean published_at:datetime created_by:integer updated_by:integer`


### Categories

`rails g admin_scaffold Category name:string is_active:boolean position:integer`


### Admin Users

`rails g admin_scaffold User id:integer email:string nickname:string name:string`

### Pages
`rails g admin_scaffold Page title:string content:text status:string`

## Contributing

1. Fork it ( https://github.com/ninjaconcept/butler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
