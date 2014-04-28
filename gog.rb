class GOG
  def self.credentials
    @credentials ||= begin
      path = Pathname(ENV["HOME"]) + ".gogauth"
      raise "File #{ptah} doesn't exist" unless path.exist?
      path.readlines.map(&:chomp).grep(/\S+/)[0,2]
    end
  end
end
