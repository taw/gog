require "mechanize"
require "pathname"

class GOG
  def self.credentials
    @credentials ||= begin
      path = Pathname(ENV["HOME"]) + ".gogauth"
      raise "File #{ptah} doesn't exist" unless path.exist?
      path.readlines.map(&:chomp).grep(/\S+/)[0,2]
    end
  end

  def initialize
    @agent = Mechanize.new
    @agent.log = Logger.new("mechanize.log")
    @credentials = GOG.credentials
  end

  def login!
    page = @agent.get "http://www.gog.com/"
    form = page.form("login_form")
    form.log_email = GOG.credentials[0]
    form.log_password = GOG.credentials[1]
  end
end
