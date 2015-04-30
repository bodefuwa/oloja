# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

# ...
Product.create!([{
  title: 'Ankara',
  description: 
    %(<p>
    	high quality, designs
      </p>),
  image_url: 'ankara.jpg',
  price: 89.95
},
{
  title: 'Gele',
  description: 
    %(<p>
    	latest head gear. Vibrant colors
      </p>),
  image_url: 'gele.jpg',
  price: 79.95
},
{
  title: 'Shoe and Bag',
  description: 
    %(<p>
        matching shoes and bags, leather, high quality
      </p>),
  image_url: 'shoe.jpg',
  price: 49.95
},
])