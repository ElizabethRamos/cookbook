require 'rails_helper'

feature 'User create recipes' do
  scenario 'user see your recipe' do
    user = User.create(email: 'tests@uol.com', password: '123456')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')
    appetizer_type = RecipeType.create(name: 'Entrada')

    recipe = Recipe.create(title: 'Bolodecenoura', recipe_type: appetizer_type,
                           cuisine: brazilian_cuisine, difficulty: 'Médio',
                           cook_time: 50,
                           ingredients: 'Farinha, açucar, cenoura',
                           method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                           user: user)

    user_login

    click_on 'Minhas receitas'

    expect(page).to have_css('h1', text: 'Bolodecenoura')
    expect(page).to have_link('Bolodecenoura', href: recipe_path(recipe))
  end

  def user_login
    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'tests@uol.com'
    fill_in 'Senha', with: '123456'
    click_on 'Enviar'
   end
end
