Sap::Category.create([
  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 100, name: 'Выпечка', url: 'bakery', position: 1, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 104, name: 'cakes', url: 'cakes', position: 5, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 102, name: 'rolls-and-bagets', url: 'rolls-and-bagets', position: 2, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:28:21'},
    {id: 110, name: 'crumpets-pancakes-and-waffles-test-test-test', url: 'crumpets-pancakes-and-waffles', position: 4, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
    {id: 106, name: 'pies-and-tarts', url: 'pies-and-tarts', position: 6, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},

    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 101, name: 'Bread', url: 'bread', position: 3, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:06:42'},
      # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      {id: 116, name: 'brown-and-wholemeal-bread', url: 'brown-and-wholemeal-bread', position: 6, show_in_menu: true, images_id: nil, ancestry: '100/101', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
      {id: 111, name: 'White Bread', url: 'white-bread', position: 1, show_in_menu: true, images_id: nil, ancestry: '100/101', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
      {id: 112, name: 'Granary & Multigrain Bread', url: 'granary-and-multigrain-bread', position: 2, show_in_menu: true, images_id: nil, ancestry: '100/101', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
      {id: 113, name: 'Malted Bread', url: 'malted-bread', position: 3, show_in_menu: true, images_id: nil, ancestry: '100/101', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
      {id: 114, name: 'Flavoured Bread', url: 'flavoured-bread', position: 4, show_in_menu: true, images_id: nil, ancestry: '100/101', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
      {id: 115, name: 'Rye Bread', url: 'rye-bread', position: 5, show_in_menu: true, images_id: nil, ancestry: '100/101', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},

    {id: 105, name: 'fresh-desserts', url: 'fresh-desserts', position: 7, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
    {id: 108, name: 'scones-teacakes-and-buns', url: 'scones-teacakes-and-buns', position: 8, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
    {id: 107, name: 'small-cakes-and-cookiees', url: 'small-cakes-and-cookiees', position: 9, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
    {id: 109, name: 'croissants-pastries', url: 'croissants-pastries', position: 10, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-15 13:47:02'},
    {id: 103, name: 'speciality-and-ethic-breads', url: 'speciality-and-ethic-breads', position: 1, show_in_menu: true, images_id: nil, ancestry: '100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:28:21'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 200, name: 'Овощи и Фрукты', url: 'fruit-and-vegetables', position: 2, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 205, name: 'fresh-herbs', url: 'fresh-herbs', position: 6, show_in_menu: true, images_id: nil, ancestry: '200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:24'},
    {id: 204, name: 'prepares-vegetables-and-salads', url: 'prepares-vegetables-and-salads', position: 7, show_in_menu: true, images_id: nil, ancestry: '200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:24'},
    {id: 203, name: 'vegetables', url: 'vegetables', position: 1, show_in_menu: true, images_id: nil, ancestry: '200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 202, name: 'prepared-fruit', url: 'prepared-fruit', position: 2, show_in_menu: true, images_id: nil, ancestry: '200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 206, name: 'dried-fruit', url: 'dried-fruit', position: 3, show_in_menu: true, images_id: nil, ancestry: '200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 207, name: 'dried-vegetables', url: 'dried-vegetables', position: 4, show_in_menu: true, images_id: nil, ancestry: '200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 201, name: 'fruit', url: 'fruit', position: 5, show_in_menu: true, images_id: nil, ancestry: '200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 300, name: 'Молочные и Яйца', url: 'milk-and-eggs', position: 3, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 304, name: 'eggs', url: 'eggs', position: 4, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 306, name: 'cheese', url: 'cheese', position: 5, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 302, name: 'shelf-milk', url: 'shelf-milk', position: 1, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 301, name: 'fresh-milk', url: 'fresh-milk', position: 2, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 303, name: 'cream', url: 'cream', position: 3, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 307, name: 'yogurt', url: 'yogurt', position: 6, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 308, name: 'yogurt-and-milk-drinks', url: 'yogurt-and-milk-drinks', position: 7, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 309, name: 'chilled-desseerts', url: 'chilled-desseerts', position: 8, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 305, name: 'butter-and-spreads', url: 'butter-and-spreads', position: 9, show_in_menu: true, images_id: nil, ancestry: '300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},


  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 400, name: 'Мясо Рыба Птица', url: 'meat-fish-poultry', position: 4, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 401, name: 'fresh-meat', url: 'fresh-meat', position: 1, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 402, name: 'fresh-poultry', url: 'fresh-poultry', position: 2, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 404, name: 'fresh-and-prepared-fish', url: 'fresh-and-prepared-fish', position: 3, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 405, name: 'smoked-and-marinated-fish', url: 'smoked-and-marinated-fish', position: 4, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 406, name: 'pate', url: 'pate', position: 5, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 407, name: 'bacon', url: 'bacon', position: 6, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 408, name: 'sausages-and-burgers', url: 'sausages-and-burgers', position: 7, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 409, name: 'deli-meat', url: 'deli-meat', position: 8, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 403, name: 'cooked-prepared-meat-and-poultry', url: 'cooked-prepared-meat-and-poultry', position: 9, show_in_menu: true, images_id: nil, ancestry: '400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 500, name: 'Заморозка', url: 'frozen', position: 5, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 502, name: 'frozen-desserts-and-fruit', url: 'frozen-desserts-and-fruit', position: 1, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 503, name: 'frozen-meat', url: 'frozen-meat', position: 2, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 504, name: 'frozen-poultry', url: 'frozen-poultry', position: 3, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 505, name: 'frozen-fish-and-seafood', url: 'frozen-fish-and-seafood', position: 4, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 507, name: 'frozen-vegetables', url: 'frozen-vegetables', position: 5, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 508, name: 'frozen-pizza-and-breads', url: 'frozen-pizza-and-breads', position: 6, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 509, name: 'frozen-ready-meals', url: 'frozen-ready-meals', position: 7, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 510, name: 'frozen-vegetarian', url: 'frozen-vegetarian', position: 8, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 506, name: 'frozen-chips-and-potatoes', url: 'frozen-chips-and-potatoes', position: 9, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 501, name: 'ice-cream', url: 'ice-cream', position: 10, show_in_menu: true, images_id: nil, ancestry: '500', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 600, name: 'Кулинария', url: 'ready-meals', position: 6, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:26'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 608, name: 'dips-and-fillers', url: 'dips-and-fillers', position: 9, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 609, name: 'pies-and-quiches', url: 'pies-and-quiches', position: 1, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 611, name: 'sandwiches-and-wraps', url: 'sandwiches-and-wraps', position: 2, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 610, name: 'savoury-rolls-and-snacks', url: 'savoury-rolls-and-snacks', position: 3, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 607, name: 'fresh-soup', url: 'fresh-soup', position: 4, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 606, name: 'fresh-vegetarian-food', url: 'fresh-vegetarian-food', position: 5, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 605, name: 'fresh-pizza-and-chilled-bread', url: 'fresh-pizza-and-chilled-bread', position: 6, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 604, name: 'fresh-marinades-ans-sauces', url: 'fresh-marinades-ans-sauces', position: 7, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 603, name: 'fresh-meal', url: 'fresh-meal', position: 8, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 602, name: 'fresh-world-foods', url: 'fresh-world-foods', position: 10, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 601, name: 'fresh-pasta', url: 'fresh-pasta', position: 11, show_in_menu: true, images_id: nil, ancestry: '600', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 700, name: 'Консервы и Приправы', url: 'tin-jars-cooking', position: 7, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:30'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 704, name: 'tinned-beans', url: 'tinned-beans', position: 19, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:29'},
    {id: 703, name: 'herbs-and-spices', url: 'herbs-and-sspices', position: 1, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 702, name: 'salt-and-pepper', url: 'salt-and-pepper', position: 2, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 701, name: 'oils-and-vinegar', url: 'oils-and-vinegar', position: 3, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 715, name: 'pasta-sauce', url: 'pasta-sauce', position: 4, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 716, name: 'condiments', url: 'condiments', position: 5, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 717, name: 'jam-and-spreads', url: 'jam-and-spreads', position: 6, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 705, name: 'tinned-tomatoes-puree-and-passata', url: 'tinned-tomatoes-puree-and-passata', position: 7, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 718, name: 'curry-sauce-and-paste', url: 'curry-sauce-and-paste', position: 8, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 719, name: 'stock-sauce-mix-and-gravy', url: 'stock-sauce-mix-and-gravy', position: 9, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 714, name: 'marinades-and-sauces', url: 'marinades-and-sauces', position: 10, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 713, name: 'mayonnaise-and-dressings', url: 'mayonnaise-and-dressings', position: 11, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 712, name: 'pickles-and-marinated-vegetables', url: 'pickles-and-marinated-vegetables', position: 12, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 711, name: 'tinned-fruit', url: 'tinned-fruit', position: 13, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 710, name: 'tinned-meal-and-poultry', url: 'tinned-meal-and-poultry', position: 14, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:29'},
    {id: 709, name: 'tinned-pasta', url: 'tinned-pasta', position: 15, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:29'},
    {id: 708, name: 'tinned-soup', url: 'tinned-soup', position: 16, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:29'},
    {id: 707, name: 'tinned-fish', url: 'tinned-fish', position: 17, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:29'},
    {id: 706, name: 'tinned-vegetables', url: 'tinned-vegetables', position: 18, show_in_menu: true, images_id: nil, ancestry: '700', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:29'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 800, name: 'Бакалея', url: 'packets-and-cereals', position: 8, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 808, name: 'rice-pulses-and-grain', url: 'rice-pulses-and-grain', position: 2, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 810, name: 'stuffing-and-breadcrumbs', url: 'stuffing-and-breadcrumbs', position: 1, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 809, name: 'packet-soup', url: 'packet-soup', position: 3, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 811, name: 'desserts', url: 'desserts', position: 4, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 802, name: 'porridge-and-muesli', url: 'porridge-and-muesli', position: 5, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 803, name: 'cereal-bars', url: 'cereal-bars', position: 6, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 805, name: 'flour', url: 'flour', position: 7, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:13'},
    {id: 806, name: 'sugar-and-sweetener', url: 'sugar-and-sweetener', position: 8, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 807, name: 'pasta-end-noodles', url: 'pasta-end-noodles', position: 9, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 801, name: 'breakfast-cereals', url: 'breakfast-cereals', position: 11, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},
    {id: 804, name: 'home-baking', url: 'home-baking', position: 12, show_in_menu: true, images_id: nil, ancestry: '800', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 900, name: 'Кондитерские', url: 'snacks-and-sweets', position: 9, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 909, name: 'chocolate-bars-bags-and-multipacks', url: 'chocolate-bars-bags-and-multipacks', position: 1, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 907, name: 'mints-and-gum', url: 'mints-and-gum', position: 2, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 910, name: 'boxed-chocolate', url: 'boxed-chocolate', position: 3, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 904, name: 'snacks', url: 'snacks', position: 4, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 905, name: 'nuts-and-seeds', url: 'nuts-and-seeds', position: 5, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 906, name: 'crackers-and-crispbreads', url: 'crackers-and-crispbreads', position: 6, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 908, name: 'sweets', url: 'sweets', position: 7, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 901, name: 'chocolate-biscuits', url: 'chocolate-biscuits', position: 8, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 902, name: 'biscuites', url: 'biscuites', position: 9, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 903, name: 'crisps', url: 'crisps', position: 10, show_in_menu: true, images_id: nil, ancestry: '900', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 1000, name: 'Напитки', url: 'drinks', position: 10, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 1008, name: 'squash-and-cordials', url: 'squash-and-cordials', position: 1, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1010, name: 'longlife-juice-drinks', url: 'longlife-juice-drinks', position: 2, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1012, name: 'adult-drinks-and-mixers', url: 'adult-drinks-and-mixers', position: 3, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1013, name: 'beer', url: 'beer', position: 4, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1014, name: 'cider', url: 'cider', position: 5, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1015, name: 'white-wine', url: 'white-wine', position: 6, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1016, name: 'red-wine', url: 'red-wine', position: 7, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1017, name: 'rose-and-specialty-wine', url: 'rose-and-specialty-wine', position: 8, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1011, name: 'chilled-fruit-juice-and-smoothies', url: 'chilled-fruit-juice-and-smoothies', position: 9, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1021, name: 'gifts-and-cases', url: 'gifts-and-cases', position: 10, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1020, name: 'sherry-port-and-vermouth', url: 'sherry-port-and-vermouth', position: 11, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1019, name: 'spirits', url: 'spirits', position: 12, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1018, name: 'champagne-and-sparkling-wines', url: 'champagne-and-sparkling-wines', position: 13, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1001, name: 'ground-coffee', url: 'ground-coffee', position: 14, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1002, name: 'instant-coffee', url: 'instant-coffee', position: 15, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1003, name: 'tea', url: 'tea', position: 16, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1004, name: 'chocolate-and-malt-drinks', url: 'chocolate-and-malt-drinks', position: 17, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1005, name: 'mineral-water', url: 'mineral-water', position: 18, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1006, name: 'sports-and-energy-drinks', url: 'sports-and-energy-drinks', position: 19, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1007, name: 'fizzy-drinks', url: 'fizzy-drinks', position: 20, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1009, name: 'longlife-juice-drinks', url: 'longlife-juice-drinks', position: 21, show_in_menu: true, images_id: nil, ancestry: '1000', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 1100, name: 'Для дома', url: 'household', position: 11, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 1102, name: 'cleaning-accessories', url: 'cleaning-accessories', position: 1, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1101, name: 'household-cleaning', url: 'household-cleaning', position: 2, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1110, name: 'candles.firelighters-and-matches', url: 'candles-firelighters-and-matches', position: 3, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1103, name: 'dishwashing', url: 'dishwashing', position: 4, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1104, name: 'laundry', url: 'laundry', position: 5, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1112, name: 'batteries-films-and-blank-media', url: 'batteries-films-and-blank-media', position: 6, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1113, name: 'newsagent', url: 'newsagent', position: 7, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1114, name: 'stationery', url: 'stationery', position: 8, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1115, name: 'disposable-tableware', url: 'disposable-tableware', position: 9, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1105, name: 'air-freshener', url: 'air-freshener', position: 10, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1106, name: 'scented-oils-candles-pot-pourri', url: 'scented-oils.candles.pot-pourri', position: 11, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1107, name: 'party-accessories', url: 'party-accessories', position: 12, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1108, name: 'tissues-and-toilets-rols', url: 'tissues-and-toilets-rols', position: 13, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1109, name: 'light-bulbs', url: 'light-bulbs', position: 14, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1111, name: 'tobacconist', url: 'tobacconist', position: 15, show_in_menu: true, images_id: nil, ancestry: '1100', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 1200, name: 'Для животных', url: 'pets', position: 12, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 1204, name: 'other-pet-food', url: 'other-pet-food', position: 1, show_in_menu: true, images_id: nil, ancestry: '1200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1203, name: 'pet-care', url: 'pet-care', position: 2, show_in_menu: true, images_id: nil, ancestry: '1200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1201, name: 'dog-food', url: 'dog-food', position: 3, show_in_menu: true, images_id: nil, ancestry: '1200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1202, name: 'cat-food', url: 'cat-food', position: 4, show_in_menu: true, images_id: nil, ancestry: '1200', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 1300, name: 'Детям', url: 'baby', position: 13, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 1305, name: 'baby-milk-and-drinks', url: 'baby-milk-and-drinks', position: 1, show_in_menu: true, images_id: nil, ancestry: '1300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1306, name: 'baby-food-and-snacks', url: 'baby-food-and-snacks', position: 2, show_in_menu: true, images_id: nil, ancestry: '1300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1304, name: 'baby-feeding', url: 'baby-feeding', position: 3, show_in_menu: true, images_id: nil, ancestry: '1300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1303, name: 'baby-care', url: 'baby-care', position: 4, show_in_menu: true, images_id: nil, ancestry: '1300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1302, name: 'nappy-accessories', url: 'nappy-accessories', position: 5, show_in_menu: true, images_id: nil, ancestry: '1300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1301, name: 'nappies', url: 'nappies', position: 6, show_in_menu: true, images_id: nil, ancestry: '1300', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},

  # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  {id: 1400, name: 'Гигиена', url: 'health-and-beauty', position: 14, show_in_menu: true, images_id: nil, ancestry: nil, created_at: '2014-02-26 22:27:08', updated_at: '2014-06-17 21:25:31'},
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    {id: 1401, name: 'bath-shower-soap', url: 'bath-shower-soap', position: 1, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1402, name: 'shampoo-and-conditioner', url: 'shampoo-and-conditioner', position: 2, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1403, name: 'hair-care', url: 'hair-care', position: 3, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1422, name: 'vitamins-and-supplemets', url: 'vitamins-and-supplemets', position: 4, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1421, name: 'general-health', url: 'general-health', position: 5, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1420, name: 'first-aid', url: 'first-aid', position: 6, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1419, name: 'weight-loss', url: 'weight-loss', position: 7, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1418, name: 'suncare-and-bronzing', url: 'suncare-and-bronzing', position: 8, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1417, name: 'sexual-health', url: 'sexual-health', position: 9, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1416, name: 'womens-health', url: 'womens-health', position: 10, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1415, name: 'feminine', url: 'feminine', position: 11, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1414, name: 'dental', url: 'dental', position: 12, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1409, name: 'lip-products', url: 'lip-products', position: 13, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1404, name: 'fragrance', url: 'fragrance', position: 14, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1405, name: 'deodorants-and-body-spray', url: 'deodorants-and-body-spray', position: 15, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1406, name: 'body-care', url: 'body-care', position: 16, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1407, name: 'make-up', url: 'make-up', position: 17, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1408, name: 'eye-make-up', url: 'eye-make-up', position: 18, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1410, name: 'nail-care', url: 'nail-care', position: 19, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1411, name: 'facial-care', url: 'facial-care', position: 20, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1412, name: 'hair-removal', url: 'hair-removal', position: 21, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1413, name: 'mens-toiletries', url: 'mens-toiletries', position: 22, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1424, name: 'beauty-gifts-sets', url: 'beauty-gifts-sets', position: 23, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'},
    {id: 1423, name: 'medicine', url: 'medicine', position: 24, show_in_menu: true, images_id: nil, ancestry: '1400', created_at: '2014-02-26 22:27:08', updated_at: '2014-06-04 18:06:14'}
])