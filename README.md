![Doublesing Logo](https://cdn.rawgit.com/AnthonySuper/Doublesing/master/assets/logo-opt.svg)

![Build Status](https://travis-ci.org/AnthonySuper/Doublesing.svg)](https://travis-ci.org/AnthonySuper/Doublesing)


![Code Climate](https://codeclimate.com/github/AnthonySuper/Doublesing/badges/gpa.svg)](https://codeclimate.com/github/AnthonySuper/Doublesing)

Doublesing is a wiki markup language based on TeX. 
It's very simple and extremely flexible. 
You can register your own tags (including over-riding builtin ones) to suit your needs, effectively allowing a custom dialect to be built with just ruby objects.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'doublesing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doublesing

## Usage

First, you must always call `Doublesing.setup!`. 
This registers pre-built handlers.

Then, register your own handlers, like so:
```ruby
  # will now delegate \tag{arg} to the class Tag
  # it will call Tag.new with the array of arguments pased to the block,
  # then .to_s to get the resulting HTML
  Doublesing.register("tag", Tag)
```

Then, to parse something, simply:
```ruby
  Doublesing.parse("\\tag{this is a tag}")
```

Run `rake specification` to generate a .pdf with the full spec.
Note: You gotta have PDFLatex installed for that to work.
## Contributing

1. Fork it ( https://github.com/AnthonySuper/Doublesing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
