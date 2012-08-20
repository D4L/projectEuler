public

module RomanNumeral

  class RomanNumeral

    @@numerals = {
      'I' => 1,
      'V' => 5,
      'X' => 10,
      'L' => 50,
      'C' => 100,
      'D' => 500,
      'M' => 1000
    }

    def initialize number
      if number.class == String
        # we were given a string for initialization, let's find the number for this
        @number = RomanNumeral.parse(number)
      end
    end

    def to_i
      @number
    end

    def to_s
      tempnumber = @number
      result = ""
      while tempnumber >= 1000
        result += 'M'
        tempnumber -= 1000
      end
      result += tostringhelper(100, 'C', 'D', 'M', tempnumber)
      tempnumber %= 100
      result += tostringhelper(10, 'X', 'L', 'C', tempnumber)
      tempnumber %= 10
      result += tostringhelper(1, 'I', 'V', 'X', tempnumber)
      result
    end

    def self.parse number
      result = 0
      prevchar = nil
      number.each_char do |i|
        if not prevchar.nil?
          if @@numerals[prevchar] < @@numerals[i]
            result += @@numerals[i] - @@numerals[prevchar]
            prevchar = nil
          else
            result += @@numerals[prevchar]
            prevchar = i
          end
        else
          prevchar = i
        end
      end
      result += @@numerals[prevchar] if not prevchar.nil?
      result
    end

    private

    def tostringhelper(whichten, ones, fives, tens, number)
      # returns [letters to be added, number to be subtracted]
      result = ""
      if number >= whichten
        if number / whichten == 9
          result += ones + tens
          number -= 9 * whichten
        elsif number / whichten == 4
          result += ones + fives
          number -= 4 * whichten
        elsif number >= 5 * whichten
          result += fives
          number -= 5 * whichten
        end
        while number >= whichten
          result += ones
          number -= whichten
        end
      end
      result
    end

  end

end
