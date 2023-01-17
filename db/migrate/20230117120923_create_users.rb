class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :email_sent_count
      t.boolean :email_verified, default: false

      t.timestamps
    end
  end
end
