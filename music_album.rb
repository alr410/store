# Класс музыкальный альбом
class MusicAlbum < Product

  def update(options)
    @name = options[:album_name]
    @artist_name = options[:artist_name]
    @music_genre = options[:music_genre]
  end
end