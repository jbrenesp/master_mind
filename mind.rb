class Mastermind
  COLORS = ["R", "G", "B", "Y","O", "P"]

  def initialize 
    @secret_code = Array.new(4) {COLORS.sample}
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
    exact = guess.each_index.count { |i| guess[1] == @secret_code[i]}
    color_only = (guess & @secret_code).map { |c| [guess.count(c), @secret_code.count(c)].min}.sum - exact
    puts "Exact matches: #{exact}, Color only: #{color_only}"
  end
end

game = Mastermind.new
game.play

