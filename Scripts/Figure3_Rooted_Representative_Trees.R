## -------------------------------------------------- ##
## ---   Figure 3 (Rooted Representative Trees)   --- ##
## -------------------------------------------------- ##
# Make sure you have installed the following R packages:

# orthGS
# muscle

# Uncomment the required lines below:

# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install("muscle")
# install.packages("orthGS")

data <- orthGS::AngGym

## --- (a)
str <- ape::read.tree(text = "( (Cyc,((Tba, Ap), Eph)),(Atr,Zm) );")
plot(str, edge.width = 2, show.tip.label = FALSE)

## --- (b)
githubURL <- "https://github.com/jcaledo/Phylogeny-of-plant-GS/raw/main/Data/Representatives.Rda"
load(url(githubURL))
target <- 1
representatives <-unlist(repre[target,11:16])
a <- orthGS::msa(sequences = data$prot[which(data$short %in% representatives)],
                 ids = data$phylo_id[which(data$short %in% representatives)])$ali
rownames(a) <- data$phylo_id[which(data$short %in% representatives)]
utr <- orthGS::mltree(a)$tree
plot(utr, "u", cex = 0.6, show.tip.label = TRUE)
