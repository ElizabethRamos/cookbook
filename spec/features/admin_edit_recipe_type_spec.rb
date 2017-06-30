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
end
