module Display
  def clear(delay = 1.5)
  end
end

class Player
  def initialize(name)
    @name = capitalize(name)
    @score = 0
  end

  def capitalize(name)
  end
end

class Human < Player
  def initialize
    super(name)
    @validate = InputValidator.new
    @prompt = HumanPrompts.new
  end

  def choose_hand
  end

  def choose_num_rounds
  end
end

class InputValidator
  def num_rounds?(input)
  end

  def hand?(input)
  end

  def name?(input)
  end
end

class Prompts
  def num_round_input
  end

  def name_input
  end

  def invalid_input
  end
end

class Computer < Player
  def choose_hand
  end
end

class Hand
  def initialize(hand)
    @hand = hand
  end

  def beat?(other_hand)
  end

  def tied?(other_hand)
  end
end

class GameMessages
  def welcome
  end

  def goodbye
  end

  def scores(player, computer)
  end

  def outcome
  end
end

class RoundMessages
  def outcome
  end
end

class Score
  def initialize
    @score = 0
  end

  def increment
  end

  def decrement
  end
end

# orchestration class
class Game
  def initialize(human, computer)
    @game_msg = GameMessages.new
    @human = human
    @computer = computer
  end

  def set_num_rounds=(num_rounds)
    @num_rounds = num_rounds
  end

  def play
    loop do
      game_msg.welcome

      num_rounds.times do |_|
        round = Round.new(human, computer)
        round.play
      end
      break unless play_again?
    end
    game_msg.goodbye
  end

  def play_again?
  end
end

class Round
  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def play
    choose_hands
    compare_hands
    update_scores
    round_msg.outcome
  end

  def choose_hands
    human.choose_hand
    computer.choose_hand
  end
end

eric = Human.new('Eric')
computer = Computer.new('David')

rps = Game.new(eric, computer)
num_rounds = eric.choose_num_rounds
rps.set_num_rounds = num_rounds
rps.play
