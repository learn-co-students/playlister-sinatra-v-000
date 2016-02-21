module Concerns::Slugifiable
  def slug
    self.name.downcase.split(/\W/).reject { |w| w.empty? }.join("-")
  end
end