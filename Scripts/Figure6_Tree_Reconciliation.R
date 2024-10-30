## --------------------------------------------------- ##
## ---     Figure 6 (Trees Reconciliations)        --- ##
## --------------------------------------------------- ##
# Reconciliation Conifers
library(orthGS)
# In order to reproduce this figure, youl will need to install RANGER-DTL, RANGER-DTL_RecPhyloXML, 
# and Thirdkind, as well as change conveniently the path to the working directories. Thus, the 
# following code is provided as a sample only.

## --- Conifers (12 species, 29 proteins)
# 12 species, 29 proteins
str <- ape::read.tree(text = "((((Pa,Psm),(Pp,Pin)),(Abi,Ap)),((Ara,(Pod,Nag)),(Sci,(Tba,Tax))));")
conif <- agf[which(agf$short %in% str$tip.label), ]
a <- orthGS::msa(sequences = conif$prot,
                   ids = conif$phylo_id,
                   inhouse = TRUE)
gtr <- orthGS::mltree(a$ali, gapl = TRUE)$tree
gtr <- orthGS::madRoot(gtr)

## --- Reconcilation
# Write str (species tree) and gtr (gene tree) to  file
# (conif.trees) to be used as input for RANGER-DTL
gtr$edge.length <- NULL
ape::write.tree(str)
ape::write.tree(gtr)
oldwd <- getwd()
setwd("~/Dropbox/Investigacion/Unpublished/GS/GS_evo/GS_family/TreeRec/RangerDTL_Mac/CorePrograms/")

for (i in 1:400){
  print(i)
  if (i < 201){
    d <- 1
    t <- 10
    l <- 1
  } else if (i > 201 & i < 401){
    d <- 2
    t <- 10
    l <- 1
  }
  cmd <- paste("./Ranger-DTL.mac -i conif.trees -D ", d,
               " -T ", t, " -L ", l, " -o ./DTLrec/conif/conif",i, sep = "")
  system(cmd)
}
# move files to the wished directory

## --- Aggregation support
cmd <- "./AggregateRanger.mac /Users/JCA/Dropbox/Investigacion/Unpublished/GS/GS_evo/GS_family/TreeRec/GS_TreeRec/conifGS/conif/conif > /Users/JCA/Dropbox/Investigacion/Unpublished/GS/GS_evo/GS_family/TreeRec/GS_TreeRec/conifGS/AggregateRec_conif.txt"
system(cmd)

# --- rec2xml
setwd("~/Dropbox/Investigacion/Unpublished/GS/GS_evo/GS_family/TreeRec/RANGER-DTL_RecPhyloXML")
input <- "~/Dropbox/Investigacion/Unpublished/GS/GS_evo/GS_family/TreeRec/GS_TreeRec/conifGS/conif/conif1"
output <- "~/Dropbox/Investigacion/Unpublished/GS/GS_evo/GS_family/TreeRec/GS_TreeRec/conifGS/conif.xml"
cmd <- paste("./ranger_to_recXML.py -i ", input,  " -o ", output, sep = "")
system(cmd)
# at the last line of the file, check: </recPhylo>

## --- Thirdkind (Visualization)
input <- output
output <- "~/Dropbox/Investigacion/Unpublished/GS/GS_evo/GS_family/TreeRec/GS_TreeRec/conifGS/conif.svg"
cmd <- paste("thirdkind -f ", input, " -o ", output, sep = "")
system(cmd)
setwd(oldwd)

# Note: Although the code above was used to build up Fig. 6, using RANGER-DTL
#       we have pre-computed reconciliation trees for different groups of species:
#       conifers
#       gymnosperms
#       representatives
#       selected
#       These files are provide via the R package orthGS. To access to the
#       corresponding files you can follow the instructions given bellow (change
#       conifers by the wished group):
con <- file(paste(system.file("extdata", package = "orthGS"), "/conifers", sep = ""), "r")
conif <- readLines(con)
close(con)
conif
