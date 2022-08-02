require 'sqlite3'

database_connection = SQLite3::Database.new('/home/faruk/Development/Code/Phase-3/RubySql/my_database.db')

class Cat
    attr_accessor :name, :breed, :age
    @@all = []
  
    def initialize(name, breed, age)
      @name = name
      @breed = breed
      @age = age
      @@all << self
    end
  
    def self.all
      @@all
    end
  
    def self.save(name, breed, age, database_connection)
      database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)", name, breed, age)
    end
  end

Cat.new("Maru2", "scottish fold1", 8)
Cat.new("Hana2", "tortoiseshell1", 4)
  
Cat.all.each do |cat|
  Cat.save(cat.name, cat.breed, cat.age, database_connection)
end

# Cat.save("Test3", "Breed Test3", 8, database_connection);

# database_connection.execute("CREATE TABLE IF NOT EXISTS rabbits(id INTEGER PRIMARY KEY, name TEXT, breed TEXT, age INTEGER)")

# database_connection.execute("CREATE TABLE IF NOT EXISTS owners(id INTEGER PRIMARY KEY, name TEXT)")

# database_connection.execute("INSERT INTO rabbits (name, breed, age) VALUES ('Maru2', 'scottish fold2', 3)")

# database_connection.execute("INSERT INTO rabbits (name, breed, age) VALUES ('Hana2', 'tortoiseshell2', 1)")