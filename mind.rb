class Mastermind
  COLORS = ["R", "G", "B", "Y","O", "P"]

  def initialize 
    @role = choose_role
    if @role == :guesser
      @secret_code = array.new(4) {COLORS.sample}
    else
      puts "Creator mode selected"
  end
end

def choose_role
  puts "Welcome to mastermind."
  puts "Do you want to be a Guesser o a Creator?"
  puts "enter 'G' to guess the computer's code"
  puts "Enter 'C' to create your own code for the computer to guess"

  choice = gets.chomp.upcase
  until ['G', 'C'].include?(choice)
    puts "Please enter 'G' or 'C':"
    choice = gets.chomp.upcase
  end
  choice == 'G' ? :guesser : :Creator
end


  def play
    12.times do |turn|
      puts "Turn #{turn + 1}: Enter your guess (4 letters, e.g RGBY)"
      guess = gets.chomp.upcase.chars

      if guess == @secret_code
        puts "You cracked the code!  🎉"
        return
      end

      feedback(guess)
    end

    puts "Out of turns! The secret code was #{@secret_code.join}"
  end

  private

  def feedback(guess)
    exact = guess.each_index.count { |i| guess[i] == @secret_code[i]}
    color_only = (guess & @secret_code).map { |c| [guess.count(c), 
    @secret_code.count(c)].min}.sum - exact
    puts "Exact matches: #{exact}, Color only: #{color_only}"
  end
end

game = Mastermind.new
game.play

