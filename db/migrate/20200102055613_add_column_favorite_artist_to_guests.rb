class AddColumnFavoriteArtistToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :favorite_artist, :string 
  end
end
