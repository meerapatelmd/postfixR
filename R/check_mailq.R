#' Check postfix mail queue
#' @importFrom secretary typewrite
#' @export

check_mailq <-
    function() {
        command <- "mailq"
        return_msg <- system(command, intern = TRUE)
        secretary::typewrite("\t", return_msg, "\n")
    }
