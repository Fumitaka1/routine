# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    before do
      login_user user
      get :index
    end
    it 'return 200 status code' do
      expect(response.status).to eq(200)
    end
    it 'render :index' do
      expect(response).to render_template :index
    end
  end
  describe 'POST #create' do
  end
end
