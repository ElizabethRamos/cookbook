require 'rails_helper'

feature 'Visitor view only recent recipes on home page' do
  scenario 'successfully' do
    # cria os dados necessários
    old_recipe = create_recipe('Old Recipe')
    5.times { create_recipe('Another Recipes') }
    user = User.create(email: 'maria@campus.com', password: '12345678')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recent_recipe = Recipe.create(title: 'Bolo de cenoura',
                                  recipe_type: recipe_type,
                                  cuisine: cuisine, difficulty: 'Médio',
                                  ingredients: 'Cenoura, acucar, oleo e
                                  chocolate',
                                  method: 'Misturar tudo, bater e assar',
                                  cook_time: 60, user: user)

    # simula a ação do usuário
    visit root_path

    expect(page).to have_css('h1', text: recent_recipe.title)
    expect(page).to have_css('dt', text: recent_recipe.recipe_type.name)
    expect(page).to have_css('dt', text: recent_recipe.cuisine.name)
    expect(page).to have_css('dt', text: recent_recipe.difficulty)
    expect(page).to have_css('dt', text: "#{recent_recipe.cook_time} minutos")

    expect(page).not_to have_css('h1', text: old_recipe.title)
  end

  scenario 'and then view all the recipes' do
    # cria os dados necessários
    old_recipe = create_recipe('Old Recipe')
    6.times { create_recipe('Another Recipes') }
    user = User.create(email: 'maria@campus.com', password: '12345678')
    cuisine = Cuisine.create(name: 'Brasileira')
    another_cuisine = Cuisine.create(name: 'Italiana')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    another_recipe_type = RecipeType.create(name: 'Almoço')
    recent_recipe = Recipe.create(title: 'Bolo de cenoura',
                                  recipe_type: recipe_type,
                                  cuisine: cuisine, difficulty: 'Fácil',
                                  ingredients: 'Cenoura, acucar,
                                  oleo e chocolate',
                                  method: 'Misturar tudo, bater e assar',
                                  cook_time: 60, user: user)
    easy_recipe = Recipe.create(title: 'Brigadeiro',
                                  recipe_type: recipe_type,
                                  cuisine: cuisine, difficulty: 'Fácil',
                                  ingredients: 'Leite condensado, manteiga',
                                  method: 'Misturar tudo, levar ao fogo',
                                  cook_time: 60, user: user)
    medium_recipe = Recipe.create(title: 'Lasanha',
                                recipe_type: another_recipe_type,
                                cuisine: another_cuisine, difficulty: 'Médio',
                                ingredients: 'Carne moída, molho de tomate',
                                method: 'Misturar tudo, montar a lasanha',
                                cook_time: 60, user: user)

    # simula a ação do usuário
    visit root_path
    click_on 'Ver todas receitas'

    expect(page).to have_css('h1', text: recent_recipe.title)
    expect(page).to have_css('dt', text: recent_recipe.recipe_type.name)
    expect(page).to have_css('dt', text: recent_recipe.cuisine.name)
    expect(page).to have_css('dt', text: recent_recipe.difficulty)
    expect(page).to have_css('dt', text: "#{recent_recipe.cook_time} minutos")

    expect(page).to have_css('h1', text: old_recipe.title)
    expect(page).to have_css('dt', text: old_recipe.recipe_type.name)
    expect(page).to have_css('dt', text: old_recipe.cuisine.name)
    expect(page).to have_css('dt', text: old_recipe.difficulty)
    expect(page).to have_css('dt', text: "#{old_recipe.cook_time} minutos")

    expect(page).to have_css('h1', text: easy_recipe.title)
    expect(page).to have_css('dt', text: easy_recipe.recipe_type.name)
    expect(page).to have_css('dt', text: easy_recipe.cuisine.name)
    expect(page).to have_css('dt', text: easy_recipe.difficulty)
    expect(page).to have_css('dt', text: "#{easy_recipe.cook_time} minutos")

    expect(page).to have_css('h1', text: medium_recipe.title)
    expect(page).to have_css('dt', text: medium_recipe.recipe_type.name)
    expect(page).to have_css('dt', text: medium_recipe.cuisine.name)
    expect(page).to have_css('dt', text: medium_recipe.difficulty)
    expect(page).to have_css('dt', text: "#{medium_recipe.cook_time} minutos")
  end

  def create_recipe(recipe_name)
    user = User.create(email: 'maria@campus.com', password: '12345678')
    generic_cuisine = cuisine_create
    generic_type = RecipeType.create(name: 'Generic Recipe Type')
    Recipe.create(title: recipe_name, recipe_type: generic_type,
                  cuisine: generic_cuisine, difficulty: 'Facil',
                  ingredients: 'Ingredientes em lista',
                  method: 'Passo a passo do preparo',
                  cook_time: 60, user: user)
  end

  def cuisine_create
    @recipe ||= Cuisine.create(name: 'Generic Cuisine')
  end
end
