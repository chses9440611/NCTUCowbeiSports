class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, :null => false, :default => 'N/A'  
      t.date :event_date, :null => false
      t.integer :max_num_team, :null => false, :default => 0
      t.integer :min_num_team, :null => false, :default => 0
      t.integer :max_num_people, :null => false, :default => 0
      t.integer :min_num_people, :null => false, :default => 0

      t.timestamps
    end
  end
end
