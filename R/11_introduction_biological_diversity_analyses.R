###Packages required

library(dplyr)
library(vegan)

###Input

tabela <- read.csv("data/raw/cestes/comm.csv", sep=",", head=T)


###Which are the 5 most abundant species overall in the dataset?

soma_abundancia <- colSums(tabela[,2:57])
abundancia_ordenada <- sort(soma_abundancia, decreasing = T)
abundancia_ordenada[c(1:5)]


###How many species are there in each plot? (Richness)

tabela[,1] <- as.character(tabela[,1])
tabela_01 <- tabela %>% mutate_if(is.numeric, ~1 * (. != 0))
riqueza_sites <- rowSums(tabela_01[,2:57])
sites <- tabela_01[,1]
tabela_riqueza <- data.frame(sites, riqueza_sites)
names(tabela_riqueza) [1] <- "Site"
names(tabela_riqueza) [2] <- "Riqueza"
tabela_riqueza


###Which the species that is most abundant in each plot?

Especie_mais_abundante <- max.col(tabela[,2:57])
tabela_abundancia <- data.frame(sites, Especie_mais_abundante)
tabela_abundancia


###Diversity indices

#Shannon diversity index

shannon_sites=c()

for(i in seq(1, nrow(tabela))){
  temp_diversity <- diversity(tabela[i, 2:57], index = "shannon")
  shannon_sites <- append(shannon_sites, temp_diversity)
}

tabela_shannon <- data.frame(sites, shannon_sites)
names(tabela_shannon)[2] <- "Shannon Diversity Index"
names(tabela_shannon)[1] <- "Site"
tabela_shannon

#Simpson diversity index

simpson_sites=c()

for(i in seq(1, nrow(tabela))){
  temp_diversity_simpson <- diversity(tabela[i, 2:57], index = "simpson")
  simpson_sites <- append(simpson_sites, temp_diversity_simpson)
}

tabela_simpson <- data.frame(sites, simpson_sites)
names(tabela_simpson)[2] <- "Simpson Diversity Index"
names(tabela_simpson)[1] <- "Site"
tabela_simpson

#Inverse Simpson

invsimpson_sites=c()

for(i in seq(1, nrow(tabela))){
  temp_diversity_invsimpson <- diversity(tabela[i, 2:57], index = "invsimpson")
  invsimpson_sites <- append(invsimpson_sites, temp_diversity_invsimpson)
}

tabela_invsimpson <- data.frame(sites, invsimpson_sites)
names(tabela_simpson)[2] <- "Inverse Simpson Diversity Index"
names(tabela_simpson)[1] <- "Site"
tabela_invsimpson
