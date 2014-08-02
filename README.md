# DigiMoji

[![Build Status](https://travis-ci.org/melborne/digi_moji.svg)](https://travis-ci.org/melborne/digi_moji)

5x7 digital color words on your terminal.

## Installation

Add this line to your application's Gemfile:

    gem 'digi_moji'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install digi_moji

## Usage in your terminal

### new command

Try `digi_moji new` command with words:

    % digi_moji new RUBY

![sample1](https://github.com/melborne/digi_moji/raw/screenshot/sample1.png)

    % digi_moji new RUBY --fg=bg_red --bg=bg_yellow

![sample2](https://github.com/melborne/digi_moji/raw/screenshot/sample2.png)

    % digi_moji new RUBY --fg=red --bg=red_blink --cell='R'

![sample3](https://github.com/melborne/digi_moji/raw/screenshot/sample3.gif)

### time command

`digi_moji time` outputs current time:

![sample4](https://github.com/melborne/digi_moji/raw/screenshot/sample4.gif)

### timer command

`digi_moji timer` outputs count down timer:

![sample5](https://github.com/melborne/digi_moji/raw/screenshot/sample5.gif)

`digi_moji help` for more info.

## Usage as ruby script

```ruby
require 'digi_moji'

str = DigiMoji::String.new("HE", fg:'bg_green', bg:'bg_yellow')

puts str
puts
puts str + "LLO!"
puts
puts str.join("LP!", fg:'bg_red')
```

Output:

![sample6](https://github.com/melborne/digi_moji/raw/screenshot/sample6.png)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/digi_moji/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
