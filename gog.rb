require "mechanize"
require "pathname"

class GOG
  attr_reader :agent

  def initialize
    @agent = Mechanize.new
    @agent.log = Logger.new("mechanize.log")
    @agent.cookie_jar.load_cookiestxt("cookies.txt")
  end

  def list_games
    page = agent.get("https://secure.gog.com/account")
    # and it fails anyway, because it's just a pile of AJAX crap...
  end
end
