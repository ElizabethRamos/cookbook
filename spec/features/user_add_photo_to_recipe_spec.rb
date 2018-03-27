require 'rails_helper'

feature 'Owner add photo to recipe' do
  scenario 'sucessfully' do
    # cria os dados
    User.create(email: 'eliza@campus.com', password: '12345678')
    Cuisine.create(name: 'Arabe')
    RecipeType.create(name: 'Entrada')

    # simula a acao
    visit root_path

    click_on 'Login'
    fill_in 'Email', with: 'eliza@campus.com'
    fill_in 'Senha', with: '12345678'
    click_on 'Enviar'

    click_on 'Enviar uma receita'

    fill_in 'Título', with: 'Tabule'
    select 'Arabe', from: 'Cozinha'
    select 'Entrada', from: 'Tipo da Receita'
    fill_in 'Dificuldade', with: 'Fácil'
    fill_in 'Tempo de Preparo', with: '45'
    fill_in 'Ingredientes', with: "Trigo para quibe, cebola,
    tomate picado, azeite, salsinha"
    fill_in 'Como Preparar', with: "Misturar tudo e servir. Adicione
    limão a gosto."
    attach_file('Foto da receita',
                Rails.root.join('spec', 'support', 'images', 'tabule.jpg'))
    click_on 'Enviar'

    # expectativas
    expect(page).to have_css('h4', text: 'Tabule')
    expect(page).to have_css('h5', text: 'Detalhes:')
    expect(page).to have_css('p', text: 'Entrada')
    expect(page).to have_css('p', text: 'Arabe')
    expect(page).to have_css('p', text: 'Fácil')
    expect(page).to have_css('p', text: '45 minutos')
    expect(page).to have_css('h5', text: 'Ingredientes')
    expect(page).to have_css('p', text: "Trigo para quibe, cebola, \
tomate picado, azeite, salsinha")
    expect(page).to have_css('h5', text: 'Como Preparar')
    expect(page).to have_css('p', text:  "Misturar tudo e servir. Adicione \
limão a gosto.")
    expect(page).to have_css("img[src*='tabule.jpg']")
  end
end
