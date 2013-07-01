# encoding: UTF-8

connection = ActiveRecord::Base.connection

# Clear DB
Sap::GoodItem.delete_all
Sap::Good.delete_all

Sap::Store.delete_all
Sap::Region.delete_all

Sap::Category.delete_all



Sap::User.delete_all
Sap::Admin.delete_all
Sap::Manager.delete_all


# Regions
Sap::Region.create([
                     {id:1, name: 'Москва', description: 'Работа идет полным ходом'},
                     {id:2, name: 'Киев', description: 'Пока в планах'}
                   ])

# Stores

Sap::Store.create([
                    #{id:1,name: 'GloboMarket', is_disabled: false, order_pos: 1, region_id: 1},
                    {id:2,name: 'Азбука Вкуса', order_pos: 2, url: 'azbuka-vkusa', region_id: 1},
                    {id:3,name: 'Аллые Паруса', order_pos: 3, url: 'allie-parusa',region_id: 1},
                    {id:4,name: 'Глобус Гурме', order_pos: 4, url: 'globus-gurme', region_id: 1},
                    {id:5,name: 'Перекресток', order_pos: 4, url: 'perekrestok', region_id: 1},
                  ])
# Categories
Sap::Category.create([
                       {id:1,name: 'Алкогольные напитки', url: 'alcohol'},
                       {id:2,name: 'Пиво', parent_id: 1, url: 'bear'},
                       {id:3,name: 'Вино', parent_id: 1,url: 'wine'},
                       {id:4,name: 'Крепкие напитки', parent_id: 1,url: 'strong'},
                       {id:5,name: 'Овощи и Фрукты', url: 'vegetables-and-fruits'},
                       {id:6,name: 'Овощи', parent_id: 5,url: 'vegetables'},
                       {id:7,name: 'Фрукты', parent_id: 5,url: 'fruits'},
                       {id:8,name: 'Орехи', parent_id: 5,url: 'nuts'},
                       {id:9,name: 'Сухофрукты', parent_id: 5, url: 'dried-fruit'},
                       {id:10,name: 'Мясо и Рыба',url: 'meat-and-fish'},
                       {id:11,name: 'Колбаса и колбасные изделия', parent_id: 10, url: 'sausages'},
                       {id:12,name: 'Рыба и море продукты', parent_id: 10, url: 'sea-foods'},
                       {id:13,name: 'Икра', parent_id: 10,url: 'caviar'},
                       {id:14,name: 'Мясные закуски', parent_id: 10,url: 'meat'},
                     ])

# Goods
Sap::Good.create([
                   {id:1,name:'Сникерс 100г.', description: 'Не тормози - сникерсНИ', is_approved: true},
                   {id:2,name:'Марс 100г.', description: 'Попробывав раз - ешь и сейчас', is_approved: true},
                   {id:3,name:'Порошок Tide.', description: 'Тогда мыы идем к Вам', is_approved: true},
                   {id:4,name:'Пиво клинское, 0.5л', description: 'Пиво клинское', is_approved: true},
                   {id:5,name:'Пиво Балтика 9, 0.5л', description: 'Пиво клинское', is_approved: true},
                   {id:6,name:'Водка столичная 0.5л', description: 'Водка столичная', is_approved: true},
                   {id:7,name:'Вино белое "Французкий завтрак" 1л.', description: 'Тогда мыы идем к Вам', is_approved: true},
                   {id:8,name:'Виски Джек Дениелс, 1л.', description: 'Тогда мыы идем к Вам', is_approved: true},
                   {id:9,name:'Молоко простоквашино 3.5%, 1л', description: 'Молочко', is_approved: true},
                   {id:10,name:'Молоко простоквашино 1.5%, 1л', description: 'Молочко', is_approved: true},
                   {id:11,name:'Молоко простоквашино 1.5%, 1л', description: 'Молочко', is_approved: true},
                   {id:12,name:'Молоко простоквашино топленое, 1л', description: 'Молочко', is_approved: true},
                   {id:13,name:'Абсент, 1л.', description: 'Тогда мыы идем к Вам', is_approved: true},
                   {id:14,name:'Мартини, 1л.', description: 'Тогда мыы идем к Вам', is_approved: true},
                   {id:15,name:'Ром Кубинский, 1л.', description: 'Тогда мыы идем к Вам', is_approved: true},
                   {id:16,name:'Коктель отвертка, 1л.', description: 'Тогда мыы идем к Вам', is_approved: true},
                   {id:17,name:'Ягуар, 0.5л.', description: 'Тогда мыы идем к Вам', is_approved: true},
                 ])
connection.execute('ALTER SEQUENCE sap_goods_id_seq MINVALUE 10000 START 10000 RESTART 10000;')

# Good -> Category
Sap::CategoryGood.create([
                           {category_id:1,good_id:1},
                           {category_id:2,good_id:1},
                           {category_id:1,good_id:2},
                           {category_id:4,good_id:6},
                           {category_id:4,good_id:7},
                           {category_id:4,good_id:8},
                           {category_id:4,good_id:13},
                           {category_id:4,good_id:14},
                           {category_id:4,good_id:15},
                           {category_id:4,good_id:16},
                           {category_id:4,good_id:17},
                         ])

# GoodLists
Sap::GoodItem.create([
                       {good_id: 1, price: 25.09, store_id: 2, good_id_in_store: 1},
                       {good_id: 2, price: 27.97, store_id: 2, good_id_in_store: 12},
                       {good_id: 3, price: 45.09, store_id: 2, good_id_in_store: 13},
                       {good_id: 4, price: 25.09, store_id: 2, good_id_in_store: 14},
                       {good_id: 5, price: 15.09, store_id: 2, good_id_in_store: 15},
                       {good_id: 6, price: 5.09, store_id: 2, good_id_in_store: 16},
                       {good_id: 7, price: 7.09, store_id: 2, good_id_in_store: 17},
                       {good_id: 8, price: 4.09, store_id: 2, good_id_in_store: 18},
                       {good_id: 9, price: 85.09, store_id: 2, good_id_in_store: 19},
                       {good_id: 10, price: 25.09, store_id: 2, good_id_in_store: 21},
                       {good_id: 11, price: 15.09, store_id: 2, good_id_in_store: 31},
                       {good_id: 12, price: 95.09, store_id: 2, good_id_in_store: 41},
                       {good_id: 13, price: 85.09, store_id: 2, good_id_in_store: 51},
                       {good_id: 14, price: 25.09, store_id: 2, good_id_in_store: 61},
                       {good_id: 15, price: 95.99, store_id: 2, good_id_in_store: 71},
                       {good_id: 16, price: 23.79, store_id: 2, good_id_in_store: 81},
                       {good_id: 17, price: 75.91, store_id: 2, good_id_in_store: 91},


                       {good_id: 1, price: 27.09, store_id: 3, good_id_in_store: 11},
                       {good_id: 2, price: 29.00, store_id: 3, good_id_in_store: 12},
                       {good_id: 10, price: 47.09, store_id: 3, good_id_in_store: 13},
                     ])
#------------------
# Create users
#------------------

# Customer
Sap::Customer.delete_all
customer = Sap::Customer.new do |c|

  # Create user
  c.user = Sap::User.new do |user|

    # Email is login for customer
    user.login = 'user'
    user.name  = c.name = 'Пользователь'

    # Set Random password and Salt
    user.salt = 'asd123'
    user.password = user.hash_password('user')

    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
  end
  c.phone = '02020202021'
end
customer.save!

# Admin
admin = Sap::Admin.new do |a|

  # Create user
  a.user = Sap::User.new do |user|

    # Email is login for customer
    user.login = 'admin'
    user.name  = 'Администратор'

    # Set Random password and Salt
    user.salt = 'qwe123'
    user.password = user.hash_password('admin')

    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
  end
  a.name = 'Админитратор'
end
admin.save!

# Manager
manager = Sap::Manager.new do |m|

  # Create user
  m.user = Sap::User.new do |user|

    # Email is login for customer
    user.login = 'manager'
    user.name  = 'Менаджер'
    # Set Random password and Salt
    user.salt = '123asd'
    user.password = user.hash_password('manager')

    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
  end
  m.store_id = 2 # Azbuka Vkusa
  m.last_name = 'Ivanov'
  m.first_name = 'Denis'
end
manager.save!


