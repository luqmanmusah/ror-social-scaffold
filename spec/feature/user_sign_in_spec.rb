require 'rails_helper'
RSpec.describe 'Create new User proccess', type: :system do
  it 'User SIgn in' do
    user1 = User.create(email: 'musah@gmail.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_text('Sign in')
  end
end
