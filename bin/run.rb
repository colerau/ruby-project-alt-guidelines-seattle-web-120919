require_relative '../config/environment'

cli = CommandLineInterface.new

response = "1"
while response != "2"
    cli.greet
    cli.main_menu
    input = cli.get_user_input
    if input == "1" 
        cli.get_guest_show
    elsif input == "2"
        cli.add_guest
    elsif input == "3"
        cli.update_guest_age
    elsif input == "4"
        cli.remove_guest
    end 
    puts 
    puts "What would you like to do now?"
    puts "(Please type in the number next to your desired choice)"
    puts 
    puts "1. Return to Main Menu"
    puts "2. Close Program"
    response = gets.strip 
end 



















