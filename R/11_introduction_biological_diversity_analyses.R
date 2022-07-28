Tabela <- read.csv("comm.csv", sep=",", head=T)

#Which are the 5 most abundant species overall in the dataset?

soma_abundancia <- colSums(Tabela[,2:57])
abundancia_ordenada <- sort(soma_abundancia, decreasing = T)
abundancia_ordenada[c(1:5)]

#How many species are there in each plot? (Richness)

Tabela[,1] <- as.character(Tabela[,1])
Tabela_01 <- Tabela %>% mutate_if(is.numeric, ~1 * (. != 0))
soma_riqueza <- rowSums(Tabela_01[,2:57])
sites <- Tabela_01[,1]
Tabela_riqueza <- data.frame(sites, soma_riqueza)

#Which the species that is most abundant in each plot?

Especie_mais_abundante <- max.col(Tabela[,2:57])
Tabela_abundancia <- data.frame(sites, Especie_mais_abundante)
