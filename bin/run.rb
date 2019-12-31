require_relative '../config/environment'

cli = CommandLineInterface.new

cli.greet
cli.main_menu
input = cli.get_user_input
if input == "1" 
    cli.get_guest_show
elsif input == "2"
    cli.add_guest
end 

















