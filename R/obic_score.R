#' Score the indicators for the OBI
#' 
#' This wrapper function contains the functions to weight the evaluations.
#' 
#' @param dt.ind (data.table) The table containg the data needed for OBI
#' 
#' @import data.table
#' 
#' @export
obic_score <- function(dt.ind) {
  
  # Check inputs
  checkmate::assert_data_table(dt.ind)
  
  S_C = S_P = S_B = S_M = S_T = ID =  NULL
  
  # Score the chemical indicators
  dt.ind[, S_C := -999]
  
  # Score the physical inidcators
  dt.ind[, S_P := -999]
  
  # Score the biology
  dt.ind[, S_B := -999]
  
  # Score the management
  dt.ind[, S_M := -999]
  
  # Calculate the total score
  dt.ind[, S_T := -999]
  
  # Aggregate per field
  col.sel <- colnames(dt.ind)[grepl("ID|^I_|^S_", colnames(dt.ind))]
  dt.ind <- dt.ind[, lapply(.SD, mean), by = ID, .SDcols = col.sel]
  
  return(dt.ind)
}