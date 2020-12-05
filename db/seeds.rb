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
               lng: '76.9261569',
               lat: '43.2358143')
Address.create(street: 'Kabanbay batyr',
               house_number: 54,
               zip_code: '010000',
               city_id: 1,
               lng: '76.9321963',
               lat: '43.2376415')
Address.create(street: 'Kabanbay batyr',
               house_number: 55,
               zip_code: '010000',
               city_id: 1,
               lng: '76.9262267',
               lat: '43.241287')
Restaurant.create(name: 'Iftar',
                  cuisine: 'Uighur',
                  status: 'confirmed',
                  avatar: 'https://www.shutterstock.com/ru/image-photo/restaurant-chilling-out-classy-lifestyle-reserved-507639565',
                  description: 'Best food in the Earth',
                  contacts: '[24233423, 24334234]')
Restaurant.create(name: 'Tubeteika',
                  cuisine: 'Kazakh',
                  status: 'confirmed',
                  avatar: 'https://image.shutterstock.com/image-photo/group-happy-friends-having-breakfast-260nw-1201677928.jpg',
                  description: 'Best food in the Kazakhstan',
                  contacts: '[23d234423, 4243]')
Restaurant.create(name: 'KFC',
                  cuisine: 'Fast food',
                  status: 'confirmed',
                  avatar: 'https://upload.wikimedia.org/wikipedia/ru/b/bf/KFC_logo.svg',
                  description: 'Best food in US',
                  contacts: '[23464423, 5464]')

Restaurant.create(name: 'Burger King',
                  cuisine: 'Fast food',
                  status: 'confirmed',
                  avatar: 'https://media-cdn.tripadvisor.com/media/photo-s/11/0f/6d/9c/burger-king.jpg',
                  description: 'Better than KFC',
                  contacts: '[23464423, 5464]')
Branch.create(restaurant_id: 1, address_id: 1) # 1
Admin.create(name: 'Saddam', surname: 'Master')
User.create(email: 'admin@wastezerofood.com',
            password: '12345',
            admin_id: 1)
User.create(email: 'iftar@wastezerofood.com',
            password: '12345',
            restaurant_id: 1)
User.create(email: 'tubeteika@wastezerofood.com',
            password: '12345',
            restaurant_id: 2)
User.create(email: 'kfc@wastezerofood.com',
            password: '12345',
            restaurant_id: 3)
User.create(email: 'burgerking@wastezerofood.com',
            password: '12345',
            restaurant_id: 4)

Branch.create(restaurant_id: 1, address_id: 2) # 2
Branch.create(restaurant_id: 2, address_id: 3) # 3
Branch.create(restaurant_id: 2, address_id: 1) # 4
Branch.create(restaurant_id: 3, address_id: 2) # 5
Branch.create(restaurant_id: 4, address_id: 3) # 6
Branch.create(restaurant_id: 3, address_id: 3) # 7
Food.create(name: "Lagman",
            description: "With beef",
            ingredients: "Beef, ukrop, etc.",
            price: 1800,
            cuisine: "Western",
            # type: "1",
            image: "https://4-cooc.com/wp-content/uploads/2018/9/lagman-in-a-slow-cooker-pork-cooking-recipe-with-a_1.jpg",
            restaurant_id: 1,
            created_at: DateTime.now()) # 1
Food.create(name: "Plov",
            description: "with rice",
            ingredients: "rice, beef, carrot",
            price: 1800,
            cuisine: "Uzbek",
            # type: "1",
            image: "https://ist1.objorka.com/img0001/18/118_0134bxr_2961_6hi.jpg",
            restaurant_id: 2,
            created_at: DateTime.now()) # 2
Food.create(name: "Twister",
            description: "small",
            ingredients: "chicken, salad",
            price: 1800,
            cuisine: "KFC",
            # type: "1",
            image: "https://d12n9cpx6835mo.cloudfront.net/Twister_web_thumb.jpg?v=131.8",
            restaurant_id: 3,
            created_at: DateTime.now()) # 3
Food.create(name: "Whopper",
            description: "not so healthy",
            ingredients: "beef, salad",
            price: 1800,
            cuisine: "Fast food",
            # type: "1",
            image: "https://www.thesun.co.uk/wp-content/uploads/2019/12/DD-COMP-WHOPPER.jpg",
            restaurant_id: 4,
            created_at: DateTime.now()) # 4
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
             discount_price: 500,
             status: "CREATED")
Order.create(branch_id: 2,
             food_id: 1,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 900,
             status: "CREATED")
Order.create(branch_id: 4,
             food_id: 2,
             client_id: nil,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 700,
             status: "CREATED")
Order.create(branch_id: 3,
             food_id: 2,
             client_id: nil,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 200,
             status: "CREATED")
Order.create(branch_id: 7,
             food_id: 3,
             client_id: nil,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 400,
             status: "CREATED")
Order.create(branch_id: 5,
             food_id: 3,
             client_id: nil,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 350,
             status: "CREATED")
Order.create(branch_id: 6,
             food_id: 4,
             client_id: nil,
             expires_at: DateTime.now().next_day(30),
             deadline: DateTime.now().next_day(30),
             discount_price: 440,
             status: "CREATED")