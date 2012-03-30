class CreateClientHashes < ActiveRecord::Migration
  def change
    create_table :client_hashes do |t|
      t.integer :client_id
      t.string :text
      t.integer :counter

      t.timestamps
    end
  end
end
