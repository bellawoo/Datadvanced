require './db/setup'
require './lib/all'

# How many users are there?
User.count

# What are the 5 most expensive items?
Item.order(price: :desc).limit(5)

# What's the cheapest electronics item?
# SELECT name FROM items WHERE category LIKE '%Electronics%' ORDER BY price ASC LIMIT 5;
Item.where("category Like '%Electronics'").order(price: :asc).limit(1)

# Who lives at "489 Fritsch Island"? Do they have another address?
user_id_for_Fritsch_Island = Address.where(street: '489 Fritsch Island').pluck(:user_id)
User.find(user_id_for_Fritsch_Island)
Address.where(user_id: 35)

# Correct Tevin Mitchell's New York zip code to 10108.
Tevin_id = User.where(first_name: 'Tevin', last_name: 'Mitchell').pluck(:id)
Tevin_zip = Address.where(user_id: Tevin_id, state: 'New York').pluck(:zip) #92202
Tevin = Address.find_by(zip: Tevin_zip)
Tevin.zip = 10108
Tevin.save
Tevin

# How much would it cost to buy one of each piece of jewelery?
Item.where("category LIKE '%Jewelery%'").sum(:price)
  # Kept getting following output: => #<BigDecimal:7fa724bcb218,'0.22626E3',18(36)>

# How many total items did we sell?
Order.sum(:quantity)

# How much was spent on health?
health_id_and_price = Item.where("category LIKE '%Health%'").pluck(:id, :price)
orders_under_health = Order.find_by(health_id_and_price)
sum(Item.price * Order.quantity)
 

orders = Order.pluck(:item_id, :quantity)
prices = Item.where("category LIKE '%Health%'").pluck(:id, :price)
sales = []
orders.each do |x, y|
# Iterate through every array in the orders array and match the array element at [0] with the arrays within the prices array at [0].
# If positive match, push both quantity and price into a third array.
# Write another function that would then multiply those two together.
# Push results out into a fourth array and then sum up each element with another function.
end

# Simulate buying an item by inserting a User for yourself and an Order for that User (do not include this in the figures above).
#   INSERT INTO users VALUES (null, 'Bella', 'Woo', 'woo.bella@gmail.com');
  
#   SELECT * FROM users WHERE first_name = 'Bella';
