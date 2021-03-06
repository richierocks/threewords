single_words <- function(words, key, lang, ...){
  url <- paste0("https://api.what3words.com/w3w?key=", key,
                "&string=", paste(words, collapse = "."), "&lang=", lang)
 return(clean(threeword_query(url, ...)))
}

#'@title Resolve Three Identifying Words to a Position
#'@description \code{from_words} takes a word cluster used by what3words and
#'converts them back into latitude/longitude pairs.
#'
#'@param key an API key obtained from \href{http://developer.what3words.com/}{what3words}.
#'
#'@param words either a vector of words, for a single latitude/longitude pair, or a \emph{list} of vectors
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
#'# Ask for a single lat/long pair from the what3words API (note: this requires an API key.
#'# Don't actually use 'ANAPIKEY'.)
#'results <- from_words(key = "ANAPIKEY", words = c("turnip","basil","fruit"), lang="en)
#'}
#'@export
from_words <- function(key, words, lang="en", ...){
  if(is.list(words)){
    return(lapply(words, single_words, key, lang, ...))
  }
  return(single_words(words, key, lang, ...))
}