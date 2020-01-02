require_relative '../config/environment'

# I'm aware this is a global variable but I believe there's no reason it shouldn't be. 
CLI = CommandLineInterface.new

def run_program 
    response = "1"
    while response != "2"
        CLI.greet
        CLI.main_menu
        input = get_user_input 
        if input == "1" 
            CLI.get_guest_show
        elsif input == "2"
            CLI.add_guest
        elsif input == "3"
            puts "What would you like to update?"
            puts "(Type in the number corresponding to your choice)"
            puts 
            puts "1 - Guest's age"
            puts "2 - Guest's favorite artist"
            update_guest_info_input = get_user_input
            if update_guest_info_input == "1"
                CLI.update_guest_age
            elsif update_guest_info_input == "2"
                CLI.update_guest_favorite_artist
            end 
        elsif input == "4"
            CLI.remove_guest
        elsif input == "5"
            CLI.get_artist_shows
        elsif input == "6"
            CLI.twenty_one
        elsif input == "8"
            puts "Good bye!"
            exit
        end 
        puts 
        puts "What would you like to do now?"
        puts "(Please type in the number next to your desired choice)"
        puts 
        puts "1. Return to Main Menu"
        puts "2. Close Program"
        response = gets.strip 
    end 
end 

def get_user_input 
    gets.strip 
end 

run_program 

puts "Good bye!"



















