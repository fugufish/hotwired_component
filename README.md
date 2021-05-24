# HotwiredComponent
HotwiredComponent establishes a pattern for working with [Hotwire](https://github.com/hotwired/hotwire-rails)
and [ViewComponent](https://viewcomponent.org/).


## Usage
`rails g hotwire_component:component My::Widget`

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'hotwired_component'
```

And then execute:
```bash
$ bundle
```

And run:

```bash
$ rails g hotwired_component:install
```


## Forms

HotwiredComponent adds it's own form helper, `hw_form_with` & `hw_form_for`. This helper may be used
to create standardized forms that are already set up to be used with Hotwire and Stimulus.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
