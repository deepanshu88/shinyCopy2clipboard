.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(prefix = "copy2clipboard-assets", directoryPath = system.file("assets", package = "shinyCopy2clipboard"))
}
