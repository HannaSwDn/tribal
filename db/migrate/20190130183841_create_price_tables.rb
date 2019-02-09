class CreatePriceTables < ActiveRecord::Migration[5.2]
  def change
    create_table :price_tables do |t|
			t.integer :trainee_1
			t.integer :trainee_2
      t.integer :trainee_3
      t.integer :trainee_4
      t.integer :trainee_5
      t.integer :trainee_6
      t.integer :trainee_7
      t.integer :trainee_8
      t.integer :price_point

      t.timestamps
    end
  end
end
