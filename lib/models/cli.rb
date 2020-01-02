class CommandLineInterface 
    def greet 
        puts 
        puts 
        puts
        puts 
        puts 
        puts 
        puts "Welcome to..."
    end 

    def main_menu
        puts 
        puts "_|_|_|                                    _|          _|        _|              _|".blue
        puts "_|        _|    _|    _|_|      _|_|_|  _|_|_|_|      _|              _|_|_|  _|_|_|_|".blue
        puts "_|  _|_|  _|    _|  _|_|_|_|  _|_|        _|          _|        _|  _|_|        _|".blue
        puts "_|    _|  _|    _|  _|            _|_|    _|          _|        _|      _|_|    _|".blue
        puts "  _|_|_|    _|_|_|    _|_|_|  _|_|_|        _|_|      _|_|_|_|  _|  _|_|_|        _|_|".blue
        puts 
        puts "Main Menu:"
        puts "(Type in the number of the option you want to select)"
        puts 
        puts "1 - View an artist's guest list." 
        puts "2 - See a guest's upcoming show."
        puts "3 - Add a guest to a show."
        puts "4 - Update a guest's info."
        puts "5 - Remove a guest from their show."
        puts 
        puts "6 - See an artist's upcoming shows."
        puts 
        puts "7 - See which guests are 21 or older."
        puts "8 - See the average age of guests for an artist."
        puts 
        puts "9 - Exit the program."
    end 

    def get_user_input
        puts
        user_input = gets.strip
    end 

    def get_guest_show 
        puts 
        puts "Please enter the name of a guest: "
        puts 
        users_guest = gets.strip

        # GETTING GUEST OBJECT AND NAME
        correct_guest = Guest.all.select { |guest| guest.name == users_guest } 
        displayed_guest_name = correct_guest.map do |guest|
            guest.name
        end[0]

        if correct_guest.length == 0 
            puts 
            puts "Sorry, that guest is not in our system.".blue
            puts 
            puts "Would you like to add them to a show?"
            puts "(Type \"y\" for yes, \"n\" for no.)"
            guest_addition_input = get_user_input
            if guest_addition_input == "y"
                # Repeated code from #add_guest :( 
                new_guest_name = users_guest
                puts 
                puts 
                puts "Ok, how old is the guest? "
                puts
                new_guest_age = gets.strip 
                puts 
                puts 
                puts "Who is the guest's favorite artist?"
                puts 
                new_guest_favorite_artist = gets.strip
                puts 
                puts 
                puts "Who is the guest seeing? "
                list_artists
                puts 
                new_guest_artist = gets.strip
                puts 
                puts 
                puts "What show is the guest attending? "
                list_shows
                puts 
                new_guest_show = gets.strip 
                Guest.create(
                    name: new_guest_name, 
                    age: new_guest_age, 
                    artist_id: new_guest_artist.to_i, 
                    show_id: new_guest_show.to_i,
                    favorite_artist: new_guest_favorite_artist)
                
                new_guest_artist_name = Artist.all.find { |artist| artist.id == new_guest_artist.to_i }
                new_guest_show_name = Show.all.find { |show| show.id == new_guest_show.to_i}
                
                puts 
                puts "#{new_guest_name} is now seeing #{new_guest_artist_name.name} at #{new_guest_show_name.venue_name}!".green
                # End repeated code from #add_guest 
            elsif guest_addition_input == "n"
                puts 
                puts "Ok!"
            end 
        elsif correct_guest.length > 0 
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
            puts "#{displayed_guest_name}'s upcoming show: ".green
            puts "Artist: #{displayed_artist_name}".green
            puts "Venue: #{displayed_venue_name} - #{displayed_venue_city}, #{displayed_venue_state}".green
            puts "Date: #{displayed_venue_date}".green
        end 
    end 

    def add_guest
        puts 
        puts 
        puts "What is the guest's name? "
        puts 
        new_guest_name = gets.strip
        puts 
        puts 
        puts "How old is the guest? "
        puts 
        new_guest_age = gets.strip 
        puts 
        puts 
        puts "Who is the guest's favorite artist?"
        puts 
        new_guest_favorite_artist = gets.strip
        puts 
        puts
        puts "Who is the guest seeing? "
        list_artists
        puts 
        new_guest_artist = gets.strip
        puts 
        puts 
        puts "Which show is the guest attending? "
        list_shows
        puts 
        new_guest_show = gets.strip 
        Guest.create(
            name: new_guest_name, 
            age: new_guest_age, 
            artist_id: new_guest_artist.to_i, 
            show_id: new_guest_show.to_i,
            favorite_artist: new_guest_favorite_artist)
        
        new_guest_artist_name = Artist.all.find { |artist| artist.id == new_guest_artist.to_i }
        new_guest_show_name = Show.all.find { |show| show.id == new_guest_show.to_i}
        
        puts 
        puts "#{new_guest_name} is now seeing #{new_guest_artist_name.name} at #{new_guest_show_name.venue_name}!".green
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
        puts 
        guest_id_input = gets.strip 
        correct_guest = Guest.find_by(id: guest_id_input.to_i)
        puts 
        puts "What is the guest's new age?"
        puts 
        new_age = gets.strip 
        correct_guest.update(age: new_age)
        puts 
        puts "The guest's new age is #{correct_guest.age}.".green
    end 

    def update_guest_favorite_artist 
        puts 
        puts "Please choose which guest to update: "
        list_guests 
        puts 
        guest_id_input = gets.strip 
        correct_guest = Guest.find_by(id: guest_id_input.to_i)
        puts 
        puts "What is the guest's new favorite artist?"
        puts 
        new_favorite_artist = gets.strip 
        correct_guest.update(favorite_artist: new_favorite_artist)
        puts 
        puts "The guest's new favorite artist is #{correct_guest.favorite_artist}.".green
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
        puts 
        guest_id_input = gets.strip 
        correct_guest = Guest.find_by(id: guest_id_input.to_i)
        correct_guest.destroy
        puts 
        puts "#{correct_guest.name} is now removed from their show.".green
    end 

    def get_artist_shows 
        puts 
        puts "Please enter the name of an artist: "
        puts 
        users_artist = gets.strip

        # if found, by default, correct_artist is an object not stored in an array
        correct_artist = Artist.all.find_by(name: users_artist)
        if !correct_artist 
            puts 
            puts "Sorry, that artist isn't in our system.".blue
        else
            show_array = correct_artist.shows
            if show_array.uniq.length == 1
                puts 
                puts "#{correct_artist.name}'s upcoming show: ".green
            elsif show_array.uniq.length > 1 
                puts 
                puts "#{correct_artist.name}'s upcoming shows: ".green
            end 
            i = 0 
            while i < show_array.uniq.length 
                puts "#{show_array[i].venue_name}".green
                i += 1
            end 
        end 
    end 

    # Gets all guests at, above, and under 21 years old
    def twenty_one
        puts 
        puts "Guests 21 or older:".green
        puts 
        guests_over_twenty_one = Guest.all.find_by_sql ["SELECT * FROM guests WHERE age >= ? ORDER BY age", 21]
        guest_over_twenty_one_name = guests_over_twenty_one.map { |guest| guest.name }
        guest_over_twenty_one_age = guests_over_twenty_one.map { |guest| guest.age }
        i = 0 
        while i < guests_over_twenty_one.length do 
            puts "#{guest_over_twenty_one_name[i]}, age #{guest_over_twenty_one_age[i]}".green
            i += 1
        end 
        puts
        puts 
        puts 
        puts 
        puts 
        puts "Guests under 21:".red
        puts 
        guests_under_twenty_one = Guest.all.find_by_sql ["SELECT * FROM guests WHERE age < ? ORDER BY age", 21]
        guest_under_twenty_one_name = guests_under_twenty_one.map { |guest| guest.name }
        guest_under_twenty_one_age = guests_under_twenty_one.map { |guest| guest.age }
        i = 0 
        while i < guests_under_twenty_one.length do 
            puts "#{guest_under_twenty_one_name[i]}, age #{guest_under_twenty_one_age[i]}".red
            i += 1
        end 
    end 

    # Gets the average age of guests for a specific artist 
    def average_age 
        puts 
        puts "Which artist? "
        puts 
        user_artist = gets.strip 
        correct_artist = Artist.all.find_by(name: user_artist)
        if !correct_artist
            puts 
            puts "Sorry, that artist is not in our system.".blue 
        else
            guests_array = correct_artist.guests
            ages_array = guests_array.map { |guest| guest.age }
            numerator = (ages_array.reduce(0) { |a, v| a + v }).to_f
            denominator = ages_array.length 
            average_age = numerator / denominator
            puts 
            puts "Average age of guests: #{average_age} years old.".green
        end 
    end 

    def get_guests_for_an_artist
        puts 
        puts "Which artist? "
        puts 
        user_artist = gets.strip 
        correct_artist = Artist.all.find_by(name: user_artist)
        if !correct_artist
            puts 
            puts "Sorry, that artist is not in our system.".blue
        else
            guests_array = correct_artist.guests
            names_array = guests_array.map { |guest| guest.name }
            
            puts
            puts "#{correct_artist.name}'s Guest List:".green

            i = 0 
            while i < names_array.length do
                puts names_array[i].green
                i += 1 
            end 
        end 
    end 
end 

