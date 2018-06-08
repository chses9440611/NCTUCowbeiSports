class ChangeNotNullToNull < ActiveRecord::Migration[5.2]
  def change
	  change_column_default(:events, :name, nil)
	  change_column_default(:events, :max_num_people, nil)
	  change_column_default(:events, :min_num_people, nil)
	  change_column_default(:events, :max_num_team, nil)
	  change_column_default(:events, :min_num_team, nil)
		

  end
end
