library(arules)
library(arulesViz)
rules.all <- apriori(titanic.raw)
#inspect(rules.all)

# rules with rhs containing "Survived" only
rules.all <- apriori(titanic.raw, control = list(verbose=F),
                   parameter = list(minlen=2, supp=0.005, conf=0.8),
                   appearance = list(rhs=c("Survived=No", "Survived=Yes"),
                                     lhs=c("Class=3rd", "Age=Adult","Age=Child",
                                           "Class=1st","Class=2nd"),
                                     default="none"))
quality(rules.all) <- round(quality(rules.all), digits=3)
rules.all.sorted <- sort(rules.all, by="lift")
#inspect(rules.all.sorted)
plot(rules.all, method="grouped")
