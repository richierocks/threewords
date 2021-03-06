
single_position <- function(position, key, lang, ...){
  url <- paste0("https://api.what3words.com/position?key=", key,
                "&position=", paste(position, collapse = ","), "&lang=", lang)
  return(clean(threeword_query(url, ...)))
}

#'@title Resolve a Position to Three Identifying Words
#'@description \code{from_position} takes latitude/longitude pair (or sequence of them) and
#'resolves them to a word cluster used by what3words.
#'
#'@param key an API key obtained from \href{http://developer.what3words.com/}{what3words}.
#'
#'@param positions either a vector containing a single latitude/longitude pair, or a \emph{list} of vectors
#'for vectorised operations.
#'
#'@param lang any language code of the following: "de", "en", "es", "fr", "pt", "ru", "sv", "sw", "tr"
#'
#'@param ... further arguments to pass to httr's GET.
#'
#'@return A list containing the words, positions and language of those words.
#'
#'@seealso
#'\code{\link{from_position}} for the opposite operation.
#'
#'@examples
#'\dontrun{
#'# Ask for a single set of words from the what3words API (note: this requires an API key.
#'# Don't actually use 'ANAPIKEY'.)
#'results <- from_position(key = "ANAPIKEY", positions = c(6.385336,-36.293769), lang="en")
#'}
#'@export
from_position <- function(key, positions, lang="en", ...){
  if(is.list(positions)){
    return(lapply(positions, single_position, key, lang, ...))
  }
  return(single_position(positions, key, lang, ...))
}