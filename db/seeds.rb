# encoding: UTF-8

# Stores
Sap::Store.delete_all
Sap::Store.create([
		{id:1,name: 'GloboMarket', is_disabled: false, order_pos: 1},
		{id:2,name: 'Азбука Вкуса', is_disabled: false, order_pos: 2},
		{id:3,name: 'Аллые Паруса', is_disabled: false, order_pos: 3},
		{id:4,name: 'Перекресток', is_disabled: false, order_pos: 4},
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
		{id:8,name:'Виски Джек Дениелс, 1л.', description: 'Тогда мыы идем к Вам', is_approved: true}
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
])
