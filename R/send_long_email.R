#' Send a long postfix email in a vector of lines exported to a tmp text file
#' @param to email address of the recipient
#' @param subject subject of email
#' @param vector vector to compose body of the email
#' @importFrom magrittr %>%
#' @importFrom secretary typewrite
#' @importFrom crayon italic
#' @export

send_long_email <-
    function(to,
            subject,
             vector) {

        ##Wrting vector to tempfile
        temp_txt_fn <- tempfile(fileext = ".txt")
        readr::write_lines(vector, path = temp_txt_fn)

        ##Sending email
        command <- paste0("mail -s '", subject, "' ", to, " < ", temp_txt_fn)
        return_msg <- system(command, intern = TRUE)
        if (length(return_msg) > 0) {
            print(return_msg)
        } else {
            secretary::typewrite("\tEmail", crayon::italic(subject), "in queue to", crayon::italic(to), ".\n")
        }

        unlink(temp_txt_fn)
    }
