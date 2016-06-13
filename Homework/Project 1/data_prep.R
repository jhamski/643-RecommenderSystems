#Convert pairs to a sparse matrix

library(tidyr)

#user_artists.dat
#This file contains the artists listened by each user.
#It also provides a listening count for each [user, artist] pair.

user.artists.pairwise <- read.delim('hetrec2011-lastfm-2k/user_artists.dat', sep="\t")

user.artists.matrix <- user.artists.pairwise %>%
  spread(key = artistID, value = weight) %>%
  as.matrix() %>%
  save(file = 'user_artists_matrix.RData')