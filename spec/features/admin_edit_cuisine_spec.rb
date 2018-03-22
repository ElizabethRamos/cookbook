require 'rails_helper'

feature 'User update recipe' do
  scenario 'successfully' do
    # cria os dados necessários
    user = User.create(email: 'maria@campus.com', password: '12345678')
    Cuisine.create(name: 'Brasileira')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'maria@campus.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Enviar'
    

    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Nome', with: 'Baiana'

    click_on 'Enviar'

    expect(page).to have_content('Baiana')
  end

  scenario 'and all fields must be filled' do
    user = User.create(email: 'maria@campus.com', password: '12345678')
    Cuisine.create(name: 'Brasileira')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'maria@campus.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Enviar'

    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Nome', with: ''

    click_on 'Enviar'

    expect(page).to have_content("Você deve informar todos os dados do \
tipo da cozinha")
  end

  scenario 'and have not duplicated cuisine name' do
    user = User.create(email: 'maria@campus.com', password: '12345678')
    Cuisine.create(name: 'Italiana')
    Cuisine.create(name: 'Baiana')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'maria@campus.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Enviar'

    click_on 'Italiana'
    click_on 'Editar'

    fill_in 'Nome', with: 'Baiana'

    click_on 'Enviar'

    expect(page).to have_content('Ja existe esse nome de cozinha')
  end
end
