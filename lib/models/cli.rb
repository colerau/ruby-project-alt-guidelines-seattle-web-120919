class CommandLineInterface 
    def greet 
        puts 
        puts 
        puts "Welcome to Guest List for Record Labels!"
    end 

    def main_menu
        puts 
        puts "Main Menu:"
        puts "(Type in the number of the option you want to select)"
        puts "1 - See a guest's upcoming show."
        puts "2 - Add a guest to a show."
        puts "3 - Update a guest's age."
        puts "4 - Remove a guest from their show."
    end 

    def get_user_input
        user_input = gets.strip
    end 

    def get_guest_show
        puts "Please enter the name of a guest: "
        users_guest = gets.strip

        # GETTING GUEST OBJECT AND NAME
        correct_guest = Guest.all.select { |guest| guest.name == users_guest } 
        displayed_guest_name = correct_guest.map do |guest|
            guest.name
        end[0]

        # GETTING ID'S FOR SHOW AND ARTIST
        correct_show_id = correct_guest.map do |guest| 
            guest.show_id
        end[0]

        correct_artist_id = correct_guest.map do |guest|
            guest.artist_id 
        end[0]

        # SHOW
        correct_show = Show.all.select { |show| show.id == correct_show_id } 
        
        displayed_venue_name = correct_show.map do |show| 
            show.venue_name 
        end[0]

        displayed_venue_city = correct_show.map do |show|
            show.venue_city 
        end[0]

        displayed_venue_state = correct_show.map do |show| 
            show.venue_state 
        end[0]

        displayed_venue_date = correct_show.map do |show|
            show.date 
        end[0]

        # ARTIST 
        correct_artist = Artist.all.select { |artist| artist.id == correct_artist_id } 

        displayed_artist_name = correct_artist.map do |artist|
            artist.name 
        end[0]

        # MESSAGE TO USER 
        puts
        puts "#{displayed_guest_name}'s upcoming show: "
        puts "Artist: #{displayed_artist_name}"
        puts "Venue: #{displayed_venue_name} - #{displayed_venue_city}, #{displayed_venue_state}"
        puts "Date: #{displayed_venue_date}"

        
    end 

    def add_guest
        puts "What is the guest's name? "
        new_guest_name = gets.strip
        puts "How old is the guest? "
        new_guest_age = gets.strip 
        puts "Who is the guest seeing? "
        list_artists
        new_guest_artist = gets.strip
        puts "What show is the guest attending? "
        list_shows
        new_guest_show = gets.strip 
        binding.pry
        Guest.create(
            name: new_guest_name, 
            age: new_guest_age, 
            artist_id: new_guest_artist.to_i, 
            show_id: new_guest_show.to_i)
        
        new_guest_artist_name = Artist.all.find { |artist| artist.id == new_guest_artist.to_i }
        new_guest_show_name = Show.all.find { |show| show.id == new_guest_show.to_i}
        
        puts 
        binding.pry
        puts "#{new_guest_name} is now seeing #{new_guest_artist_name.name} at #{new_guest_show_name.venue_name}!"
    end 

    # LIST ALL ARTISTS 
    def list_artists
        artist_array = Artist.all.map { |artist| artist.name }
        id_array = Artist.all.map { |artist| artist.id }
        puts 
        puts "Please type in the number next to the desired artist name: "
        puts 

        i = 0 
        while i < id_array.length do
            artist_array.each do |artist| 
                puts "#{id_array[i]}. #{artist}" 
                i += 1
            end
        end
    end 

    # LIST ALL SHOWS
    def list_shows    
        show_array = Show.all.map { |show| show.venue_name }
        id_array = Show.all.map { |show| show.id }
        puts 
        puts "Please type in the number next to the desired show: "
        puts 
        
        i = 0 
        while i < id_array.length do
            show_array.each do |show_name| 
                puts "#{id_array[i]}. #{show_name}" 
                i += 1
            end
        end
    end 

    def update_guest_age
        puts 
        puts "Please choose which guest to update: "
        list_guests 
        guest_id_input = gets.strip 
        correct_guest = Guest.find_by(id: guest_id_input.to_i)
        puts "What is the guest's new age?"
        new_age = gets.strip 
        correct_guest.update(age: new_age)
        puts "The guest's new age is #{correct_guest.age}."
    end 
    
    # LIST ALL GUESTS 
    def list_guests
        guest_array = Guest.all.map { |guest| guest.name }
        id_array = Guest.all.map { |guest| guest.id }
        puts "(Type in the number next to the desired guest)"
        puts 
        
        i = 0 
        while i < id_array.length do
            guest_array.each do |guest_name| 
                puts "#{id_array[i]}. #{guest_name}" 
                i += 1
            end
        end        
    end 

    def remove_guest 
        puts 
        puts "Which guest would you like to remove?"
        list_guests
        guest_id_input = gets.strip 
        correct_guest = Guest.find_by(id: guest_id_input.to_i)
        correct_guest.destroy
        puts "#{correct_guest.name} is now removed from their show."
    end 
end 