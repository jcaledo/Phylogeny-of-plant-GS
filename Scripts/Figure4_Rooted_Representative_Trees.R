## -------------------------------------------------- ##
## ---   Figure 4 (Rooted Representative Trees)   --- ##
## -------------------------------------------------- ##
# Next we assume to be running this script from:
"[wherever_you_place_it]/Phylogeny_of_plant_GS/Scripts"

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

## --- (c)
rd <- c(0.2411, 0.2412, 0.2116, 0.1649, 0.2116)
plot(rd, ty = "b", pch = 19, cex = 2, xlab = "Root", ylab = "Relative Deviation", cex.lab = 1.5)

## --- (d)
rmad <- orthGS::madRoot(tree = utr)
agf <- orthGS::agf
plot(rmad, cex = 0.6, tip.color = orthGS::coltips(rmad))

## --- (e)
# (Note to self: see GSroot.R for details. The reconciliation method was
# implemented into the dtl_rooting funtion from the ProtDist pkg, which is a
# wrapper for the software RANGER_DTL, Bioinformatics, 34(18), 2018, 3214-3216;)
rm(list = ls())
load("../Data/Representatives.Rda")
table(repre$MP)
table(repre$OG)
table(repre$MV)
table(repre$MAD)

