# Класс книги
class Book < Product

  def update(options)
    @name = options[:title]
    @author = options[:author_name]
  end

  def info
    "Название книги: #{@name}, автор #{@author}"
  end

end
