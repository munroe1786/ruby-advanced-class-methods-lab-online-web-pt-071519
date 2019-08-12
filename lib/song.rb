class Song
  attr_accessor :name, :artist_name
  @@all = []
  

  def self.all
    @@all
  end
  
  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      self.create_by_name(name)
    end
  end
  
  def self.new_from_filename(filename)
    split = filename.split(' - ')
    artist_name = split[0]
    name = split[1].split('.')[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    split = filename.split(' - ')
    name = split[1].split('.')[0]
    artist_name = split[0]
    song = self.create
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name}
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end
end
