# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create(name: 'Kazakhstan',
               code: 'KZ')
City.create(name: 'Almaty',
            country_id: 1)
Address.create(street: 'Kabanbay batyr',
               house_number: 53,
               zip_code: '010000',
               city_id: 1,
               lng: '55.09128237331451',
               lat: '75.40278211938335')
Address.create(street: 'Kabanbay batyr',
               house_number: 54,
               zip_code: '010000',
               city_id: 1,
               lng: '55.09128237331451',
               lat: '75.40078211938335')
Address.create(street: 'Kabanbay batyr',
               house_number: 55,
               zip_code: '010000',
               city_id: 1,
               lng: '55.09127150474298',
               lat: '75.40077937989315')
Restaurant.create(name: 'Iftar',
                  cuisine: 'Uighur',
                  status: 'confirmed',
                  avatar: 'some-link',
                  description: 'Best food in the Earth',
                  contacts: '[23423, 234234]')
Branch.create(restaurant_id: 1, address_id: 1)
Admin.create(name: 'Saddam', surname: 'Master')
User.create(email: 'admin@wastezerofood.com',
            password: '12345',
            admin_id: 1)
User.create(email: 'restaurant_iftar@wastezerofood.com',
            password: '12345',
            restaurant_id: 1)

Branch.create(restaurant_id: 1, address_id: 2)
Branch.create(restaurant_id: 1, address_id: 3)
Food.create(name: "food",
            description: "some food",
            ingredients: "some ingredients",
            price: 1800,
            cuisine: "fast food",
            # type: "1",
            image: "some_link",
            restaurant_id: 1,
            created_at: DateTime.now())
# Admin.create(name: 'Saddam', surname: 'Master')
#
User.create(email: 'client1@wastezerofood.com',
            password: '12345',
            client_id: 1)
Client.create(name: 'Nurs',
              address_id: 1)

Order.create(branch_id: 1,
             food_id: 1,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 1000)
Order.create(branch_id: 2,
             food_id: 1,
             client_id: nil,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 1000)
Order.create(branch_id: 3,
             food_id: 1,
             client_id: nil,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 1000)
