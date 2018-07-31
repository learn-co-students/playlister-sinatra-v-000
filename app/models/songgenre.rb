class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  def self.find_by_song_id(idnum)
    #binding.pry
    @array1 = []
      self.all.each do |inst|
        if inst.song_id == idnum
        @array1 << inst
        end
      end
      if !@array1.empty?
      @array1[0]
      end
  end

  def self.find_by_genre_id(idnum)
    #binding.pry
    @array1 = []
      self.all.each do |inst|
        if inst.genre_id == idnum
        @array1 << inst
        end
      end
      if !@array1.empty?
      @array1[0]
      end
  end

end
