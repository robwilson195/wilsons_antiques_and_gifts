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

## The project brief

#### MVP
- The inventory should track mass-produced products, including a name, description, stock quantity, buying cost, and selling price.
- The inventory should track manufacturers, including a name and any other appropriate details.
- A separate inventory should track antiques currently in store, including name, description, paid price and objective selling price.
- This second inventory will also track the auction at which the item was acquired, the date it took place and the venue in which it was held.
- Users will be able to see a list of auctions.
- The shop will be able to sell both gifts and antiques, adjusting the quantity of gifts as appropriate and removing antiques once sold.
- Users will be able to create and remove new bulk stock items, antiques, manufacturers and auctions.
- Show an inventory page, listing all the details for all the products in stock split over two tables to distinguish between gifts and antiques.
- As well as showing stock quantity as a number, the app should visually highlight "low stock" and "out of stock" items to the user.

#### Possible Extensions
- Calculate the markup on items in the store, and display it in the inventory
- Filter the inventory lists by manufacturer/auction. 
- Categorise both gifts and antiques by category/type which the user can then filter the main inventory by.
- Add finance channel to monitor money total and react to sales.
