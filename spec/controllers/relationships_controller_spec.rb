# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  let(:user) { create(:user) }
  let(:relationship) { create(:relationship, follower: user) }
  before { login_user user }

  describe 'DELETE #destroy' do
    before { @relation_id = relationship.id }
    it 'return 302 status code' do
      delete :destroy, params: { id: @relation_id }
      expect(response.status).to eq(302)
    end
    it 'user.conunt is decrease by 1' do
      expect { delete :destroy, params: { id: @relation_id } }.to change { Relationship.count }.by(-1)
    end
  end

  describe 'POST #create' do
    let(:create_relation) { post :create, params: { followed_id: user.id } }
    it 'return 302 status code' do
      create_relation
      expect(response.status).to eq(302)
    end
    it 'user.conunt is increase by 1' do
      expect { create_relation }.to change { Relationship.count }.by(1)
    end
  end
end
