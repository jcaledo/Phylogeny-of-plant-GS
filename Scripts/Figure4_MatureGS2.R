## -------------------------------------------------- ##
## ---   Figure 4 (Preprotein vs Mature GS2)      --- ##
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

## --- Remove cTP from GS2 to yield mGS2 (mature GS2)
df <- data.frame(id = data$phylo_id, prot = data$prot, factor = data$gsLineage)
df$size <- nchar(df$prot)
df$pI <- unlist(lapply(strsplit(df$prot, split = ""), function(x) seqinr::computePI(x)))

# Mature version of GS2
gs2 <- df[which(df$factor == "GS2"), ]
gs2$factor <- "mGS2"
x <- round(size_dif <- mean(gs2$size) - mean(df$size[which(df$factor != "GS2")])) - 1
gs2$prot <- substr(gs2$prot, start = x, stop = gs2$size)
gs2$size <- nchar(gs2$prot)
gs2$pI <- unlist(lapply(strsplit(gs2$prot, split = ""), function(x) seqinr::computePI(x)))

# Merging dataframes
df <- rbind(df, gs2)

# Box plots
boxplot(df$size~df$factor)
boxplot(df$pI~df$factor)

## --- Tree using GS2 precursor (containing the cTP)
df_with <- df[which(df$factor != "mGS2"), ]
a_with <- orthGS::msa(sequences = df_with$prot, ids = df_with$id)$ali
rownames(a_with) <- df_with$id
utr_with <- orthGS::mltree(a_with)$tree
rtr_with <- orthGS::madRoot(utr_with)
agf <- orthGS::agf # needed to color tree
plot(rtr_with, use.edge.length = FALSE, cex = 0.5, tip.color = coltips(rtr_with), ty = "f")

## --- Tree using the mature GS protein (without the cTP)
df_without <- df[which(df$factor != "GS2"), ]
a_without <- orthGS::msa(sequences = df_without$prot, ids = df_without$id)$ali
rownames(a_without) <- df_without$id
utr_without <- orthGS::mltree(a_without)$tree
rtr_without <- orthGS::madRoot(utr_without)
plot(rtr_without, use.edge.length = FALSE, cex = 0.5, tip.color = coltips(rtr_without), ty = "f")

TreeDist::RobinsonFoulds(tree1 = rtr_with, tree2 = rtr_without, normalize = TRUE)



