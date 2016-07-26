class Song < ActiveRecord::Base
  belongs_to :artist
  has_and_belongs_to_many :genre

  include Slugifiable


  def self.find_by_slug(slug)
    name = slug.split("-").map { |name| name.capitalize }.join(" ")
    self.find_by_name(name)
  end

end
