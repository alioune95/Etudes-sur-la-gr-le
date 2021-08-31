library("here")

files_names <- list.files(file.path("data"))
files_names

nb_files <- length(files_names)

data_names <- vector("list",length=nb_files)
data_names

for (i in 1 : nb_files)
{
  data_names[i] <- strsplit(files_names[i], split=".csv")
}

data_names

for (i in 1:nb_files) {
  assign(data_names[[i]],
         read.csv2(paste (here("data", files_names[i]))))
}

#on stock tous les data dans une liste
dataset_list <- vector("list",length=nb_files)

for (i in 1:nb_files) {
  dataset_list[[i]] <- get(data_names[[i]])
}

# on empile les jeux de données 
complete_data <- dataset_list[[1]]
for (i in 2:nb_files){
  complete_data <- rbind(complete_data, dataset_list[[i]])
}




install.packages("dplyr")
library("dplyr")

synop11 <- select(complete_data, numer_sta, date, pmer, t, ww, w1, w2)


write.csv(synop11, "C:/R/data/synop11.csv")