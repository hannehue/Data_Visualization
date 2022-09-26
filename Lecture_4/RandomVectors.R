# Practice 9

v1 = c(rexp(n = 100, 2))
v2 = c(sample(1:10, 100, TRUE))
v3 = c(rgamma(100, 2, 3))

t = data.frame(a = v1, b = v1 + v2, c = v1 + v2 + v3)

plot(t)
# sd(t) :()
# View(t)

# Practice 10

plot(t$a, type="l", ylim=range(t),
     lwd=3, col=rgb(1,0,0,0.3))

lines(t$b, type="s", lwd=2,
      col=rgb(0.3,0.4,0.3,0.9))

points(t$c, pch=20, cex=4,
       col=rgb(0,0,1,0.3))
