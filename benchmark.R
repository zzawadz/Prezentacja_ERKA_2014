printRes = function(descr,time) cat(sprintf(descr,time[3]),"\n")


set.seed(1)
d = 2500
x = matrix(rnorm(d^2), ncol = d)
time = system.time(x%*%x)
printRes("Mnozenie macierzy 2500x2500 - %.2f sek",time)

library(RcppArmadillo)

y = rnorm(1e5)
x = matrix(rnorm(1e5*200), ncol = 200)

time = system.time(fastLmPure(x,y))
printRes("Regresja liniowa (fastPureLM) 1e5 obserwacji, 200 zmiennych - %.2f sek",time)

time = system.time(princomp(x))
printRes("PCA (princomp) macierz wejsciowa 1e5x200 - %.2f sek",time)

x = matrix(rnorm(1e6), ncol = 1000)
time = system.time(eigen(x))
printRes("Obliczanie wartosci wlasnych (eigen) 1000x1000 - %.2f sek",time)