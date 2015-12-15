(setq circe-network-options
      `(("Freenode"
         :nick "madjestic"
         :channels ("#emacs" "#odforce" "#haskell-beginners")
				 :nickserv-nick madjestic
         :nickserv-password asdfg)))

(custom-set-variables
'(browse-url-browser-function (quote browse-url-generic))
'(browse-url-generic-program "chromium-browser" t)
'(circe-default-directory "~/.circe")
'(circe-format-self-say "me > {body}"))
