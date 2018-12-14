class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs

  def artist_defined?
    if Artist.find_by_name(params[:artist][:name])
      return true
    else
      return false
    end
  end

  def slug
    self.name.split(/\W/).map {|word| word.downcase unless word.empty?}.compact.join('-')
  end

  def self.find_by_slug(slug)
    unslugged = nil
    unslug_arr = slug.split('-')
    self.all.map do |obj|
      if obj.name.downcase.include?(unslug_arr[0]) && obj.name.downcase.include?(unslug_arr[-1])
        unslugged = obj
      end
    end
    self.find_by_name(unslugged.name)
  end

end
