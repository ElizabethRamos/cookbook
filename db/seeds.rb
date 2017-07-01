cuisine_names = ['Brasileira', 'Francesa', 'Alemã']
cuisine_names.each do |cuisine_name|
    Cuisine.create(name: cuisine_name)
end
brazilian_cuisine = Cuisine.find_by(name: 'Brasileira')

recipe_type_names = ['Sobremesa', 'Entrada', 'Almoço', 'Café da manhã']
recipe_type_names.each do |recipe_type_name|
    RecipeType.create(name: recipe_type_name)
end
desert = RecipeType.find_by(name: 'Sobremesa')
entree = RecipeType.find_by(name: 'Entrada')

recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: desert,
                       cuisine: brazilian_cuisine, difficulty: 'Médio',
                       cook_time: 60,
                       ingredients: 'Farinha, açucar, cenoura',
                       method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

another_recipe = Recipe.create(title: 'Salada de cenoura', recipe_type: entree,
                       cuisine: brazilian_cuisine, difficulty: 'Facil',
                       cook_time: 60,
                       ingredients: 'Cenoura e legumes',
                       method: 'Cozinhe a cenoura, misture com os legumes')
