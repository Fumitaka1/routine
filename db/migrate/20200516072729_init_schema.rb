# frozen_string_literal: true

class InitSchema < ActiveRecord::Migration[5.2]
  def up
    create_table 'comments', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string 'content', null: false
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.bigint 'post_id'
      t.bigint 'user_id'
      t.index ['post_id'], name: 'index_comments_on_post_id'
      t.index ['user_id'], name: 'index_comments_on_user_id'
    end
    create_table 'posts', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string 'title', null: false
      t.text 'content', null: false
      t.string 'image'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.bigint 'user_id'
      t.index ['created_at'], name: 'index_posts_on_user_id_and_created_at'
      t.index ['user_id'], name: 'index_posts_on_user_id'
    end
    create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string 'name', default: '', null: false
      t.string 'email', default: '', null: false
      t.string 'encrypted_password', default: '', null: false
      t.string 'reset_password_token'
      t.datetime 'reset_password_sent_at'
      t.datetime 'remember_created_at'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.index ['email'], name: 'index_users_on_email', unique: true
      t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, 'The initial migration is not revertable'
  end
end
