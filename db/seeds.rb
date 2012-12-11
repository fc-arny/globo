# encoding: UTF-8

# Regions
Sap::Region.delete_all
Sap::Region.create([
    {id:1, name: 'Москва', state: 'active', descriptnio: 'Работа идет полным ходом'},
    {id:2, name: 'Киев', state: 'progress', descriptnio: 'Пока в планах'}
])

# Stores
Sap::Store.delete_all
Sap::Store.create([
		{id:1,name: 'GloboMarket', is_disabled: false, order_pos: 1},
		{id:2,name: 'Азбука Вкуса', is_disabled: false, order_pos: 2},
		{id:3,name: 'Аллые Паруса', is_disabled: false, order_pos: 3},
		{id:4,name: 'Перекресток', is_disabled: false, order_pos: 4},
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
		{name:'Сникерс 100г.', description: 'Не тормози - сникерсНИ', is_approved: true},
		{name:'Марс 100г.', description: 'Попробывав раз - ешь и сейчас', is_approved: true},
		{name:'Порошок Tide.', description: 'Тогда мыы идем к Вам', is_approved: true},
		{name:'Пиво клинское, 0.5л', description: 'Пиво клинское', is_approved: true},
		{name:'Пиво Балтика 9, 0.5л', description: 'Пиво клинское', is_approved: true},
		{name:'Водка столичная 0.5л', description: 'Водка столичная', is_approved: true},
		{name:'Вино белое "Французкий завтрак" 1л.', description: 'Тогда мыы идем к Вам', is_approved: true},
		{name:'Виски Джек Дениелс, 1л.', description: 'Тогда мыы идем к Вам', is_approved: true},
    {name:'Молоко простоквашино 3.5%, 1л', description: 'Молочко', is_approved: true},
    {name:'Молоко простоквашино 1.5%, 1л', description: 'Молочко', is_approved: true},
    {name:'Молоко простоквашино 1.5%, 1л', description: 'Молочко', is_approved: true},
    {name:'Молоко простоквашино топленое, 1л', description: 'Молочко', is_approved: true},
])


