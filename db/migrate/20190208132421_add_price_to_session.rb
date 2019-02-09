class AddPriceToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :price, :integer
  end
end
