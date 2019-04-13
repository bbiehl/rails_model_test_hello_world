# README

## Versions and Setup
```
$ ruby -v
ruby 2.6.1p33 (2019-01-30 revision 66950) [x86_64-darwin18]
```
```
$  rails -v
Rails 5.2.3
```
>Using special template I created to speed up dev process.
```ruby
# ~/rtfb_template.rb

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
```
Generate app with 'no test unit' and my template.
```
$ rails new rails_model_test_hello_world -T -m ~/rtfb_template.rb
$ cd rails_model_test_hello_world
$ rails g rspec:install
Running via Spring preloader in process 72571
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
```
