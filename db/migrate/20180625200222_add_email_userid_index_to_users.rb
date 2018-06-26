class AddEmailUseridIndexToUsers < ActiveRecord::Migration[5.2]
  def change
	  add_index :users, [:student_id], {unique: true}
  end
end
