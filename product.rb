# Класс продукта, у экземпляров которого есть два поля: цена и количество на складе.
# При создании нового продукта можно передать значения цены и остатка

class Product
  def initialize(price, quantity)
    @name = ''
    @price = price.to_i
    @quantity = quantity.to_i

  end

  # Метод, который позволяет посмотреть цену
  def price
    @price
  end

  # Метод, который позволяет посмотреть название продукта
  def name
    @name
  end

  # абстрактный метод
  def update(options)
    # todo: должен реализовываться детьми
  end

  # абстрактный метод получения информации о товаре
  def info
    # todo: этот метод должен возвращать строку,
    # содержащую всю информацию о товаре, кроме цены и количества оставшихся товаров
  end

  # Метод show, который использует абстрактный метод info и
  # показывает кроме информации ещё и стоимость товара
  def show
    nomenclature = info + " - #{@price} руб. [осталось:  #{@quantity}]"
  end

  # Статический метод showcase, который принимает на вход массив продуктов,
  # проходится по ним и выводит каждый из них методом show
  def self.showcase(products)
    products.each_with_index { |product_name, index|
      puts "#{index}: #{product_name.show}"
    }
  end

  # Метод покупки buy: он проверяет, остался ли товар на складе
  # (@quantity должно быть больше нуля) и если остался — пишет
  # об удачной покупке, уменьшает количество на складе на 1 и возвращает стоимость товара.
  def buy
    if @quantity > 0
      @quantity = @quantity - 1
      puts "\n****************************************************************************************"
      puts "Вы купили товар: #{info}. Удачной покупки!"
      puts "****************************************************************************************"
      price
    else
      puts "\n******************************************************************************"
      puts "К сожалению товар закончился."
      puts "********************************************************************************"
      0
    end
  end

  # статический метод read_from_xml, который в качестве параметра
  # принимает, имя файла со списком продуктов и передает его парсеру REXML
  # возвращает: хеш - описание продуктов в магазине
  def self.read_from_xml(file_xml)
    # Подключим встроенный парсер REXML
    require "rexml/document"

    # Откроем файл переданный в качестве параметра
    f = File.new(file_xml, "r:UTF-8")

    # Создадим объект, позволяющий использовать методы REXML
    doc = REXML::Document.new(f)

    # Создадим массив с описанием продукци
    store = []
    prod = nil

    # Создадим экземпляры объектов и наполним ими массив
    doc.elements.each("products/product") { |element|
      price = element.attributes["price"].to_i # цена продукта
      quantity = element.attributes["quantity"].to_i # оставшееся количество продукта

      element.elements.each("book") { |item|
        prod = Book.new(price, quantity) # экземпляр класса
        prod.update(
            title: item.attributes["title"],
            author_name: item.attributes["author_name"]
        )
      }

      element.elements.each("film") { |item|
        prod = Film.new(price, quantity) # экземпляр класса
        prod.update(
            title: item.attributes["title"],
            director_name: item.attributes["director_name"],
            year_of_release: item.attributes["year_of_release"]
        )
      }

      element.elements.each("music_album") { |item|
        prod = MusicAlbum.new(price, quantity) # экземпляр класса
        prod.update(
            title: item.attributes["title"],
            singer: item.attributes["artist_name"],
            direction: item.attributes["music_direction"]
        )
      }

      store << prod
    }

    f.close # Закроем файл

    store
  end
end