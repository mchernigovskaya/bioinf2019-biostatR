library(dplyr)

library(ggplot2)
library(scales)
alpha = 0.5

set.seed(123)
n = 1000


Education = rbinom(n, 2, 0.5)
Neuroticism = rnorm(n) + Education
Salary = Education * 2 + rnorm(n) - Neuroticism * 0.3

Salary = sample(10000:11000,1) + rescale(Salary, to = c(0, 100000))
# summary(Salary)
Neuroticism = rescale(Neuroticism, to = c(0, 7))
# summary(Neuroticism)
Education = factor(Education, labels = c("Low", "Medium", "High"))
Sex = factor(sample(0:1, n, replace=T), labels = c("F", "M"))

data <- data.frame(
  Salary,
  Neuroticism,
  Education, 
  Sex
)

write.table(data, file = "Neuroticism.csv")

df <-read.table("Neuroticism.csv")

ggplot(data=df, aes(Neuroticism, Salary)) +
  geom_point() + 
  geom_smooth(method = 'lm') + 
  theme_bw()


ggplot(data=df, aes(Neuroticism, Salary)) +
  geom_point(aes(col = Education)) + 
  theme_bw()


ggplot(data=df, aes(Neuroticism, Salary)) +
  geom_point(aes(col = Education)) + 
  geom_smooth(aes(col = Education), method = 'lm') +
  theme_bw()


ggplot(data=df, aes(Neuroticism, Salary)) +
  geom_point(aes(col = Sex)) + 
  theme_bw()





# p + geom_point(alpha = alpha) + geom_smooth(method = 'lm')
# 
# p + 
#   geom_point(aes(col = Sex), alpha = alpha)# + 
#   #geom_smooth(aes(col = Education), method = 'lm') +
#  # theme(legend.background = element_rect(fill = "transparent"),
#   #      legend.justification = c(0, 1),
#    #     legend.position = c(0, 1))
# 
