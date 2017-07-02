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
lunch = RecipeType.find_by(name: 'Almoço')
breakfast = RecipeType.find_by(name: 'Café da manhã')

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


recipe = Recipe.create(title: 'Pão na chapa', recipe_type: breakfast,
                       cuisine: brazilian_cuisine, difficulty: 'Médio',
                       cook_time: 60,
                       ingredients: 'Pão francês, manteiga',
                       method: 'Corte o pão, passe manteiga, bote na chapa e espere.')


recipe = Recipe.create(title: 'Bolo de chocolate', recipe_type: desert,
                       cuisine: brazilian_cuisine, difficulty: 'Médio',
                       cook_time: 60,
                       ingredients: 'Farinha, açucar, chocolate',
                       method: 'Corte o chocolate em pedaços pequenos, misture com o restante dos ingredientes')

recipe = Recipe.create(title: 'Feijoada', recipe_type: lunch,
                       cuisine: brazilian_cuisine, difficulty: 'Médio',
                       cook_time: 60,
                       ingredients: 'Feijão preto, linguiça, bacon, carne seca',
                       method: 'Cozinhe o feijão e as carnes, corte em pedaços pequenos, misture com o restante dos ingredientes')


recipe = Recipe.create(title: 'Salada de maionese', recipe_type: lunch,
                       cuisine: brazilian_cuisine, difficulty: 'Médio',
                       cook_time: 60,
                       ingredients: 'Cenoura, batata, maionese',
                       method: 'Cozinhe a cenoura e a batata, corte em pedaços pequenos, misture com o restante dos ingredientes')
