#' Send a postfix email
#' @param to email address of the recipient
#' @param subject subject of email
#' @param body body of the email
#' @importFrom mirCat typewrite
#' @importFrom crayon italic
#' @export

send_email <-
    function(to,
            subject,
             body) {

        command <- paste0("echo '", body, "' | mail -s", " '", subject, "' ", to)
        return_msg <- system(command, intern = TRUE)
        if (length(return_msg) > 0) {
            print(return_msg)
        } else {
            mirCat::typewrite("\tEmail", crayon::italic(subject), "in queue to", crayon::italic(to), ".\n")
        }
    }
