class Hand
  attr_accessor :score
  def initialize(stringhand)
    @cards = stringhand.split(' ').map {|card| Card.new(card)}
    @score = 0
  end
  def getScore
    @score += numOfPairs.to_i
    @score += 4 if threeOfAKind?
    @score += 8 if straight?
    @score += 16 if flush?
    @score += 32 if fullHouse?
    @score += 64 if fourOfAKind?
    @score += 128 if straightFlush?
    @score += 256 if royalFlush?
    @score
  end
  def getSingleScore
    sum = 0
    iterator = 1
    fullHand = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
    sortedHand = Array.new
    malleable = @cards.collect{|c| c.value}
    fullHand.each do |i|
      sortedHand.push(i) if malleable.include?(i)
    end
    sortedHand.each do |i|
      val = 0
      if i.to_i != 0
        val = i.to_i
      elsif i == 'T'
        val = 10
      elsif i == 'J'
        val = 11
      elsif i == 'Q'
        val = 12
      elsif i == 'K'
        val = 13
      elsif i == 'A'
        val = 14
      end
      sum += val * iterator
      iterator *= 14
    end
    sum
  end
  def getDoubleScore
    sum = 0
    iterator = 1
    fullHand = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
    sortedHand = Array.new
    malleable = @cards.collect{|c| c.value}
    findDouble = 0
    fullHand.each do |i|
      sortedHand.push(i) if malleable.count(i) == 1
      findDouble = i if malleable.count(i) == 2
    end
    sortedHand.push findDouble
    sortedHand.each do |i|
      val = 0
      if i.to_i != 0
        val = i.to_i
      elsif i == 'T'
        val = 10
      elsif i == 'J'
        val = 11
      elsif i == 'Q'
        val = 12
      elsif i == 'K'
        val = 13
      elsif i == 'A'
        val = 14
      end
      sum += val * iterator
      iterator *= 14
    end
    sum
  end
  def numOfPairs
    num = 0
    malleable = @cards.collect{|c| c.value}
    malleable.each do |i|
      num += 1 if malleable.count(i) > 1
    end
    num/2
  end
  def threeOfAKind?
    malleable = @cards.collect{|c| c.value}
    (0..2).each do |i|
      return true if malleable.count(malleable[i])== 3
    end
    false
  end
  def straight?
    correctOrder = ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
    malleable = @cards.collect{|c| c.value}.sort
    if malleable[0].to_i != 0
      startOrder = correctOrder.index malleable[0]
      (1..4).each do |i|
        return false if not malleable.include?(correctOrder[startOrder + i])
      end
    else
      startOrder = 8
      (0..4).each do |i|
        return false if not malleable.include?(correctOrder[startOrder + i])
      end
    end
    true
  end
  def flush?
    @cards.collect{|c|c.suit}.uniq.size == 1
  end
  def fullHouse?
    return (self.threeOfAKind? and numOfPairs == 2)
  end
  def fourOfAKind?
    malleable = @cards.collect{|c| c.value}
    (0..1).each do |i|
      return true if malleable.count(malleable[i]) == 4
    end
    false
  end
  def straightFlush?
    return (self.straight? and self.flush?)
  end
  def royalFlush?
    highcard = @cards.collect{|c|c.value}.include? 'A'
    return (highcard && self.straightFlush?)
  end
end

class Card
  attr_accessor :suit, :value
  def initialize (stringcard)
    @suit = stringcard[1]
    @value = stringcard[0]
  end
end
