class AddStuffToGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :age 
      t.integer :artist_id
      t.integer :show_id
    end 
  end
end
