# Crystal Flash Messages

[![Build Status](https://secure.travis-ci.org/christophemaximin/crystal_flash_messages.png)](https://travis-ci.org/christophemaximin/crystal_flash_messages)
[![Gem version](https://badge.fury.io/rb/crystal_flash_messages.png)](https://rubygems.org/gems/crystal_flash_messages)
[![Code Climate](https://codeclimate.com/github/christophemaximin/crystal_flash_messages/badges/gpa.svg)](https://codeclimate.com/github/christophemaximin/crystal_flash_messages)

A simple Rails view helper which displays one or more HTML `div`s with the `flash` messages.

## Install

**Crystal Error Messages**'s installation is pretty standard, add the following line to your `Gemfile`, then run `bundle install`:

```rb
gem 'crystal_flash_messages'
```

## What this gem does / How to use

This gem allows you to use a view helper called `crystal_flash_messages`.  
The wrapper `div` has [Bootstrap-friendly classes](http://getbootstrap.com/components/#alerts).  

Typically, you would add this to `app/views/layouts/application.html.erb`: 

```erb
<%= crystal_flash_messages %>
```

... which, for `flash[:error] = "Test"` would generate:

```html
<div class="alert alert-danger flash-error" role="alert">
  Test
</div>
```

Complete list of CSS classes generated for the helper:

```rb
# Smart
flash[:error] # => 'alert alert-danger flash-error'
flash[:notice] # => 'alert alert-info flash-notice'
# Basic
flash[:info] # => 'alert alert-info flash-info'
flash[:warning] # => 'alert alert-warning flash-warning'
flash[:foobar] # => 'alert alert-foobar flash-foobar'
```

## What this gem doesn't do

* Include any other dependencies
* Add any kind of behavior to the `flash` object itself
* Inject or execute any code in your controllers
* Anything not listed in "What this gem does"

## Optional configuration

You can change the default behavior of `crystal_flash_messages` by:

## Setting an initializer

Create a file `config/initializers/crystal_flash_messages.rb` and replace one of the defaults:

```rb
CrystalErrorMessages.configure do |config|
  # This string will be added to the list of HTML classes
  config.additional_classes = String.new
end
```

## Passing options when calling `crystal_flash_messages`

Examples:

```erb
<%= crystal_flash_messages(additional_classes: 'special-flash') %>
```

## Contributing

Don't hesitate to send a pull request!

## Testing

```sh
$ bundle install
$ bundle exec rspec spec/
```

## License

This software is distributed under the MIT License. Copyright (c) 2016, Christophe Maximin
