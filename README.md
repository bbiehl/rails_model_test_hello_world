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
## Create the User Model with attributes for first and last name.
```
$ rails g scaffold user first_name:string last_name:string
$ rails db:migrate
== 20190413161138 CreateModels: migrating =====================================
-- create_table(:models)
   -> 0.0011s
== 20190413161138 CreateModels: migrated (0.0013s) ============================
```
## Write a failing User test.
```ruby
# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#full_name' do
    it 'concatenates first and last name' do
      user = User.new(first_name: 'Kenny', last_name: 'Loggins')
      expect(user.full_name).to eq('Kenny Loggins')
    end
  end
end
```
```
$ rspec spec/models/user_spec.rb
F

Failures:

  1) User#full_name concatenates first and last name
     Failure/Error: expect(user.full_name).to eq('Kenny Loggins')

     NoMethodError:
       undefined method `full_name' for #<User:0x00007f86621715e8>
     # ./spec/models/user_spec.rb:7:in `block (3 levels) in <top (required)>'

Finished in 0.00807 seconds (files took 1.13 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/models/user_spec.rb:5 # User#full_name concatenates first and last name
```
This fails because there is no `full_name` method defined.

## Get the test to pass
```ruby
# app/models/user.rb

class User < ApplicationRecord
  def full_name
    "#{first_name} #{last_name}"
  end
end
```
```
$ rspec spec/models/user_spec.rb
.

Finished in 0.00987 seconds (files took 1.23 seconds to load)
1 example, 0 failures
```
