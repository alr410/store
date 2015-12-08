# Класс фильм
class Film < Product

  def update(options)
    @name = options[:title]
    @director = options[:director_name]
    @year_of_release = options[:year_of_release]
  end

  def info
    "Фильм #{@name}, реж. #{@director} (#{@year_of_release})"
  end
end