class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :client_hash_id
      t.text :text

      t.timestamps
    end
  end
end
