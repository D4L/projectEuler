public

# yay, this will be hard.
# so we have a beam with the formula y = mx+b
# the point of intersection with the ellipse 4x^2 + y^2 = 100
# => 4x^2 + (mx+b)^2 = 100
# => 4x^2 + m^2*x^2 + 2mbx + b^2 - 100 = 0
# => (4 + m^2)x^2 + (2mb)x + b^2 - 100 = 0
# => x = -2mb +- sqrt((2mb)^2 - 4(4+m^2)(b^2-100)) / 2(4+m^2)
# => x = -2mb +- sqrt(4m^2b^2 - 16b^2 + 1600 - 4m^2b^2 + 400m^2) / 2(4+m^2)
# => x = -mb +- 2*sqrt(25m^2 - b^2 + 100) / (4+m^2)
#
# okay that looks fun... now, how do we find the slope of resultant
# beam with slope c if beam with slope a hits the ellipse?
# note that the slope at any point (x,y) of the ellipse is m = -4*x/y
# we can convert that to radians by using Math.atan(-4*x/y)
# we can turn slope a into radians by Math.atan(a)
#
# Note that Math.atan only goes from Math::PI/2 to -Math::PI/2
# Also, Math.tan allows all the number, so all we really need is
# any direction
#
# thus, slope c = Math.tan(2 * Math.atan(-4*x/y) - Math.atan(a))
#
# Another useful formula to know is the b given m, x, y
# y = mx + b => b = y - mx

def tvum
  result = 0

  # this is the initial slope
  beamX, beamY = 1.4, -9.6
  beamSlope = ((10.1 - beamY) / (0.0 - beamX))

  while beamY < 8 or beamX < -0.01 or beamX > 0.01
    result += 1
    # this calculates one bounce
    beamSlope = Math.tan(2.0 * Math.atan(-4.0 * beamX / beamY) - Math.atan(beamSlope))
    beamBNew = beamY - beamSlope * beamX
    beamXNew1 = (-1.0 * beamSlope * beamBNew + 2.0 * Math.sqrt(25.0 * beamSlope ** 2 - beamBNew ** 2 + 100.0)) / (4.0 + beamSlope ** 2)
    beamXNew2 = (-1.0 * beamSlope * beamBNew - 2.0 * Math.sqrt(25.0 * beamSlope ** 2 - beamBNew ** 2 + 100.0)) / (4.0 + beamSlope ** 2)
    # either new 1 or new 2 is the correct one, (since it's a parabola),
    # so we will choose the one further from the current x
    beamX = ((beamXNew1 - beamX).abs > (beamXNew2 - beamX).abs ? beamXNew1 : beamXNew2)
    beamY = beamSlope * beamX + beamBNew
  end
  result
end
