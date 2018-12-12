class Genre < ActiveRecord::Base
  has_many :artists, :through => :songs
  has_many :song_genres
  has_many :songs, :through => :song_genres

  def genre
    @genre ||= Genre.find_by_name(params[:genre])
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
