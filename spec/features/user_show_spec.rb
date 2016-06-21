require 'rails_helper'

feature 'User profile page', :devise do
  let(:current_user) {create(:user)}
  let(:other_user) {create(:user)}
  let(:admin) {create(:user, :admin)}

  before(:each) do
    logout(:user)
  end
  scenario 'user can see own profile' do
    signin(current_user.email,current_user.password)

    visit user_path(current_user)
    expect(page).to have_content(current_user.email)
  end

  scenario 'user cant see other users profiles' do
    signin(current_user.email,current_user.password)

    visit user_path(other_user)
    expect(page).to have_content('Access denied')
  end

  scenario 'admin can see other users profiles' do
    signin(admin.email,admin.password)

    visit user_path(other_user)
    expect(page).to have_content(other_user.email)
  end
end