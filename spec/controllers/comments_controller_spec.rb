# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:comment) { create(:comment) }
  let(:comment_params) do
    { content: build(:comment).content, post_id: build(:comment).post.id }
  end
  before { login_user create(:user) }

  shared_examples 'return 200 status code' do
    it { expect(response.status).to eq(200) }
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: comment.id } }
    it_behaves_like 'return 200 status code'
    it 'render :edit' do
      expect(response).to render_template :edit
    end
    it 'assigns @comment' do
      expect(assigns(:comment)).to eq comment
    end
  end

  describe 'PATCH #update' do
    before { patch :update, params: { id: comment.id, comment: comment_params } }
    it 'return 302 status code' do
      expect(response.status).to eq(302)
    end
    it 'assigns @comment' do
      expect(assigns(:comment)).to eq Comment.find(comment.id)
    end
    # it 'redirect pasts/index' do
    #   expect(response).to redirect_to post_path(comment.post)
    # end
  end

  describe 'DELETE #destroy' do
    before { @commnet_id = comment.id }
    it 'return 302 status code' do
      delete :destroy, params: { id: @commnet_id }
      expect(response.status).to eq(302)
    end
    it 'comment.conunt is decrease by 1' do
      expect { delete :destroy, params: { id: @commnet_id } }.to change { Comment.count }.by(-1)
    end
  end

  describe 'POST #create' do
    let(:create_comment) { post :create, params: { comment: comment_params } }
    it 'return 302 status code' do
      create_comment
      expect(response.status).to eq(302)
    end
    it 'comment.conunt is increase by 1' do
      expect { create_comment }.to change { Comment.count }.by(1)
    end
  end
end
