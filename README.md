# HotwiredComponent
HotwiredComponent adds Hotwired centered generators for Github's [ViewComponent](https://github.com/github/view_component) utilizing 
the side car method. Components generated using this gem will by convention also generate an `scss` file and Stimulus controller.
Components are class namespaced by their name, and by default every component has a stimulus controller.

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

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
