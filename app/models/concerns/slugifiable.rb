class Slugifiable < Sinatra::Base

  def slug
    self.gsub(/[ .]/, "-")
  end
end
