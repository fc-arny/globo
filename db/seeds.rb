# encoding: UTF-8

connection = ActiveRecord::Base.connection

# Regions
Sap::Region.delete_all
Sap::Region.create([
    {id:1, name: 'Москва', state: 'active', description: 'Работа идет полным ходом'},
    {id:2, name: 'Киев', state: 'progress', description: 'Пока в планах'}
])

# Stores
Sap::Store.delete_all
Sap::Store.create([
		#{id:1,name: 'GloboMarket', is_disabled: false, order_pos: 1, region_id: 1},
		{id:2,name: 'Азбука Вкуса', is_disabled: false, order_pos: 2, region_id: 1},
		{id:3,name: 'Аллые Паруса', is_disabled: false, order_pos: 3, region_id: 1},
		{id:4,name: 'Перекресток', is_disabled: false, order_pos: 4, region_id: 1},
])
# Categories
Sap::Category.delete_all
Sap::Category.create([
    {id:1,name: 'Алкогольные напитки'},
    {id:2,name: 'Пиво', parent_id: 1},
    {id:3,name: 'Вино', parent_id: 1},
    {id:4,name: 'Крепкие напитки', parent_id: 1},
    {id:5,name: 'Овощи и Фрукты'},
    {id:6,name: 'Овощи', parent_id: 5},
    {id:7,name: 'Фрукты', parent_id: 5},
    {id:8,name: 'Орехи', parent_id: 5},
    {id:9,name: 'Сухофрукты', parent_id: 5},
    {id:10,name: 'Мясо и Рыба'},
    {id:11,name: 'Колбаса и колбасные изделия', parent_id: 10},
    {id:12,name: 'Рыба и море продукты', parent_id: 10},
    {id:13,name: 'Икра', parent_id: 10},
    {id:14,name: 'Мясные закуски', parent_id: 10},
])

# Goods
Sap::Good.delete_all
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
])
connection.execute('ALTER SEQUENCE sap.goods_id_seq MINVALUE 10000 START 10000 RESTART 10000;')

# Good -> Category
Sap::CategoryGood.create([
    {category_id:1,good_id:1},
    {category_id:2,good_id:1},
])

# GoodLists
Sap::GoodList.delete_all
Sap::GoodList.create([
    {good_id: 1, price: 25.09, store_id: 2},
    {good_id: 2, price: 27.97, store_id: 2},
    {good_id: 3, price: 45.09, store_id: 2},
    {good_id: 4, price: 25.09, store_id: 2},
    {good_id: 5, price: 15.09, store_id: 2},
    {good_id: 6, price: 5.09, store_id: 2},
    {good_id: 7, price: 7.09, store_id: 2},
    {good_id: 8, price: 4.09, store_id: 2},
    {good_id: 9, price: 85.09, store_id: 2},
    {good_id: 10, price: 25.09, store_id: 2},
    {good_id: 11, price: 15.09, store_id: 2},
    {good_id: 12, price: 95.09, store_id: 2},

    {good_id: 1, price: 27.09, store_id: 3},
    {good_id: 2, price: 29.00, store_id: 3},
    {good_id: 10, price: 47.09, store_id: 3},
])
#------------------
# Create users
#------------------

Sap::User.delete_all

# Customer
Sap::Customer.delete_all
customer = Sap::Customer.new do |c|

  # Create user
  c.user = Sap::User.new do |user|

    # Email is login for customer
    user.login = 'user'
    user.name  = c.name = 'Пользователь'

    # Set Random password and Salt
    user.salt = ApplicationHelper::get_random_string
    user.password = user.hash_password('user')

    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
  end
  c.phone = '02020202021'
end
customer.save!

# Admin
Sap::Admin.delete_all
admin = Sap::Admin.new do |a|

  # Create user
  a.user = Sap::User.new do |user|

    # Email is login for customer
    user.login = 'admin'
    user.name  = 'Администратор'

    # Set Random password and Salt
    user.salt = ApplicationHelper::get_random_string
    user.password = user.hash_password('admin')

    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
  end
  a.name = 'Админитратор'
end
admin.save!

# Manager
Sap::Manager.delete_all
manager = Sap::Manager.new do |m|

  # Create user
  m.user = Sap::User.new do |user|

    # Email is login for customer
    user.login = 'manager'
    user.name  = 'Менаджер'
    # Set Random password and Salt
    user.salt = ApplicationHelper::get_random_string
    user.password = user.hash_password('manager')

    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
  end
  m.store_id = 2 # Azbuka Vkusa
  m.last_name = 'Ivanov'
  m.first_name = 'Denis'
end
manager.save!


