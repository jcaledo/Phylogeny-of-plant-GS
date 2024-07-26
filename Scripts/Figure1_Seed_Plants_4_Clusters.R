## -------------------------------------------------- ##
## ---     Figure 1 (Seed Plants 4 Clusters)      --- ##
## -------------------------------------------------- ##
# Make sure you have installed the following R packages:

# orthGS
# EnvNJ
# muscle

# Uncomment the required lines below:

# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("muscle")
# install.packages("orthGS")
# install.packages("EnvNJ")

data <- orthGS::AngGym

## --- 1A
# (The Gin_GS1b_3, which shows a very long branch, has been removed)
a <- orthGS::msa(sequences = data$prot[-10], ids = data$phylo_id[-10])$ali
rownames(a) <- data$phylo_id[-10]
trA <- orthGS::mltree(a)$tree
ape::plot.phylo(trA, "u", edge.width = 1.2, show.tip.label = FALSE)

## --- 1B
# using metric "jensen-shannon"
trB <- EnvNJ::vect2tree(path = "../Data/n4gram", metric = "jensen-shannon")[[2]]
ape::plot.phylo(trB, "u", edge.width = 1.2, show.tip.label = FALSE)

# using metric "cosine"
githubURL <- "https://github.com/jcaledo/Phylogeny-of-plant-GS/raw/main/Data/n4gram.Rda"
load(url(githubURL))
p4 <- p4[,colnames(p4) %in% data$phylo_id[-10]]
trB <- EnvNJ::vtree(p4)[[2]]
ape::plot.phylo(trB, "u", edge.width = 1.2, show.tip.label = FALSE)


