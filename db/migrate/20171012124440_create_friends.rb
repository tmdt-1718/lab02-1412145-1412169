class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :state_friendship
      t.integer :account_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
