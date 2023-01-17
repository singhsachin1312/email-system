class CreateRemainders < ActiveRecord::Migration[6.1]
  def change
    create_table :remainders do |t|
      t.integer :number
      t.integer :remainder_type
      t.references :user

      t.timestamps
    end
  end
end
