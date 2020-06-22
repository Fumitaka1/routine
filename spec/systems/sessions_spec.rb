# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'registration', type: :system do
  before do
    User.create!(name: 'sample_user',
                 email: 'sample_user@example.go',
                 password: 'password')
  end
  it 'ログインした後ログアウトする' do
    visit root_path
    click_on 'ログイン'
    fill_in 'user[email]', with: 'sample_user@example.go'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content 'ログインしました'

    click_on 'ログアウト'
    expect(page).to have_content 'ログアウトしました'
  end
end
