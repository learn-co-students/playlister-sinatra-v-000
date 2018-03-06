class Slugifiable
  def self.create(str)
    str = str.downcase
    str.gsub " ", "-"
  end
end
