# LOD2Zero
#
# Takes your nanostring output file and LOD file and returns zero when number is smaller than LOD
#
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

## Loop through columns of data frame and replace numbers with LOD equal or smaller to 0
LOD2Zero <- function(counts,LOD, output){
  output <- output
  colnum = ncol(counts)-4
  for(i in 5:colnum) {
    for (j in 1:nrow(counts)){
      detec = i - 4
      if (counts[j,i] <= LOD[detec,]){
        counts[j,i] = 0
      }
    }     # for-loop over columns
    print("done")
  }
  write.csv(counts, paste0(output,".csv"), row.names = FALSE)
}
