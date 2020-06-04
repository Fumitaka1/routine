require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    before { get :home }
    it 'return 200 status code' do
      expect(response.status).to eq(200)
    end
    it 'render :home' do
      expect(response).to render_template :home
    end
  end
end
