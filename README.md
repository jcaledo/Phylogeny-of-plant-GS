# README #

This repo contains data and script related to the paper "Phylogenetic reconciliation provides new insights on the evolutionary diversification of the glutamine synthetase gene family in seed plants".

### What can I find within the Data directory? ###

* AngGym.Rda is a dataframe containing the DNA and protein sequences, as well as other data related to the 155 GS proteins used in the paper.
* n4gram.Rda is a dataframe of 20^4 rows (each rows gives the frequency of the indicated tetrapeptide (row) found in the protein indicated by the column); there are 327 columns (GS sequences, including the 155 used in the current paper). These data are use for the Figure1_Seed_Plants_4_Clusters.R script (lines 32-37).
* n4gram directory. This directory contains, for each GS sequence, a file that represent a vector of 20^4 coordinates (frequencies of the tetrapeptides in that protein). It also contains a vlist.txt file required to run the Figure1_Seed_Plants_4_Clusters.R script and build Fig. 1B (lines 29 and 30).
* Representatives.Rda is a dataframe containing 100 six-species random samples, which have been used in Fig.3

### What can I find within the MCMCtree_GS_Representatives directory? ###

This directory contains the data (alignment in phylip format and calibrated tree), control files (ctl files) and output files of the 8 MCMCtree run described in the paper for the molecular clock dating analyses of the GS lineages splits.

### What can I find within theMCMCtree_GS_tutorial directory? ###

This directory contains the matherial required to reproduced the vignette of the same title. This documentation was gathered for my own consumption. Nevertheless, I'm making it public just in case it would be useful to others.

### Other tools ###

* I you are interested in the evolutionary history of GS in plants, you may wish to download the R package `orthGS`,
either from the CRAN repository (https://cran.r-project.org/web/packages/orthGS/index.html) or from GitHub (https://github.com/Ealedo/orthGSGH)



### Who do I talk to? ###

* Email to caledo@uma.es or elenaaledoesteban@gmail.com are welcome.
