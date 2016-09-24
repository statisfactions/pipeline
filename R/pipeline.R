file.rename.mkdir <- function(from, to) {
  todir <- dirname(to)
  if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
  file.rename(from = from,  to = to)
}

#' @export
pipeline = function(path = ".") {

  ## Copy template files from package
  dirs = system.file("template_files/", package = "pipeline")
  file.copy(dirs, getwd(), recursive = TRUE)

  ## move template files up into current directory
  files = dir("template_files/", recursive = TRUE, full.names = TRUE)
  new_files = str_replace(files, "^template_files/+", "")

  mapply(file.rename.mkdir, files, new_files)

  unlink("template_files", recursive = TRUE)

}
