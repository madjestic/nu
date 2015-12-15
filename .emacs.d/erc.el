(setq erc-modules '(
  autojoin
  button
  completion
  fill
  irccontrols
  list
  log
  match
  menu
  move-to-prompt
  netsplit
  networks
  noncommands
  notifications
  readonly
  ring
  stamp
  track))

(erc-update-modules)
(setq erc-log-channels-directory "~/irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps t)

(setq erc-autojoin-channels-alist
			'(("freenode.net"
				 "#emacs"
				 "#odforce"
				 "#gentoo"
				 "#gentoo-haskell"
				 "#gentoo-science"
				 "#julia"
				 "#haskell-beginners"
				 "#haskell-emacs"
				 "#godotengine"
				 )))
