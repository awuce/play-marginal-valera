require 'io/console'
require_relative 'marginal_do_list'
require_relative 'marginal_info'

NEW_GAME = 'N'
LOAD_GAME = 'L'
EXIT_GAME = 'E'
PICK_MENU = [NEW_GAME, LOAD_GAME, EXIT_GAME]
STANDART_MODE = 'S'
HARD_MODE = 'H'
BACK_TO_MENU = 'B'
PICK_MODE = [STANDART_MODE, HARD_MODE, BACK_TO_MENU, EXIT_GAME]
RED = "\x1b[4;31m"
END_STYLE = "\x1b[0m"
CENTER = "\t\t\t\t\t"
PICK_ACTION = %w[1 2 3 4 5 6 7 9 0]

class MarginalValera
  def play_marginal
    skip_page
    show_main_banner
    show_main_banner_before
    show_main_menu
  end

  def show_main_menu
    puts "#{CENTER}    #{RED}#{NEW_GAME}#{END_STYLE}ew game"
    puts "#{CENTER}    #{RED}#{LOAD_GAME}#{END_STYLE}oading"
    puts "#{CENTER}    #{RED}#{EXIT_GAME}#{END_STYLE}xit\n\n\n"
    define_menu_action
  end

  def define_menu_action
    begin
      menu = STDIN.getch.chomp.upcase
    end until PICK_MENU.include? menu
    skip_page
    case menu
    when NEW_GAME
      new_game
    when LOAD_GAME
      load_game

    when EXIT_GAME
      exit_game
    end
  end

  def new_game
    puts "#{CENTER}    #{RED}#{STANDART_MODE}#{END_STYLE}tandart"
    puts "#{CENTER}    #{RED}#{HARD_MODE}#{END_STYLE}ard\n\n\n"
    puts "#{CENTER}    #{RED}#{BACK_TO_MENU}#{END_STYLE}ack to menu"
    puts "#{CENTER}    #{RED}#{EXIT_GAME}#{END_STYLE}xit\n\n\n"
    define_mode_action
  end

  def define_mode_action
    begin
      mode = STDIN.getch.chomp.upcase
    end until PICK_MODE.include? mode
    skip_page
    case mode
    when STANDART_MODE
      start_game(100, 0, 10, 0, 1000)
    when HARD_MODE
      start_game(50, 50, 0, 50, 0)
    when BACK_TO_MENU
      show_main_menu
    when EXIT_GAME
      exit_game
    end
  end

  def load_game
    begin
      print "\tSave: "
      save = gets.chomp.downcase
      puts save
      $stdin = File.new("save/" + save + ".txt", "r")
      valera = $stdin.gets.split(" ")
      $stdin = STDIN
      start_game(valera[0].to_i, valera[1].to_i, valera[2].to_i, valera[3].to_i, valera[4].to_i)
    rescue
      puts "Что-то пошло не так"
      load_game
      return
    end
  end

  def start_game(health, alcohol, happyness, tiredness, money)
    actions(health, alcohol, happyness, tiredness, money)
  end

  def actions(health, alcohol, happyness, tiredness, money)
    valera = MarginalDoList.new(MarginalInfo.new(health, alcohol, happyness, tiredness, money))
    skip_page
    while 1
      valera.show_info
      show_actions
      begin
        act = STDIN.getch.chomp.to_i.to_s
      end until PICK_ACTION.include? act
      # skip_page
      case act
      when '1'
        valera.go_to_work
      when '2'
        valera.contemplate_nature
      when '3'
        valera.drink_wine_and_watch_series
      when '4'
        valera.go_to_the_bar
      when '5'
        valera.marginaling
      when '6'
        valera.sing_in_the_subway
      when '7'
        valera.sleeping
      when '9'
        save_game(valera.get_info_save)
      when '0'
        save_game?(valera.get_info_save)
        play_marginal
        break
      end
      sleep 2

      if valera.death?
        skip_page
        show_death_banner
        sleep 2
        play_marginal
        break
      end
    end
  end

  def show_actions
    puts "    #{RED}1#{END_STYLE} Пойти на работу"
    puts "    #{RED}2#{END_STYLE} Созерцать природу"
    puts "    #{RED}3#{END_STYLE} Пить вино и смотреть сериал"
    puts "    #{RED}4#{END_STYLE} Сходить в бар"
    puts "    #{RED}5#{END_STYLE} Выпить с маргинальными личностями"
    puts "    #{RED}6#{END_STYLE} Петь в метро"
    puts "    #{RED}7#{END_STYLE} Спать"
    puts "    #{RED}9#{END_STYLE} Сохранить и выйти"
    puts "    #{RED}0#{END_STYLE} Выйти\n\n"
  end

  def save_game(stat)
    begin
      print "\tSave: "
      save = gets.chomp
      $stdin = File.new("save/" + save + ".txt", "w")
      $stdin.puts(stat)
      $stdin = STDIN
    rescue
      puts "Что-то пошло не так"
      save_game(stat)
      return
    end
  end

  def save_game?(stat)
    puts "Хотите сохранить? (y/n) "
    menu = STDIN.getch.chomp.downcase
    case menu
    when 'y'
      save_game(stat)
    when 'n'
      skip_page
      return
    else
      save_game?(stat)
    end
  end

  def exit_game
    show_end_banner
  end

  def show_main_banner
    banner = File.open("media/banner.txt", "r+")
    banner.each do |line|
      print "\t\t  " + line
      sleep 0.3
    end
    print "\n\n"
    banner.close
  end

  def show_main_banner_before
    before_banner = File.open("media/version.txt", "r+")
    before_banner.each do |line|
      print CENTER
      line.each_byte do |byte|
        print byte.chr
        sleep 0.1
      end
    end
    sleep 1
    print "\n\n\n"
    before_banner.close
  end

  def show_end_banner
    banner = File.open("media/end_banner.txt", "r+")
    banner.each do |line|
      print "\t\t\t" + line
      sleep 0.3
    end
    show_main_banner
  end

  def show_death_banner
    banner = File.open("media/death_banner.txt", "r+")
    banner.each do |line|
      print "\t\t" + line
      sleep 0.3
    end
  end

  def skip_page
    40.times {print "\n"}
  end

end
