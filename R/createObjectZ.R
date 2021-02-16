
createObjectZ <- function() {
  createObjectZ_path <- paste0(system.file(package = packageName()),
                               "/python/createObjectZ.py")
  reticulate::source_python(createObjectZ_path)
}
