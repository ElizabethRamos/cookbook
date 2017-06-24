cuisine = Cuisine.create(name: 'Brasileira')

Recipe.create(title: 'Bolo de cenoura', recipe_type: 'Sobremesa',
                      cuisine: cuisine, difficulty: 'Médio',
                      cook_time: 60,
                      ingredients: 'Farinha, açucar, cenoura',
                      method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

Recipe.create(title: 'Feijoada', recipe_type: 'Prato Principal',
                      cuisine: cuisine, difficulty: 'Difícil',
                      cook_time: 90)











# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
