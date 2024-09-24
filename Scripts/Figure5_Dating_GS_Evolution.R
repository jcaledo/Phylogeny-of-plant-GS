## --------------------------------------------------- ##
## --- Figure 5 (Dating GS evolution in seed plants) - ##
## --------------------------------------------------- ##
# Next we assume to be running this script from:
"[wherever_you_place_it]/Phylogeny_of_plant_GS/Scripts"

# Make sure you have installed the following R packages:

# MCMCtreeR
# mcmc3r

# Uncomment the lines below if required:

# install.packages(MCMCtreeR)
# install.packages(mcmcr3)
library(MCMCtreeR)
library(mcmc3r)

## --- (a)
# Posterior distribution of time divergence obtained for run #5 (0.05 substitutions/site/100Mya):
post <- read.csv2("../MCMCtree_GS_Representatives/MCMC5/mcmc5.txt", sep = "\t", header = TRUE)
posterior <- sapply(post, as.numeric)
posterior <- as.data.frame(posterior)
# Time-dated Tree:
phy <- MCMCtreeR::readMCMCtree("../MCMCtree_GS_Representatives/MCMC5/FigTree.tre")
# Plotting the time-dated tree:
MCMCtreeR::MCMC.tree.plot(phy,
                          analysis.type = "MCMCtree",
                          MCMC.chain = posterior,
                          cex.tips = 0.5,
                          time.correction = 100,
                          scale.res = c("Eon", "Period"),
                          cex.age = 0.6,
                          cex.labels = 0.6,
                          relative.heigh = 0.08,
                          col.tree = "gray40",
                          label.offset = 4,
                          no.margin = TRUE,
                          lwd.bar = 0)


## --- (b and c)
# Posterior distribution of divergence times obtained in the 8 MCMC sampling runs
#  0.005 substitutions/site/100 Mya
pos1 <- read.csv2("../MCMCtree_GS_Representatives/MCMC1/mcmc1.txt", sep = "\t", header = TRUE)
pos2 <- read.csv2("../MCMCtree_GS_Representatives/MCMC2/mcmc2.txt", sep = "\t", header = TRUE)
pos1 <- as.data.frame(sapply(pos1, as.numeric))
pos2 <- as.data.frame(sapply(pos2, as.numeric))
# 0.025 substitutions/site/100 Mya
pos3 <- read.csv2("../MCMCtree_GS_Representatives/MCMC3/mcmc3.txt", sep = "\t", header = TRUE)
pos4 <- read.csv2("../MCMCtree_GS_Representatives/MCMC4/mcmc4.txt", sep = "\t", header = TRUE)
pos3 <- as.data.frame(sapply(pos3, as.numeric))
pos4 <- as.data.frame(sapply(pos4, as.numeric))
# 0.05 substitutions/site/100 Mya
pos5 <- read.csv2("../MCMCtree_GS_Representatives/MCMC5/mcmc5.txt", sep = "\t", header = TRUE)
pos6 <- read.csv2("../MCMCtree_GS_Representatives/MCMC6/mcmc6.txt", sep = "\t", header = TRUE)
pos5 <- as.data.frame(sapply(pos5, as.numeric))
pos6 <- as.data.frame(sapply(pos6, as.numeric))
# 0.4 substitutions/site/100 Mya
pos7 <- read.csv2("../MCMCtree_GS_Representatives/MCMC7/mcmc7.txt", sep = "\t", header = TRUE)
pos8 <- read.csv2("../MCMCtree_GS_Representatives/MCMC8/mcmc8.txt", sep = "\t", header = TRUE)
pos7 <- as.data.frame(sapply(pos7, as.numeric))
pos8 <- as.data.frame(sapply(pos8, as.numeric))

# Prior distribution of divergence times
prior <- read.csv2("../MCMCtree_GS_tutorial/output/mcmc_prior.txt", sep = "\t", header = TRUE)
prior <- as.data.frame(sapply(prior, as.numeric))

# Plotting time distributions
par(mfrow = c(1,2))

plot(density(pos7[,2]), lty = 2, col = 'red', xlab = "100 Mya", main = "GS2/GS1 divergence age")
lines(density(pos5[,2]), lty = 2, col = 'green') # node t_n21
lines(density(pos3[,2]), lty = 2, col = 'blue')
lines(density(pos1[,2]), lty = 2, col = "purple")
curve(mcmc3r::dB(x, 4.16, 10.42, 0.025, 0.025), n = 5e2, add = TRUE) # cCalibration


plot(density(pos7[,3]), lty = 2, col = 'red', xlab = "100 Mya", main = "GS1a/GS1b divergence age")
lines(density(pos5[,3]), lty = 2, col = 'green') # node t_n22
lines(density(pos3[,3]), lty = 2, col = 'blue')
lines(density(pos1[,3]), lty = 2, col = "purple") # node t_n21
lines(density(prior[, 3])) # Prior

par(mfrow = c(1,1))

