# Класс книги
class Book < Product

  def update(options)
    @name = options[:title]
    @author = options[:author_name]

  end

end
