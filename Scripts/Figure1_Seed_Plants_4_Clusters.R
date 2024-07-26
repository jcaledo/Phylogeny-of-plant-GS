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
githubURL <- "https://github.com/jcaledo/Phylogeny-of-plant-GS/raw/main/Data/n4gram.Rda"
load(url(githubURL))
p4 <- p4[,colnames(p4) %in% data$phylo_id[-10]]
trB <- EnvNJ::vtree(p4)[[2]]
ape::plot.phylo(trB, "u", edge.width = 1.2, show.tip.label = FALSE)



v2t_js <- EnvNJ::vect2tree(path = "./n4gram_164", metric = "jensen-shannon")[[2]]
jstr <- ape::drop.tip(v2t_js, tip = c("Gin_GS1b_3","Cga_GS1a_x","Cga_GS1a_y","Cga_GS1a_z","Cga_GS1b_x",
                                      "Cga_GS1b_y","Cga_GS1b_z","Lja_GS1_1","Lja_GS1_2","Lja_GS1_3"))
plot(jstr, "u", tip.color = coltips(jstr), edge.width = 1.2, show.tip.label = FALSE)

sf <- selected_gs[which(! selected_gs$short %in% c("Lja", "Cga")),] # remove ferns from selected
sf <- sf[sf$Sec.Name_ != "Gin_GS1b_3",] # The Gin_GS1b_3, which shows a very long branch, has been removed.
a <- ProtDist::msa(sequences = sf$prot,
                   ids = sf$Sec.Name_,
                   inhouse = TRUE)


