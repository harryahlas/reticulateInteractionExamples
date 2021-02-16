simplePythonFunction <- NULL

.onLoad <- function(libname, pkgname) {
  simplePythonFunction_module <- reticulate::import_from_path(module = "simplePythonFunction", path = system.file("python", package = packageName()))
  simplePythonFunction <<- simplePythonFunction_module$simplePythonFunction
}
