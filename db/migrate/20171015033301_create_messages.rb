class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.integer :sender_id
      t.integer :conversation_id
      t.boolean :unread

      t.timestamps
    end
  end
end
