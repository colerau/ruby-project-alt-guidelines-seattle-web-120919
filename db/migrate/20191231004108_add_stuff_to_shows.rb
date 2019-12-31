class AddStuffToShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :venue_name
      t.string :venue_city
      t.string :date
    end 
  end
end
