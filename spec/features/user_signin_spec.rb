require 'rails_helper'

 feature 'User sigin' do

   scenario 'sucessfully' do
     user = User.create(email: 'maria@campus.com', password: '12345678')

     visit root_path
     click_on 'Login'
     fill_in 'Email', with: 'maria@campus.com'
     fill_in 'Senha', with: '12345678'
     click_on 'Enviar'

     expect(current_path).to eq root_path
     expect(page).to have_content('Ola maria@campus.com')
     expect(page).not_to have_link('Login')
   end

   scenario 'User logout' do
     user = User.create(email: 'maria@campus.com', password: '12345678')

     visit root_path
     click_on 'Login'
     fill_in 'Email', with: 'maria@campus.com'
     fill_in 'Senha', with: '12345678'
     click_on 'Enviar'

     visit root_path
     click_on 'Logout'

     expect(page).to have_link('Login')
     expect(page).to_not have_link('Logout')
   end
end
