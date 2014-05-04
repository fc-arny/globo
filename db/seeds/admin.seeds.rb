require File.expand_path('../../../components/sap/core/app/models/sap', __FILE__)
# Sap::User.create(name: 'Arthur Shcheglov', login: 'arthur.shcheglov@gmail.com', password: 'shcheglov', role: 'admin', phone: '79091553336')

Sap::Category.create([
  {id: 1500, name: 'Предложения', url: 'offers', order_pos: 1500, show_in_menu: false},
    {id: 1501, name: 'Нужное', url: 'need', parent_id: 1500, show_in_menu: false},
    {id: 1502, name: 'Полезное', url: 'useful', parent_id: 1500, show_in_menu: false},
    {id: 1503, name: 'Скидки', url: 'sales', parent_id: 1500, show_in_menu: false}])