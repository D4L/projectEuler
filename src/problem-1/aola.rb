public

require 'arithmeticSequence'

def aola
  # derived from aoet, except we implement the libraryarithmetic sequence
  arithmeticSequence(333, 3, 999) + arithmeticSequence(200, 5, 1000) - arithmeticSequence(66, 15, 990)
end
