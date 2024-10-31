## --------------------------------------------------- ##
## ---     Figure S4 (Orthology Networking)        --- ##
## --------------------------------------------------- ##
library(orthGS)

## --- GS2
sdf <- sdf
gs2 <- sdf[which(sdf$gs == "GS2" & sdf$tax_group != "Ferns"), ]
sp <- unique(gs2$short)
o <- orthG(set = sp)
A <- o[[1]] # Adjacency matrix
g <- o[[2]] # igraph object (orthology network)
gs2 <- rownames(A)[grepl("GS2", rownames(A))]
plot(igraph::subgraph(g, vids = gs2))

## --- GS1a
gs1a <- sdf[which(sdf$gs == "GS1a" & sdf$tax_group != "Ferns"), ]
sp <- unique(gs1a$short)
o <- orthG(set = sp)
A <- o[[1]] # Adjacency matrix
g <- o[[2]] # igraph object (orthology network)
gs1a <- rownames(A)[grepl("GS1a", rownames(A))]
plot(igraph::subgraph(g, vids = gs1a))
