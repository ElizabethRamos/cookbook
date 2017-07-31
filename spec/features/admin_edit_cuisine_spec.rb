require 'rails_helper'

feature 'User update recipe' do
  scenario 'successfully' do
    # cria os dados necessários
    Cuisine.create(name: 'Brasileira')

    visit root_path

    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Nome', with: 'Baiana'

    click_on 'Enviar'

    expect(page).to have_content('Baiana')
  end

  scenario 'and all fields must be filled' do
    Cuisine.create(name: 'Brasileira')

    visit root_path

    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Nome', with: ''

    click_on 'Enviar'

    expect(page).to have_content("Você deve informar todos os dados do \
tipo da cozinha")
  end

  scenario 'and have not duplicated cuisine name' do
    Cuisine.create(name: 'Italiana')
    Cuisine.create(name: 'Baiana')

    visit root_path
    click_on 'Italiana'
    click_on 'Editar'

    fill_in 'Nome', with: 'Baiana'

    click_on 'Enviar'

    expect(page).to have_content('Ja existe esse nome de cozinha')
  end
end
