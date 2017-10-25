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

  def learn_routine(list_of_jokes)
    joke_file = CSV.open list_of_jokes, headers: true, header_converters: :symbol
    joke_file.each do |row|
      self.jokes << row
    end
  end

end
