class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :avatar
      t.text :information
      t.string :address
      t.string :fullname

      t.timestamps
    end
  end
end
