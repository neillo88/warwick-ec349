High <- factor(ifelse(Balance >=threshold, "No","Yes"))
credit.base <- data.frame(credit.base,High)