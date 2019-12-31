class AddColumnVenueStateToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :venue_state, :string
  end
end
