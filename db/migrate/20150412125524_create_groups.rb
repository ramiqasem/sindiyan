class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
		t.string :name
		t.string :description
		t.integer :capacity
		t.string :passcode
      	t.timestamps null: false

    end
  end
end
