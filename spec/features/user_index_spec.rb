require 'rails_helper'

feature 'User index page' do
  let(:user) {create(:user, :admin)}
  scenario 'user sees own email address' do
      login_as(user, scope: :user)
      visit users_path
      expect(page).to have_content user.email
  end
end