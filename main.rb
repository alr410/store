# Программа для небольшого магазинчика, который торгует фильмами, музыкой и книгами.
# Создадим объект фильм
require_relative "#{File.dirname(__FILE__)}/product.rb"
require_relative "#{File.dirname(__FILE__)}/film.rb"

# encoding: utf-8
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

leon = Film.new('Леон', '300', '29')

puts "Фильм #{leon.name} стоит #{leon.price} руб."