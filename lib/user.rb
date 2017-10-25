require './lib/joke'
require 'csv'

class User
  attr_reader :name, :jokes, :tell

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    jokes << joke
  end

  def tell(friend, joke)
    friend.jokes << joke
  end

  def perform_routine_for(friend)
    self.jokes.each do |joke|
      friend.jokes << joke
    end
  end

  def learn_routine(joke_file)
    list_of_jokes = CSV.open joke_file, headers: true, header_converters: :symbol
    list_of_jokes.each do |row|
      self.jokes << row
    end
  end
end
