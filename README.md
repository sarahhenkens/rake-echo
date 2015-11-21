# Echo

Utilities to print things to the console.

## Usage

### Progress Bar

With `Echo::ProgressBar` you are able to show progress and estimated time to finish a long running process.
```ruby
require "rake-echo"

progressbar = Echo::ProgressBar.new(1000)

(1..1000).each do |i|
  progressbar.increment
  sleep(0.05)
end
```

This will print out a progress bar like this:
```
rake-echo ➤ ruby example.rb
 51.2% [##########__________] | ETA: 00:00:05

```

## Installation

You can install rake-echo using rubygems:

```bash
gem install rake-echo
```
