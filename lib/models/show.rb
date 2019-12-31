class Show < ActiveRecord::Base
    has_many :guests
    has_many :artists, through: :guests 
end 
