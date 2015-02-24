# Rake::Camel

Rake task name shortener with camelic rule.

## Installation

Add this line to your application's Gemfile:

    gem 'rake-camel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake-camel

## Usage

In your Rakefile.

    require 'rake-camel'
    Rake::Camel.rule()

    task 'myGreatTask' do |t|
    end

Then you can shorten your task.

    $ rake mGT

## Example

Camelcase task can be shorten.

    task 'somethingGreatTask' do |t|
        puts t.name
    end

To be

    $ rake sGT

Namespace is also shortable.

    namespace :something do
        task :good:task do |t|
            puts t.name
        end
    end

To be

    $ rake sGT

But ambiguous task name cannot execute.

    task 'somethingGreatTask' do |t|
        puts t.name
    end

    task 'something:good:task' do |t|
        puts t.name
    end

Then

    $ rake somethingGreatTask => ok
    $ rake somethingGreatT => ok
    $ rake sGoT => ok
    $ rake someGT #=> fail
    $ rake sGT #=> fail

## Contributing

1. Fork it ( https://github.com/mattak/rake-camel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
