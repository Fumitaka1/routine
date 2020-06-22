# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'relationship', type: :system do
  before do
    User.create!(name: 'sample_user',
                 email: 'sample_user@example.go',
                 password: 'password')

    create(:user)
  end
  it 'フォローしてフォローを外す' do
    visit root_path
    click_on 'ログイン'
    fill_in 'user[email]', with: 'sample_user@example.go'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'

    visit users_path(User.last)
    expect(page).to have_button 'フォローする'
    click_on 'フォローする'
    expect(page).to have_button 'フォローを取り消す'
    click_on 'フォローを取り消す'
  end
end
