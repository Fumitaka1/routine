require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:comment) { create(:comment) }
  let(:comment_params) do
    { content: build(:comment).content, post_id: build(:comment).post.id }
  end
  before { login_user user }

  describe 'DELETE #destroy' do
    before { @user_id = user.id }
    it 'return 302 status code' do
      delete :destroy, params: { id: @user_id }
      expect(response.status).to eq(302)
    end
    it 'user.conunt is decrease by 1' do
      expect{ delete :destroy, params: { id: @user_id } }.to change{ Relationship.count }.by(-1)
    end
  end

  describe 'POST #create' do
    let(:create_relation) { post :create, params: { id: user.id } }
    it 'return 302 status code' do
      create_relation
      expect(response.status).to eq(302)
    end
    it 'user.conunt is increase by 1' do
      expect{ create_relation }.to change{ Relationship.count }.by(1)
    end
  end
end
