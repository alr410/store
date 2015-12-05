# Класс продукта, у экземпляров которого есть два поля: цена и количество на складе.
# При создании нового продукта можно передать значения цены и остатка

class Product
  def initialize(price, quantity)
    @name = ""
    @price = price
    @quantity = quantity

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
end