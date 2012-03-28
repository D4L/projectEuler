public

# binomial coefficient: n C k
#  = n! / (n-k)!k!
def intChooseInts (n, k)
  pTop = (n-k+1..n).inject(1, &:*)
  pBottom = (2..k).inject(1,&:*)
  pTop/pBottom
end
