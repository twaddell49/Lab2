#Colin Twaddell
#Software Eng. Methods and Tools Lab2
#Github repo URL: https://github.com/twaddell49/Lab2/blob/master/Lab2.rb

# Part1: Hello World
class HelloWorldClass
    def initialize(name)  #same thing as a constructor in Java
       @name = name.capitalize  #@name is a class variable
    end
    def sayHi
        puts "Hello #{@name}!" #put string hello and class var name
    end
    
    def count_words(string)

    end
end

#Test Part 1
#hello = HelloWorldClass.new("Colin") #initialize
#hello.sayHi

#Part 2
def palindrome?(string)
    temp = string.downcase.scan(/\w/) #check for caps and whitespace
    temp == temp.reverse              #check for palindrome
end

#Test Part 2
#p palindrome?("Madam, I'm Adam!")                  # => true
#p palindrome?("Abracadabra")

#Part 3
def count_words(string)
    x = Hash.new(0)
    sub = string.gsub " -- ", "  "
    temp = sub.downcase
    words = temp.split
    words.each do |word|
	if x.has_key? word 
		x[word] += 1
	else 
		x[word] = 1
        end
    end
    return x
end

#Test Part 3
#p count_words("A man, a plan, a canal -- Panama")

#Part 4
class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	raise NoSuchStrategyError unless game[0][1] =~ /R|P|S/ or game [1][1] =~ /R|P|S/
	if game[0][1] == "R" and game[1][1] == "S"
		return game[0]	
	elsif game[0][1] == "S" and game[1][1] == "P"
		return game[0]
	elsif game[0][1] == "P" and game[1][1] == "R"
		return game[0]
	elsif game[0][1] == game[1][1]
		return game[0]
	else
		return game[1]
	end
end

#Test rps_game_winner
#p rps_game_winner([["Colin", "S"], ["Judy", "P"]])

def rps_tournament_winner(tournament)
	if tournament[0][0].is_a? String
		return rps_game_winner(tournament)
	end
	return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
end

#tournament1 = [[[["Armando", "P"], ["Dave", "S"]], [["Richard", "R"], ["Michael", "S"]], ], [[["Allen", "S"], ["Omer", "P"]], [["David E.", "R"], ["Richard X.", "P"]]]]
#p rps_tournament_winner(tournament1)

#Part 5

def combine_anagrams(words)
	words.group_by { |word| word.downcase.chars.sort }.values
end

#Test Part 5
words1 = ["car", "racs", "for", "orf"]
p combine_anagrams(words1)
