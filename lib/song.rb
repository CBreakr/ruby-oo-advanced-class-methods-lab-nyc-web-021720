class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    Song.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = new_by_name(song_name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    new_song = find_by_name(song_name)
    new_song ? new_song : create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  # "Taylor Swift - Blank Space.mp3"
  def self.new_from_filename(filename)
    song_artist, song_name = filename.split(/[-\.]/).map{|val| val.strip}
    new_song = new_by_name(song_name)
    new_song.artist_name = song_artist
    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    @@all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
