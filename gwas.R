library(data.table)

n_persons <- 1000
len_genome <- 250

# simulate uniform matrix
m <- matrix(sample(0:1, n_persons * len_genome, replace = T), nrow = n_persons, ncol = len_genome)
m <- cbind(m, sample(0:1, n_persons, replace=T))

dt <- data.table(m)
setnames(dt, c(paste("pos", 1:len_genome, sep=""), "accident"))
#dt <- dt[, is_unhealthy:=as.numeric(accident)]

write.table(dt, "accident.csv")

df <- read.table("accident.csv")

snp <- df[1:((length(df)-1))]

fisher <- function(x) {
  fisher.test(as.factor(x), as.factor(df$accident))$p.value
}

p <- apply(snp, 2, fisher)

padj <- p.adjust(p, method = "bonferroni")

p

padj