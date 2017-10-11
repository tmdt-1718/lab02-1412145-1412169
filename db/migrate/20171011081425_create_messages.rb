class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :conversation
      t.integer :account

      t.timestamps
    end
  end
end
