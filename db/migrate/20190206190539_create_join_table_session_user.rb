class CreateJoinTableSessionUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :sessions, :users do |t|
      t.index [:session_id, :user_id]
    end
  end
end
