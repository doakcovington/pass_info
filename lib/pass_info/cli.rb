
class PassInfo::Cli 
    def call 
      puts "Welcome to Pass Info!"
      puts "Pass Info provides you with up to date status reports for all Washington
            State Mountain Passes."
      puts "Please be sure you are not driving while using this app!"
      list_passes
      get_user_pass
      #list passes
      #get pass from user 
      #binding.pry 
    end

    def list_passes
        @passes = ["Blewett Pass","Cayuse Pass","Chinook Pass","Crystal to Greenwater",
                "Disautel Pass","Loup Loup Pass","Manastash Ridge","Mt. Baker Hwy","North Cascades Hwy",
                "Satus Pass","Sherman Pass","Snoqualmie Pass","Stevens Pass","Wauconda Pass","White Pass",]
    end

    def get_user_pass
        @passes.each_with_index {|pass, index| puts "#{index + 1}. #{pass}"}
    end

  end