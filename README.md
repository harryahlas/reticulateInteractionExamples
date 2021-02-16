# reticulateInteractionExamples

## Examples of how to include python in an R package

### Sourcing a Python Script

1. Add your python script (we'll call it *createObjectZ.py*) to your package's *inst/python* folder.
2. In your package's R directory, create a file with a function to source the script called, for example, *createObjectZ.R*. Note that the R file does not have to have the same name as the python file.

<code>
createObjectZ <- function() {
  createObjectZ_path <- paste0(system.file(package = packageName()),
                               "/python/createObjectZ.py")
  reticulate::source_python(createObjectZ_path)
}
</code>

3. Running <code>createObjectZ()</code> after the library has loaded will run *createObjectZ.py*.  


### Creating a python function for use in R

This creates a function that is available immediately upon loading the library.

1. Add your python script (we'll call it *simplePythonFunction.py*) to your package's *inst/python* folder.
2. Open *R/zzz.R* (or create if needed) and add this code:

<code>
simplePythonFunction <- NULL

.onLoad <- function(libname, pkgname) {
  simplePythonFunction_module <- reticulate::import_from_path(module = "simplePythonFunction", path = system.file("python", package = packageName()))
  simplePythonFunction <<- simplePythonFunction_module$simplePythonFunction
}
</code>

3. add <code>export(simplePythonFunction)</code> to your *NAMESPACE* file.
