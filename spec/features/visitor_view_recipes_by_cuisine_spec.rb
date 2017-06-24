require 'rails_helper'

feature 'Visitor view recipes by cuisine' do

  scenario 'from home page' do
    # cria os dados necessários previamente
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: 'Sobremesa',
                          cuisine: cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    # simula a ação do usuário
    visit root_path
    click_on cuisine.name

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: cuisine.name)
    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('li', text: recipe.recipe_type)
    expect(page).to have_css('li', text: recipe.cuisine.name)
    expect(page).to have_css('li', text: recipe.difficulty)
    expect(page).to have_css('li', text: "#{recipe.cook_time} minutos")
  end

  scenario 'and view only cuisine recipes' do
    # cria os dados necessários previamente
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: 'Sobremesa',
                          cuisine: brazilian_cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    italian_cuisine = Cuisine.create(name: 'Italiana')
    italian_recipe = Recipe.create(title: 'Macarrão Carbonara', recipe_type: 'Prato Principal',
                                  cuisine: italian_cuisine, difficulty: 'Difícil',
                                  cook_time: 30, ingredients: 'Massa, ovos, bacon',
                                  method: 'Frite o bacon; Cozinhe a massa ate ficar al dent; Misture os ovos e o bacon a massa ainda quente;')
    # simula a ação do usuário
    visit root_path
    click_on italian_cuisine.name

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: italian_recipe.title)
    expect(page).to have_css('li', text: italian_recipe.recipe_type)
    expect(page).to have_css('li', text: italian_recipe.cuisine.name)
    expect(page).to have_css('li', text: italian_recipe.difficulty)
    expect(page).to have_css('li', text: "#{italian_recipe.cook_time} minutos")
  end

  scenario 'and cuisine has no recipe' do
    # cria os dados necessários previamente
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: 'Sobremesa',
                          cuisine: brazilian_cuisine, difficulty: 'Médio',
                          cook_time: 60,
                          ingredients: 'Farinha, açucar, cenoura',
                          method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    italian_cuisine = Cuisine.create(name: 'Italiana')
    # simula a ação do usuário
    visit root_path
    click_on italian_cuisine.name

    # expectativas do usuário após a ação
    expect(page).not_to have_content(recipe.title)
    expect(page).to have_content('Nenhuma receita encontrada para este tipo de cozinha')
  end
end
