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
        name = gets.strip
        puts "How old is the guest? "
        age = gets.strip 
        puts "Who is the guest seeing? "
        list_artists
        artist = gets.strip
        puts "What show is the guest attending? "
        list_shows
        show = gets.strip 
    end 

    def list_artists
        artist_array = Artist.all.map { |artist| artist.name }
        puts 
        puts "Options: "
        puts 
        artist_array.each do |artist| 
            puts artist 
        end 
    end 

    def list_shows 
        Show.all
    end 
end 

