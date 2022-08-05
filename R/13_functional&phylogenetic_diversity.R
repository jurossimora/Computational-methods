### From taxonomic to functional and phylogenetic diversity

# Packages needed
library(vegan)
library(cluster)
library(FD)
library(SYNCSA)
library(dplyr)
library(taxize)

#data
comm <- read.csv("data/raw/cestes/comm.csv")
traits <- read.csv("data/raw/cestes/traits.csv")

head(comm)[,1:6]

head(traits)[,1:6]

rownames(comm)[1:6]

rownames(comm) <- paste0("Site ", comm[,1])
comm <- comm[,-1]
head(comm)[,1:6]

rownames(traits) <- traits$Sp
traits <- traits[,-1]
head(traits)[,1:6]

#library vegan
richness <- vegan::specnumber(comm)

shannon <- vegan::diversity(comm)
simpson <- vegan::diversity(comm, index = "simpson")

# libraries cluster and FD
gow <- cluster::daisy(traits, metric = "gower")
gow2 <- FD::gowdis(traits)
#implementations in R vary and the literature reports extensions and modifications
identical(gow, gow2) #not the same but why?

class(gow) #different classes

class(gow2)

plot(gow, gow2, asp = 1) #same values

# library SYNCSA
tax <- rao.diversity(comm)
fun <- rao.diversity(comm, traits = traits)
plot(fun$Simpson,fun$FunRao, pch = 19, asp = 1)
abline(a = 0, b = 1)

#we can use the distance matrix to calculate functional diversity indices
FuncDiv1 <- dbFD(x = gow, a = comm, messages = F)
#the returned object has Villéger's indices and Rao calculation
names(FuncDiv1)

#We can also do the calculation using the traits matrix directly
FuncDiv <- dbFD(x = traits, a = comm, messages = F)

splist <- read.csv("data/raw/cestes/splist.csv")
splist$TaxonName

#library("taxize")
classification_data <- classification(splist$TaxonName, db = "ncbi")
str(classification)
length(classification_data)

classification_data$'Arisarum vulgare'
classification_data[[1]]
classification_data[[4]]

#library(dplyr)
tible_ex <- classification_data[[1]] %>%
  filter(rank == "family")  %>%
  select(name) #returns a data.frame

extract_family <- function(x){
  if (!is.null(dim(x))) {
    y <- x %>%
    filter(rank == "family")  %>%
    pull(name)
    return(y)
  }
}

extract_family(classification_data[[1]])

families <- vector()
for(i in 1:length(classification_data)){
  f <- extract_family(classification_data[[i]])
  if (length(f) > 0) families[i] <- f
}
families
