
class PassInfo::Cli 
    def call 
      puts "\nWelcome to Pass Info!"
      puts "Pass Info provides you with up to date status reports for all Washington State Mountain Passes."
      puts "Please be sure you are not driving while using this app!"
      menu
    end

    def menu
        mountain_passes
        list_passes
        get_user_pass
        if valid_input?
            puts "\nGetting Pass Information..."
        else
            puts "\n #{@input} is not a valid number. Please enter a valid number..."
        end
    end 

    def mountain_passes
        @passes = ["Blewett Pass","Cayuse Pass","Chinook Pass","Crystal to Greenwater",
                "Disautel Pass","Loup Loup Pass","Manastash Ridge","Mt. Baker Hwy","North Cascades Hwy",
                "Satus Pass","Sherman Pass","Snoqualmie Pass","Stevens Pass","Wauconda Pass","White Pass",]
    end

    def list_passes
        @passes.each_with_index {|pass, index| puts "#{index + 1}. #{pass}"}
    end

    def get_user_pass
        @input = gets.strip
        #binding.pry
        @input_to_index = @input.to_i - 1
        flag = @passes[@input_to_index]
        flag
        #binding.pry
    end

    def valid_input?
        flag = nil
        if @input.to_i <= @passes.length && @input_to_index >= 0
            flag = true
        end
        flag
    end 

  end