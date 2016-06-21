require 'rails_helper'

feature 'Sign_in', :devise do

  let(:user) {create(:user)}

  before(:each) do
    logout(:user)
  end

  scenario 'user can not sign in if not registered' do
    signin('invalid@example.com','invalidpass')
    expect(page).to have_content('Invalid Email')
  end

  scenario 'user can sign in if valid credentials' do
    signin(user.email,user.password)

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'user can not sign in if invalid email' do
    signin('invalidemail@example.com',user.password)

    expect(page).to have_content 'Invalid Email'
  end

  scenario 'user can not sign in if invalid password' do
    signin(user.email, 'invalidpassword')

    expect(page).to have_content 'Invalid Email'
  end

end