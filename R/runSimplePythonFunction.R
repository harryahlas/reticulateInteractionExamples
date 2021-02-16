
runSimplePythonFunction <- function(x) {
  y <- py$simplePythonFunction(r_to_py(x))
  return(y)
}
