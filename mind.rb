class Mastermind
  COLORS = ["R", "G", "B", "Y","O", "P"]

  def initialize 
    @role = choose_role
    if @role == :guesser
      @secret_code = Array.new(4) {COLORS.sample}
    else
      set_human_code
    end
  end
  
  def choose_role
    puts "Welcome to mastermind."
    puts "Do you want to be a Guesser o a Creator?"
    puts "enter 'G' to guess the computer's code"
    puts "Enter 'C' to create your own code for the compu
    ter to guess"
    choice = gets.chomp.upcase
    
    until ['G', 'C'].include?(choice)
      puts "Please enter 'G' or 'C':"
      choice = gets.chomp.upcase
    end
    
    choice == 'G' ? :guesser : :creator
  end
  
  def set_human_code
    puts "Enter your secret code..."
    @secret_code = gets.chomp.upcase.chars
  end


  
  def play 
    if @role == :guesser
      play_as_guesser
    else 
      play_as_creator
    end
  end



  def play_as_guesser
    12.times do |turn|
      puts "Turn #{turn + 1}: Enter your guess 4 letters from: #{COLORS.join(', ')})"
      guess = gets.chomp.upcase.chars

      until valid_guess?(guess)
        puts "Invalid guess! Use 4 letters from: #{COLORS.join(', ')}"
        guess = gets.chomp.upcase.chars
      end

      if guess == @secret_code
        puts "You cracked the code!  🎉"
        return
      end

      feedback(guess)
    end

    puts "Out of turns! The secret code was #{@secret_code.join}"
  end

  def play_as_creator
    12.times do |turn|
      computer_guess = Array.new(4) {COLORS.sample }
      puts "Turn #{turn + 1}: Computer Guesses #{computer_guess.join}"

      if computer_guess == @secret_code
        puts "The computer cracked your code!"
        return
      end

      exact, color_only = calculate_feedback(computer_guess)
      puts "Exact matches: #{exact}, Color only: #{color_only}"
    end

    puts "Computer failed to guess your code! You win!!!"
    puts "Your secret code was: #{@secret_code.join}"
  end

  private
  
  def valid_guess?(guess)
    guess.length == 4 && guess.all? { |color| COLORS. 
    include?(color) }
  end
  
  def calculate_feedback(guess)
      exact = guess.each_index.count { |i| guess[i] ==
      @secret_code[i] }
      color_only = (guess & @secret_code).map { |c| 
      [guess.count(c), @secret_code.count(c)].min}.sum - exact
      [exact, color_only]
    end
    
    def feedback(guess)
      exact, color_only = calculate_feedback(guess)
      puts "Exact matches: #{exact}, Color only: #{color_only}"
    end
end


game = Mastermind.new
game.play

