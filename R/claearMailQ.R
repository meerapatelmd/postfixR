#' Clear MailQ
#' @export




clearMailQ <-
    function() {
        system("sudo postsuper -S -d ALL")
    }
