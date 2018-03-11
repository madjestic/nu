(setq circe-network-options
      `(("Freenode"
         :nick "madjestic"
				 :nickserv-nick "madjestic"
         :nickserv-password "asdfg"
         :sasl-username "madjestic"
         :sasl-password "asdfg"
         :channels ("#emacs"
                    "#odforce"
                    "#haskell-beginners"
                    "#gentoo"
                    "#gentoo-haskell"))))

(custom-set-variables
'(browse-url-browser-function (quote browse-url-generic))
'(browse-url-generic-program "chromium-browser" t)
'(circe-default-directory "~/.circe")
'(circe-format-self-say "me > {body}"))

(defun circe-command-KICK (nick &optional reason)
  "Kick WHO from the current channel with optional REASON."
  (interactive "sKick who: \nsWhy: ")
  (if (not (eq major-mode 'circe-channel-mode))
      (circe-display-server-message "Not in a channel buffer.")
    (when (not reason)
      (if (string-match "^\\([^ ]*\\) +\\(.+\\)" nick)
          (setq reason (match-string 2 nick)
                nick (match-string 1 nick))
        (setq reason "-")))
    (irc-send-raw (circe-server-process)
                  (format "KICK %s %s :%s"
                          circe-chat-target nick reason))))
