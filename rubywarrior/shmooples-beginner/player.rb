class Player
  def initialize()
    @hpLastTurn = 20
    @freedCaptive = false
    @lookArray = Array.new(3)
    @closestEntity
    @rangedEnemyList = ["Wizard", "Archer"]
  end

  def takingDmg(currentHP)
    @hpLastTurn > currentHP
  end

  def findCaptive(warrior)
    if warrior.feel.captive?
      warrior.rescue!
      @freedCaptive = true
    else
      warrior.walk!
    end
  end

  def fightOrFlight(warrior)
    if takingDmg(warrior.health) == false && warrior.health < 20 && enemyInSight() == false
      warrior.rest!
    else
      takeAction(warrior)
    end
  end

  def updateClosestEntity()
    @lookArray.each {|x|
      @closestEntity = x
      break if x != "nothing"
    }
  end

  def enemyInSight()
    updateClosestEntity()

    if @rangedEnemyList.include?(@closestEntity)
      return true
    else
      return false
    end
  end

  def takeAction(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel.wall?
      warrior.pivot!
    elsif enemyInSight() == true
      warrior.shoot!
    else
      if warrior.health < 10
        warrior.walk!(:backward)
      else
        warrior.walk!
      end
    end
  end

  def updateLookArray(warrior)
    tempArray = warrior.look
    for num in 0..2
      @lookArray[num] = tempArray[num].to_s
    end
  end

  def play_turn(warrior)
    updateLookArray(warrior)
    fightOrFlight(warrior)
    
    @hpLastTurn = warrior.health
  end
  
end
