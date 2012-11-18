public

def cvef
  result = 0
  (2..9999).each do |num|
    alter = arrDivisorsInt( num ).inject(&:+) - num

    # a rule is that a != b
    next if alter == num

    if num == ( arrDivisorsInt( alter ).inject(&:+) - alter )
      result += num
    end
  end
  result
end
