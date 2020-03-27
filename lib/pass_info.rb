require_relative "./pass_info/version"
require_relative "./pass_info/cli"
require_relative "./pass_info/pass"
require_relative "./pass_info/scraper"


require "pry"
require "nokogiri"
require "open-uri"

module PassInfo
  class Error < StandardError; end
  # Your code goes here...
end
