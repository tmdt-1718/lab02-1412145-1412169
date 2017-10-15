class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :account1_id
      t.integer :account2_id
      t.integer :last_message_id

      t.timestamps
    end
  end
end
