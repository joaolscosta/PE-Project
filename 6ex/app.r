P <- function(x) {
  log10(1 + (1 / x))
}

prob_3_ou_6 <- P(3) + P(6)

lim_inf <- 7
lim_sup <- 21
cont <- 0

for (i in lim_inf:lim_sup) {
  temp <- 2^i
  primeiro_dig <- as.numeric(substr(as.character(temp), 1, 1))
  if (primeiro_dig == 3 || primeiro_dig == 6) {
    cont <- cont + 1
  }
}

fraction_3_ou_6 <- cont / (21 - 7 + 1)

absolute_deviation <- abs(prob_3_ou_6 - fraction_3_ou_6)

rounded_deviation <- round(absolute_deviation, 4)
print(rounded_deviation)

