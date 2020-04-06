
class PassInfo::Cli 
    def call 
      menu
    end

    def menu
        welcome_user
        PassInfo::Pass.pass_names
        list_passes
        user_input
        get_user_pass
        while !valid_input?
            puts "\n #{@input} is not a valid number. Please enter a valid number..."
            @passes.clear
            menu
        end
        pass_report
        ask_to_repeat
    end

    def welcome_user
        puts "\nWelcome to Pass Info!"
        puts "Pass Info provides you with up to date status reports for all Washington State Mountain Passes."
        puts "Please be sure you are not driving while using this app!"
        puts "\nEnter in the corresponding number for the WSDOT Mountain Pass you would like to check or enter 'e' to exit the program:"
    end

    def exit_program
        exit
    end

    def list_passes
        @passes = PassInfo::Pass.all.each_with_index {|pass, index| puts "#{index + 1}. #{pass.name}"}
    end

    def clear_passes
        @passes.clear
    end

    def user_input
        @input = gets.strip.downcase
        if @input == 'e'
            exit_program
        end
    end

    def get_user_pass
        @input_to_index = @input.to_i - 1 #convert user input to array index
        user_pass = @passes[@input_to_index] #the pass the user chose
    end

    def valid_input?
        flag = nil
        if @input.to_i <= @passes.length && @input_to_index >= 0
            flag = true 
        end
        flag
    end
    
    def pass_report
        puts "\nPass Report:"
        puts get_user_pass.name
        puts get_user_pass.temperature
        puts get_user_pass.elevation
        puts "Weather: #{get_user_pass.weather}"
        puts "Conditions: #{get_user_pass.conditions}"
        puts get_user_pass.restrictions_One
        puts get_user_pass.restrictions_Two
    end

    def ask_to_repeat
        puts "\n Would you like to select another pass (y/n)"
        choice = gets.downcase.strip
        if choice == "y"
            clear_passes
            menu
        elsif choice == "n"
            exit
        else
            puts "please enter in y or n"
            ask_to_repeat
        end
    end

  end