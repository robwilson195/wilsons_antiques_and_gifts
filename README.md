# Wilson's Antiques and Gifts Inventory Management System

This is app is the product of an exercise designed to test one's skill with ruby and sql databases, using a web browser as an outlet for views.

The app is an inventory management system for a shop which stocks bot bulk goods, sourced from independant manufacturers, and individual antiques, sourced at various auctions. 

## Technology used
The app is inherently light on tech packages as it was intended to test the use of specific assets. To run the app, you will need:
- sinatra
- PostgreSql

To use the test files you will need:
- MiniTest

## How to run
To run the app, you will need to create a database on your local machine called 'antiques_shop':

`createdb antiques_shop`

Then run the file 'wilsons_antiques_and_gifts.sql', found within the 'db' folder on the new database:
  
`psql -d antiques_shop -f db/wilsons_antiques_and_gifts.sql`

To simulate the shop with a pre-existing inventory, run the 'seed.rb' file, found within the 'db' folder:

`ruby db/seed.rb`

