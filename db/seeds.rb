# Create default user
user = User.create! :email => 'example@example.com', :password => '123456', :password_confirmation => '123456'

# Create cuisines
cuisine_names = ['Brasileira', 'Francesa', 'Alemã']

cuisine_names.each do |cuisine_name|
    Cuisine.create(name: cuisine_name)
end
brazilian_cuisine = Cuisine.find_by(name: 'Brasileira')

# Create recipe types
recipe_type_names = ['Sobremesa', 'Entrada', 'Almoço', 'Café da manhã']
recipe_type_names.each do |recipe_type_name|
    RecipeType.create(name: recipe_type_name)
end
desert = RecipeType.find_by(name: 'Sobremesa')
entree = RecipeType.find_by(name: 'Entrada')
lunch = RecipeType.find_by(name: 'Almoço')
breakfast = RecipeType.find_by(name: 'Café da manhã')

# Create recipes
bolo = Recipe.create!(title: 'Bolo de cenoura', recipe_type: desert,
                       cuisine: brazilian_cuisine, difficulty: 'Fácil',
                       cook_time: 60,
                       ingredients: 'Farinha, açucar, cenoura',
                       method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                       user: user
                     )
bolo.update! photo: File.open(Rails.root.join('app', 'assets', 'images', 'bolo_de_cenoura.jpg'))

salada = Recipe.create!(title: 'Salada de cenoura', recipe_type: entree,
                       cuisine: brazilian_cuisine, difficulty: 'Fácil',
                       cook_time: 60,
                       ingredients: 'Cenoura e legumes',
                       method: 'Cozinhe a cenoura, misture com os legumes',
                     user: user)
salada.update! photo: File.open(Rails.root.join('app', 'assets', 'images', 'salada_de_cenoura.jpg'))

pao = Recipe.create!(title: 'Pão na chapa', recipe_type: breakfast,
                       cuisine: brazilian_cuisine, difficulty: 'Médio',
                       cook_time: 60,
                       ingredients: 'Pão francês, manteiga',
                       method: 'Corte o pão, passe manteiga, bote na chapa e espere.',user: user)
pao.update! photo: File.open(Rails.root.join('app', 'assets', 'images', 'pao_na_chapa.jpg'))

bolo_de_chocolate = Recipe.create!(title: 'Bolo de chocolate', recipe_type: desert,
                       cuisine: brazilian_cuisine, difficulty: 'Médio',
                       cook_time: 60,
                       ingredients: 'Farinha, açucar, chocolate',
                       method: 'Corte o chocolate em pedaços pequenos, misture com o restante dos ingredientes',user: user)
bolo_de_chocolate.update! photo: File.open(Rails.root.join('app', 'assets', 'images', 'bolo_de_chocolate.jpg'))

feijoada = Recipe.create!(title: 'Feijoada', recipe_type: lunch,
                       cuisine: brazilian_cuisine, difficulty: 'Difícil',
                       cook_time: 60,
                       ingredients: 'Feijão preto, linguiça, bacon, carne seca',
                       method: 'Cozinhe o feijão e as carnes, corte em pedaços pequenos, misture com o restante dos ingredientes',user: user)
feijoada.update! photo: File.open(Rails.root.join('app', 'assets', 'images', 'feijoada.jpg'))

salada_de_maionese = Recipe.create!(title: 'Salada de maionese', recipe_type: lunch,
                       cuisine: brazilian_cuisine, difficulty: 'Difícil',
                       cook_time: 60,
                       ingredients: 'Cenoura, batata, maionese',
                       method: 'Cozinhe a cenoura e a batata, corte em pedaços pequenos, misture com o restante dos ingredientes',user: user)
salada_de_maionese.update! photo: File.open(Rails.root.join('app', 'assets', 'images', 'salada_de_maionese.jpg'))
