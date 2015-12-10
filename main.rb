# Программа для небольшого магазинчика, который торгует фильмами, музыкой и книгами.

# encoding: utf-8
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative "#{File.dirname(__FILE__)}/product.rb"
require_relative "#{File.dirname(__FILE__)}/film.rb"
require_relative "#{File.dirname(__FILE__)}/music_album.rb"
require_relative "#{File.dirname(__FILE__)}/book.rb"

# Откроем файл xml с описанием товара
current_path = File.dirname(__FILE__)
f_xml = current_path + "/data/products.xml"

# если файл отсутствует, то напишим сообщение и выйдем из программы
abort "The file is absent!!!" unless File.exist?(f_xml)

# Создадим массив при помощи статической функции read_from_xml(file_xml)
store = Product.read_from_xml(f_xml)

# prod = Film.new('230', '28')
# prod.update(:title => 'Леон', :director_name => 'Люк Бессон', :year_of_release => '1994')
# store.push(prod)
#
# rain_man = Film.new('210', '16')
# store << rain_man
# rain_man.update(:title => 'Человек дождя', :director_name => 'Барри Левинсон', :year_of_release => '1988')
#
# dark_knight = Film.new('490', '7')
# store << dark_knight
# dark_knight.update(:title => 'Тёмный рыцарь', :director_name => 'Кристофер Ноланн', :year_of_release => '2008')
#
# book_tom_soyer = Book.new('112', '2')
# store << book_tom_soyer
# book_tom_soyer.update(:title => 'Приключения Тома Сойера', :author => 'Марк Твен')
#
# disk_judas_priest = MusicAlbum.new('1012', '8')
# store << disk_judas_priest
# disk_judas_priest.update(:title => 'Judas Priest', :singer => 'Turbo', :direction => 'Heavy Metal')

# 1. Функция "letter_or_number(letter)" позволяет выяснить введенный строковый параметр цифра или другой знак
# 2. Параметр letter - тип строка
# 3. Возвращает: если 1-ый символ (не считая пробела) введенного параметра "letter" - цифра,
# то возвращает цифру класса fixnum, если нет то возвращает 1-ый символ класса string
def letter_or_number(letter)
  letter = letter.lstrip.slice(0) # оставим только 1-ый символ введенного параметра

  # Если оставшийся символ цифра, то сформируем массив и вернем значение класса fixnum
  # иначе вернем сивол класса string
  if letter.scan(/\d/).empty?
    letter
  else
    ar = letter.scan(/\d/)
    ar.map! {|elem| elem.to_i}
    letter = ar.slice(0)
  end
end

choice = -1
sum = 0
#Будем предлагать купить товар, пока пользователь не выберет "х"

while choice != "x" do
  puts "Что хотите купить?"
  puts ""
  Product.showcase(store)
  puts "x - Покинуть магазин"

  choice = STDIN.gets.chomp
  choice = letter_or_number(choice)

 # Посчитаем сумму купленного товара или выйдем из магазина
  case choice
    when 0..(store.size - 1)
      sum += store[choice].buy
    when 'x'
      if sum == 0
        puts "\nЖаль, что вам у нас ничего не понравилось. Будем стараться удовлетворить ваши пожелания!!!"
      else
        puts "\nСпасибо за покупку! С вас #{sum} руб."
      end

    else
      puts "К сожаленью такого товара в нашем магазине нет!!!"
  end
end






