# little-shop-4

"Little Shop" is a fictitious e-commerce platform where users can register to place items
into a shopping cart and 'check out'. Merchant users can mark their items as 'fulfilled'; the last
merchant to mark items in an order as 'fulfilled' will automatically set the order status to
"shipped". Each user role will have access to some or all CRUD functionality for application models.


## Setup

Clone the repository down to the terminal.

Then run `bundle install` or `bundle exec install` in your terminal.

Now run `rake db:{drop,create,migrate,seed}`.

Run `rails s` in terminal to view locally.


## How to Run Tests

Testing is done with RSpec run `rspec` for all tests.
Run `rspec spec/features` for feature tests or run `rspec spec/models` for model tests.


## Contributors

This project was a collaboration between:

David Hardy https://github.com/davehardy632

Deonte Cooper https://github.com/djc00p

Zach Leach https://github.com/zachlp2016

Rob Stringer https://github.com/Mycobee


## Link To Our Site

https://radiant-stream-27785.herokuapp.com/
