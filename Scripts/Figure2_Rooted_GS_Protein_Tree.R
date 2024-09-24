## -------------------------------------------------- ##
## ---     Figure 2 (Rooted GS Protein Tree)      --- ##
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

a <- orthGS::msa(sequences = data$prot,
                 ids = data$phylo_id)$ali
rownames(a) <- data$phylo_id
tr <- orthGS::mltree(a)$tree # unrooted tree
rtr <- orthGS::madRoot(tr) # rooted tree
agf <- orthGS::agf # needed to color tree
ct <- orthGS::coltips(rtr) # color vector
plot(rtr, cex = 0.5, tip.color = ct, use.edge.length  = FALSE, ty = 'f' )

