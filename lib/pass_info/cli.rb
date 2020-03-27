
class PassInfo::Cli 
    def call 
      puts "\nWelcome to Pass Info!"
      puts "Pass Info provides you with up to date status reports for all Washington State Mountain Passes."
      puts "Please be sure you are not driving while using this app!"
      menu
      pass_report
    end

    def menu
        get_passes
        list_passes
        get_user_pass
        if !valid_input?
            puts "\n #{@input} is not a valid number. Please enter a valid number..."
        end
    end
    
    def get_passes
        @passes = PassInfo::Pass.all
        #binding.pry
    end

    # def mountain_passes
    #     @passes = ["Blewett Pass","Cayuse Pass","Chinook Pass","Crystal to Greenwater",
    #             "Disautel Pass","Loup Loup Pass","Manastash Ridge","Mt. Baker Hwy","North Cascades Hwy",
    #             "Satus Pass","Sherman Pass","Snoqualmie Pass","Stevens Pass","Wauconda Pass","White Pass",]
    # end

    def list_passes
        @passes.each_with_index {|pass, index| puts "#{index + 1}. #{pass.name}"}
    end

    def get_user_pass
        @input = gets.strip #get input from user
        #binding.pry
        @input_to_index = @input.to_i - 1 #convert user input to array index
        flag = @passes[@input_to_index] #the pass the user chose
        flag #returns pass
        #binding.pry
    end

    def valid_input?
        flag = nil
        if @input.to_i <= @passes.length && @input_to_index >= 0
            flag = true 
        end
        flag
    end
    
    def pass_report
        pass = @passes[@input_to_index]
        report = pass.report
        puts "Pass Report:"
        PassInfo::Pass.all.each do |pass|
            binding.pry
            puts pass.name
        #     puts pass.temperature
        #     puts pass.elevation
        #     puts pass.restrictionsone
        #     puts pass.restrictionstwo
        #     puts pass.conditions
        #     puts pass.weather
        end
    end

  end