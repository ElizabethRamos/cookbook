require 'rails_helper'

feature 'User update recipe' do
  scenario 'successfully' do
    #cria os dados necessários
    brazilian_cuisine = RecipeType.create(name: 'Sobremesa')

    visit root_path

    click_on 'Sobremesa'
    click_on 'Editar'

    fill_in 'Nome', with: 'Jantar'

    click_on 'Enviar'

    expect(page).to have_content('Jantar')
  end

scenario 'and all fields must be filled' do

  brazilian_cuisine = RecipeType.create(name: 'Sobremesa')

  visit root_path

  click_on 'Sobremesa'
  click_on 'Editar'

  fill_in 'Nome', with: ''

  click_on 'Enviar'

  expect(page).to have_content('Você deve informar todos os dados do novo tipo de receita')
 end
end
