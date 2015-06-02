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