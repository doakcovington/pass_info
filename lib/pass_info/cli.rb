
class PassInfo::Cli 
    def call 
      puts "Welcome to Pass Info!"
      puts "Pass Info provides you with up to date status reports for all Washington State Mountain Passes."
      puts "Please be sure you are not driving while using this app!"
      menu
      pass_report
    end

    def menu
        get_passes
        get_text
        list_passes
        get_pass_urls
        user_input
        get_user_pass
        get_user_pass_url
        get_report(get_user_pass_url)
        while !valid_input?
            puts "\n #{@input} is not a valid number. Please enter a valid number..."
            get_user_pass
        end
    end
    
    def get_passes
        @passes = PassInfo::Pass.all
    end

    def get_pass_urls
        @urls = []
        PassInfo::Pass.all.each do |link|
            @urls << link.url
        end
    end

    def get_text
        @text = PassInfo::Scraper.scrape_text
    end

    def list_passes
        @passes.each_with_index {|pass, index| puts "#{index + 1}. #{pass.name}"}
    end

    def user_input
        @input = gets.strip
    end

    def get_user_pass
        #binding.pry
        @input_to_index = @input.to_i - 1 #convert user input to array index
        @passes[@input_to_index] #the pass the user chose
    end

    def get_user_pass_url
        @urls[@input_to_index]
        #binding.pry
    end

    def valid_input?
        flag = nil
        if @input.to_i <= @passes.length && @input_to_index >= 0
            flag = true 
        end
        flag
    end
    

    def get_report(get_user_pass_url)
        report = PassInfo::Scraper.scrape_report(get_user_pass_url)
        #binding.pry
    end
    
    def pass_report
        puts "Pass Report:#{get_user_pass.name}"
        get_report.each do |key, value|
            puts "#{key}: #{value}"
        #     puts pass.temperature
        #     puts pass.elevation
        #     puts pass.restrictionsone
        #     puts pass.restrictionstwo
        #     puts pass.conditions
        #     puts pass.weather
        end
        #binding.pry
    end

  end