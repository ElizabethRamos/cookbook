require 'rails_helper'

feature 'Visitor view recipes by dificulty' do
  scenario 'successfully' do
    # simula a ação do usuário
    visit root_path

    # expectativas do usuário após a ação
    expect(page).to have_css('h3', text: 'Dificuldade - Fácil')
    expect(page).to have_css('h3', text: 'Dificuldade - Médio')
    expect(page).to have_css('h3', text: 'Dificuldade - Difícil')
  end

  scenario 'and click on one recipe' do
    user = User.create(email: 'maria@campus.com', password: '12345678')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio', cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: "Cozinhe a cenoura, corte em pedaços \
pequenos, misture com o restante dos ingredientes",
                           user: user)

    # simula a ação do usuário
    visit root_path
    within('.medium-box') do
      click_link recipe.title
    end

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('h3', text: 'Detalhes:')
    expect(page).to have_css('p', text: recipe.recipe_type.name)
    expect(page).to have_css('p', text: recipe.cuisine.name)
    expect(page).to have_css('p', text: recipe.difficulty)
    expect(page).to have_css('p', text: "#{recipe.cook_time} minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: recipe.ingredients)
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: recipe.method)
  end
end