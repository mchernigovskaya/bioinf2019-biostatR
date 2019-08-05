#--------------------------------------

?histogram
??histogram
?hist

#--------------------------------------

set.seed(42)
v <- sample(1:100, 10)
print(v)

mean(v)

median(v)

#--------------------------------------

# https://gallery.shinyapps.io/CLT_mean/

#--------------------------------------

library(ggplot2)

# число повторений
r <- 1000

# объем одной выборки
n <- 10

x <- replicate(r, runif(n))
mean_x <- apply(x, 2, mean)
mean_x <- data.frame(sample_mean = mean_x)

ggplot(mean_x) + 
  geom_histogram(aes(x = sample_mean)) +
  xlab("Sample mean") +
  theme_bw()

#--------------------------------------

n <- 10
r <- 1000
x <- replicate(r, sample(0:1, n, replace = T))
TailsDistr <- apply(x, 2, sum)

ggplot(data.frame(n_tails = TailsDistr)) + 
  geom_histogram(aes(x = n_tails)) +
  xlab("Tails distribution") +
  theme_bw()

#--------------------------------------

?t.test

x <- rnorm(n = 100, mean = 0, sd = 1)

t.test(x, mu = 0)

t.test(x, mu = -1000)

#--------------------------------------

x <- rnorm(n = 100, mean = 0, sd = 1)
y <- rnorm(n = 80, mean = 10, sd = 1)

t.test(x, y)

#--------------------------------------

df <-read.table("Neuroticism.csv")
head(df)
summary(df)

#--------------------------------------

ggplot(data=df, aes(Neuroticism, Salary)) +
  geom_point() + 
  geom_smooth(method = 'lm') + 
  theme_bw()

#--------------------------------------

ggplot(data=df, aes(Neuroticism, Salary)) +
  geom_point(aes(col = Education)) + 
  theme_bw()

#--------------------------------------

ggplot(data=df, aes(Neuroticism, Salary)) +
  geom_point(aes(col = Education)) + 
  geom_smooth(aes(col = Education), method = 'lm') +
  theme_bw()

#--------------------------------------

ggplot(data=df, aes(Neuroticism, Salary)) +
  geom_point(aes(col = Sex)) + 
  theme_bw()


