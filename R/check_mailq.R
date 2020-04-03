#' Check postfix mail queue
#' @importFrom mirCat typewrite
#' @export

check_mailq <-
    function() {
        command <- "mailq"
        return_msg <- system(command, intern = TRUE)
        mirCat::typewrite("\t", return_msg, "\n")
    }
