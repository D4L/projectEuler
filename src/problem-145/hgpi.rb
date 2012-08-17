public

def hgpi
  (1..9).collect{|n| n%4==1 ? 0 : (n%2==0 ? (20*(30**(n/2-1))) : (100*((500)**(n/4))))}.inject(:+)
end
