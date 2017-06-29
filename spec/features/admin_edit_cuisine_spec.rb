require 'rails_helper'

feature 'User update recipe' do
  scenario 'successfully' do
    #cria os dados necessários
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    visit root_path
    
    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Nome', with: 'Baiana'

    click_on 'Enviar'

    expect(page).to have_content('Baiana')
  end
end
