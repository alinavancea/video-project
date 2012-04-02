class CreateConnectionHashesComments < ActiveRecord::Migration
  
  def change
        create_table :hashes_comments, :id => false do |t|
            t.integer :client_hash_id
            t.integer :comment_id
        end
    end
  end
