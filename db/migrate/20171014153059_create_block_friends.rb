class CreateBlockFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :block_friends do |t|
      t.string :state_before
      t.integer :account_id
      t.integer :blocked_id

      t.timestamps
    end
  end
end
