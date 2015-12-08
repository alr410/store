# Класс музыкальный альбом
class MusicAlbum < Product

  def update(options)
    @name = options[:title]
    @artist_name = options[:singer]
    @music_direction = options[:direction]
  end

  def info
    "Альбом: #{@name}, поет: #{@artist_name}, жанр: #{@music_direction}"
  end
end