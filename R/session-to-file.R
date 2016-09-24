#' @export
session_to_file = function(path) {
  sink(path)
  print(sessionInfo())
  sink()
}

