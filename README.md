![Doublesing Logo](https://cdn.rawgit.com/AnthonySuper/Doublesing/master/assets/logo-opt.svg)

[![Build Status](https://travis-ci.org/AnthonySuper/Doublesing.svg)](https://travis-ci.org/AnthonySuper/Doublesing)
[![Test Coverage](https://codeclimate.com/github/AnthonySuper/Doublesing/badges/coverage.svg)](https://codeclimate.com/github/AnthonySuper/Doublesing)
[![Code Climate](https://codeclimate.com/github/AnthonySuper/Doublesing/badges/gpa.svg)](https://codeclimate.com/github/AnthonySuper/Doublesing)

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

Doublesing is a TeX-like language designed to be used for online markup.
It takes the relatively simple form of:
```
\BLOCK_ID[ARGUMENT][ARGUMENT][ARGUMENT]
```
Here, maybe a use case will help:

```
\bold[This text becomes bold!]
```
Becomes:
```
<b>This text becomes bold!</b>
```
You can have blocks that take multiple arguments:
```
\header[1][This is a header]
```

```
<h1>This is a header</h1>
```

Parsing this is easy:
```
Doublesing.setup! # Must call once, probably in an initializer
Doublesing.parse(str) #=> Processed HTML
```

Where it gets interesting is the fact that you can register your own block types.
A common use case of this might be to add site-specific functionality.
Let's say you're making a website about pictures of famous dogs.
You probably want your user to be able to reference dogs pretty quickly.
Well, with Doublesing, you can do something like:

```ruby
class DogFinder
  def initialize(args)
    @dog_name = args.first
    @body = args[1]
  end

  def find_dog
    dog = Dog.where(name: @dog_name).pluck(:id).first
    "/dogs/#{dog.id}"
  end

  def to_s
    "<a href=\"#{find_dog}\">#{@body.to_s}</a>"
  end
end
```
Then, register it:

```ruby
Doublesing.register("dog", DogFinder)
```

Now, assuming you're using Doublesing to parse comments, a user can say:
```
\dog[Rowlf][My favorite musical dog!]
```

To easily get a link to the page on the piano player of the Muppets.
Pretty neat, huh?

Run `rake specification` to generate a .pdf with the full specification of built-in blocks.

There aren't that many right now, but you're free to submit a pull request with one!
Note: You gotta have PDFLatex installed for that to work.
## Contributing

1. Fork it ( https://github.com/AnthonySuper/Doublesing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
