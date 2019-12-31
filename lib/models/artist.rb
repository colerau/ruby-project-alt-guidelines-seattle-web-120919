class Artist < ActiveRecord::Base
    has_many :guests 
    has_many :shows, through: :guests
end 
