# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post_obj) { create(:post) }
  let(:user) { create(:user) }
  let(:post_params) { attributes_for(:post) }

  shared_examples 'return 200 status code' do
    it { expect(response.status).to eq(200) }
  end

  describe 'GET #index' do
    before do
      get :index
    end
    it_behaves_like 'return 200 status code'
    it 'render :index' do
      expect(response).to render_template :index
    end
    it 'assigns @posts' do
      create_list(:post, 100)
      expect(assigns(:posts)).to match Post.paginate(page: 1, per_page: 20)
    end
  end

  describe 'POST #create' do
    let(:create_post) { post :create, params: { post: post_params } }
    before { login_user user }
    it 'return 302 status code' do
      create_post
      expect(response.status).to eq(302)
    end
    it 'redirect pasts/show' do
      create_post
      expect(response).to redirect_to post_path Post.last.id
    end
    it 'post.conunt is increase by 1' do
      expect { create_post }.to change { Post.count }.by(1)
    end
  end

  describe 'GET #new' do
    before do
      login_user user
      get :new
    end
    it_behaves_like 'return 200 status code'
    it 'render :new' do
      expect(response).to render_template :new
    end
    it 'assigns empty @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'GET #edit' do
    before do
      login_user user
      get :edit, params: { id: post_obj.id }
    end
    it_behaves_like 'return 200 status code'
    it 'render :edit' do
      expect(response).to render_template :edit
    end
    it 'assigns @post' do
      expect(assigns(:post)).to eq post_obj
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: post_obj.id } }
    it_behaves_like 'return 200 status code'
    it 'render :show' do
      expect(response).to render_template :show
    end
    it 'assigns @post' do
      expect(assigns(:post)).to eq post_obj
    end
    it 'assigns empty @comment' do
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe 'PATCH #update' do
    before do
      login_user user
      patch :update, params: { id: post_obj.id, post: post_params }
    end
    it 'return 302 status code' do
      expect(response.status).to eq(302)
    end
    it 'assigns @post' do
      expect(assigns(:post)).to eq Post.find(post_obj.id)
    end
  end

  describe 'DELETE #destroy' do
    before do
      login_user user
      @post_id = post_obj
    end
    it 'return 302 status code' do
      delete :destroy, params: { id: @post_id }
      expect(response.status).to eq(302)
    end
    it 'redirect pasts/index' do
      delete :destroy, params: { id: @post_id }
      expect(response).to redirect_to '/posts'
    end
    it 'post.conunt is decrease by 1' do
      expect { delete :destroy, params: { id: @post_id } }.to change { Post.count }.by(-1)
    end
  end
end
