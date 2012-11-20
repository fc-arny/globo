# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
Sap::Store.create([
		{name: 'GloboMarket', is_disabled: false, order_pos: 1},
		{name: 'Азбука Вкуса', is_disabled: false, order_pos: 2},
		{name: 'Аллые Паруса', is_disabled: false, order_pos: 3},
		{name: 'Перекресток', is_disabled: false, order_pos: 4},
])
Sap::Good.create([
		{name:'Сникерс 100г.', description: 'Не тормози - сникерсНИ', is_approved: true},
		{name:'Марс 100г.', description: 'Попробывав раз - ешь и сейчас', is_approved: true},
		{name:'Порошок Tide.', description: 'Тогда мыы идем к Вам', is_approved: true}
])
