require_relative 'marginal_info'

class MarginalDoList
  def initialize(marginal_info)
    @marginal_info = marginal_info
  end

  def marginal_info
    @marginal_info
  end

  def show_info
    puts "\n\n    Health    #{@marginal_info.health}/100"
    puts "    Alcohol   #{@marginal_info.alcohol}/100"
    puts "    Happyness #{@marginal_info.happyness}/10"
    puts "    Tiredness #{@marginal_info.tiredness}/100"
    puts "    Money     #{@marginal_info.money} $\n\n"
  end

  def go_to_work
    if @marginal_info.alcohol >= 50
      puts "\tЯ не могу работать, я пьян"
      return
    end
    if @marginal_info.tiredness >= 10
      puts "\tЯ не могу работать, я устал"
      return
    end
    if @marginal_info.happyness <= -10
      puts "\tЯ не могу работать, у меня несчастье"
      return
    end
    @marginal_info.alcohol   -= 30
    @marginal_info.happyness -= 5
    @marginal_info.tiredness += 70
    @marginal_info.money     += 100
    puts "Да сколько можно уже работать! Этот день никогда не кончится."
  end

  def contemplate_nature
    @marginal_info.alcohol   -= 10
    @marginal_info.tiredness -= 10
    @marginal_info.happyness += 1
    puts "Единственное место, где нет людей, какая легкость."
  end

  def drink_wine_and_watch_series
    if @marginal_info.money < 20
      puts "Сходи поработай может быть! Нет?"
      return
    end
    if @marginal_info.tiredness >= 100
      puts "Ты устал, отдохни!"
      return
    end
    @marginal_info.money     -= 20
    @marginal_info.alcohol   += 30
    @marginal_info.tiredness += 10
    @marginal_info.happyness -= 1
    @marginal_info.health    -= 5
    puts "Что там опять на Netflix?"
    puts "

    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░▒▒▒▒░░░▒▒▒▒░░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒░▒▒▒▒▒▒░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒░░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒░░░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒░░░░░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░▒░░░░░░░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒░▒▒▒░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒░░░░░▓▓
    ▓▓░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒░░░░░░▓▓
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
    _______▒__________▒▒▒▒▒▒▒▒▒▒▒▒▒▒
    ______▒_______________▒▒▒▒▒▒▒▒
    _____▒________________▒▒▒▒▒▒▒▒
    ____▒___________▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
    sleep 1
  end

  def go_to_the_bar
    if @marginal_info.money < 100
      puts "Сходи поработай может быть! Видишь не хватает?"
      return
    end
    if @marginal_info.tiredness >= 100
      puts "Ты вечно уставший, иди отдохни"
      return
    end
    @marginal_info.money     -= 100
    @marginal_info.alcohol   += 60
    @marginal_info.happyness += 1
    @marginal_info.tiredness += 40
    @marginal_info.health    -= 10
    puts "Устаю уже ходить по барам..."
  end

  def marginaling
    if @marginal_info.money < 150
      puts "Сходи поработай может быть! Тебе нужно больше денег!"
      return
    end
    if @marginal_info.tiredness >= 100
      puts "Снова сходи отдохни!"
      return
    end
    @marginal_info.money     -= 150
    @marginal_info.alcohol   += 90
    @marginal_info.happyness += 5
    @marginal_info.tiredness += 80
    @marginal_info.health    -= 80
    puts "Маргинализируюсь"
  end

  def sing_in_the_subway
  if @marginal_info.tiredness >= 100
    puts "Отдохни!"
    return
  end
  if @marginal_info.alcohol > 40 && @marginal_info.alcohol < 70
    @marginal_info.money += 50
    puts "Немного мелочи не помешает"
  end
  @marginal_info.money     += 10
  @marginal_info.alcohol   += 10
  @marginal_info.happyness += 1
  @marginal_info.tiredness += 20
  puts "Собираю свой хор. "
  end

  def sleeping
    puts "Спят усталые...."
    if @marginal_info.alcohol < 30
      @marginal_info.health += 90
      puts "Мне стало значительно лучше"
    end
    if @marginal_info.alcohol > 70
      @marginal_info.happyness -= 3
      puts "Как же голова болит..."
    end
    @marginal_info.alcohol   -= 50
    @marginal_info.tiredness -= 70
  end

  def death?
    @marginal_info.health <= 0
  end

  def get_info_save
    @marginal_info.health.to_s + ' ' + @marginal_info.alcohol.to_s + ' ' + @marginal_info.happyness.to_s + ' ' + @marginal_info.tiredness.to_s + ' ' + @marginal_info.money.to_s
  end
end
