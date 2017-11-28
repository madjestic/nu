(server-force-delete)

(package-initialize)
(menu-bar-mode -1)
(font-lock-mode -1)

;; (require 'openwith)
;; (openwith-mode t)
;; (setq openwith-associations '(("\\.pdf\\'" "okular" (file))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-dwim t)
 '(ac-expand-on-auto-complete t)
 '(ac-quick-help-prefer-pos-tip t)
 '(ac-show-menu-immediately-on-auto-complete t)
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "chromium-browser" t)
 '(circe-default-directory "~/.circe")
 '(circe-format-self-say "me > {body}")
 '(circe-network-options
   (quote
    (("Freenode" :nick "madjestic" :channels
      ("#emacs" "#odforce" "#haskell-beginners" "#gentoo" "#gentoo-haskell")
      :nickserv-password asdfg))))
 '(circe-server-connected-hook nil)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(desktop-after-read-hook (quote (list-buffers)))
 '(desktop-path (quote ("~/")))
 '(desktop-save-mode t)
 '(dired-dwim-target t)
 '(dired-use-ls-dired t)
 '(diredp-hide-details-initially-flag nil)
 '(ecb-layout-name "left2")
 '(ecb-layout-window-sizes
   (quote
    (("leftSpeedbarHistory02"
      (ecb-speedbar-buffer-name 0.16 . 0.6071428571428571)
      (ecb-history-buffer-name 0.16 . 0.32142857142857145)))))
 '(ecb-options-version "2.40")
 '(fancy-splash-image nil)
 '(font-use-system-font 1)
 '(fringe-mode nil nil (fringe))
 '(global-auto-complete-mode t)
 '(global-hl-line-mode t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(holiday-general-holidays
   (quote
    ((holiday-fixed 1 1 "New Year's Day")
     (holiday-fixed 2 14 "Valentine's Day")
     (holiday-fixed 4 1 "April Fools' Day"))))
 '(holiday-other-holidays
   (quote
    ((holiday-fixed 3 26 "Vlad's Birthday")
     (holiday-fixed 11 9 "Kasia's Birthday"))))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(jabber-account-list
   (quote
    (("madjestic13"
      (:network-server . "talk.google.com")
      (:port . 5223)
      (:connection-type . ssl)))))
 '(minimap-width-fraction 0.1)
 '(minimap-window-location (quote right))
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(org-agenda-files
   (quote
    ("~/org/todo.org" "~/org/progress_matrix.org" "~/org/index.org" "~/org/test.org")))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default))))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (dired+ darkroom yafolding weechat w3m vline use-package twittering-mode tabbar sr-speedbar smooth-scrolling smooth-scroll smartparens smart-mode-line-powerline-theme shm session second-sel scheme-here scheme-complete rtags revive realgud rainbow-delimiters python-mode perl6-mode paredit org-pdfview openwith nyan-mode nurumacs nlinum move-text minimap menu-bar+ magit macrostep lui lcs julia-shell json-mode jedi jabber importmagic image+ iedit howm hlint-refactor hide-comnt helm-swoop helm-spotify helm-gtags helm-ghc helm-circe helm-c-yasnippet haskell-snippets guile-scheme gtags google-maps glsl-mode ghci-completion ggtags function-args flymake-hlint flymake-haskell-multi flycheck-perl6 flycheck-irony flycheck-haskell flycheck-ghcmod flycheck-cython fill-column-indicator ess elpy elfeed ecb djvu direx dired-sort-menu desktop desktop+ ctags company-quickhelp company-jedi company-irony company-ghci company-ghc company-auctex cmake-ide calfw buffer-move bash-completion auto-complete-octave auto-complete-clang auto-complete-chunk auto-complete-c-headers auto-complete-auctex ac-octave ac-math ac-helm ac-haskell-process 0blayout)))
 '(pdf-view-midnight-colors (quote ("grey70" . "#2d3743")))
 '(recenter-positions (quote (top middle bottom)))
 '(recenter-redisplay t)
 '(scalable-fonts-allowed t)
 '(scheme-program-name "guile" t)
 '(scroll-bar-mode nil)
 '(server-mode t)
 '(session-use-package t nil (session))
 '(sml/theme (quote respectful))
 '(smooth-scroll-mode t)
 '(speedbar-after-create-hook (quote (speedbar-frame-reposition-smartly)))
 '(speedbar-before-popup-hook nil)
 '(speedbar-default-position (quote left))
 '(speedbar-directory-button-trim-method (quote trim))
 '(speedbar-frame-parameters
   (quote
    ((minibuffer)
     (width . 10)
     (border-width . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (unsplittable . t)
     (left-fringe . 0))))
 '(speedbar-hide-button-brackets-flag t)
 '(speedbar-show-unknown-files t)
 '(speedbar-use-images nil)
 '(sr-speedbar-right-side nil)
 '(tab-stop-list
   (quote
    (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 36 38 40 44 48 52 56 64 72 80 88 96 104 112 120)))
 '(tab-width 2)
 '(tabbar-background-color nil)
 '(tabbar-mode t nil (tabbar))
 '(tabbar-mwheel-mode t nil (tabbar))
 '(tabbar-use-images nil)
 '(tool-bar-mode nil)
 '(tooltip-frame-parameters
   (quote
    ((name . "tooltip")
     (internal-border-width . 2)
     (border-width . 1)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d3743" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(agda2-highlight-coinductive-constructor-face ((t (:foreground "gold"))))
 '(agda2-highlight-datatype-face ((t (:foreground "cyan"))))
 '(agda2-highlight-function-face ((t (:foreground "deep sky blue"))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "lime green"))))
 '(agda2-highlight-keyword-face ((t (:foreground "orange"))))
 '(agda2-highlight-module-face ((t (:foreground "magenta"))))
 '(agda2-highlight-number-face ((t (:foreground "magenta"))))
 '(agda2-highlight-postulate-face ((t (:foreground "cyan"))))
 '(agda2-highlight-primitive-face ((t (:foreground "cyan"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "cyan"))))
 '(agda2-highlight-record-face ((t (:foreground "cyan"))))
 '(agda2-highlight-string-face ((t (:foreground "orange red"))))
 '(border ((t nil)))
 '(cursor ((t (:background "#707080"))))
 '(custom-button ((t (:background "black" :foreground "gray60"))))
 '(custom-button-mouse ((t (:background "grey60" :foreground "black"))))
 '(diredp-deletion ((t (:inherit ac-selection-face :background "coral3"))))
 '(diredp-dir-heading ((t (:inherit font-lock-builtin-face))))
 '(diredp-dir-name ((t (:foreground "#7474FFFF7474"))))
 '(diredp-dir-priv ((t (:foreground "#7474FFFF7474"))))
 '(diredp-exec-priv ((t (:background "firebrick"))))
 '(diredp-file-name ((t (:inherit font-lock-builtin-face))))
 '(diredp-file-suffix ((t (:foreground "medium spring green"))))
 '(diredp-link-priv ((t (:foreground "#7474FFFF7474"))))
 '(diredp-other-priv ((t (:background "orange red"))))
 '(diredp-rare-priv ((t (:foreground "cyan"))))
 '(diredp-read-priv ((t (:background "#50707e"))))
 '(diredp-symlink ((t (:foreground "cyan"))))
 '(diredp-write-priv ((t (:background "#00775a"))))
 '(fringe ((t (:background "#2d3743"))))
 '(highlight ((t (:background "chocolate"))))
 '(hl-line ((t (:inherit highlight :background "#454857"))))
 '(iedit-occurrence ((t (:inherit highlight))))
 '(link ((t (:foreground "cyan"))))
 '(menu ((t (:background "#222244" :foreground "#797985" :inverse-video t))))
 '(minimap-active-region-background ((t (:background "#454857"))))
 '(minimap-font-face ((t (:height 0.1))))
 '(popup-tip-face ((t (:background "#797985" :foreground "black" :height 0.8))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "aqua"))))
 '(speedbar-button-face ((t (:foreground "green3" :height 0.8))))
 '(speedbar-directory-face ((t (:foreground "steel blue" :height 0.8))))
 '(speedbar-file-face ((t (:foreground "light blue" :height 0.8))))
 '(speedbar-highlight-face ((t (:background "sea green" :height 0.8))))
 '(speedbar-selected-face ((t (:foreground "red" :underline t :height 0.8))))
 '(speedbar-separator-face ((t (:background "blue" :foreground "white" :overline "gray" :height 0.8))))
 '(speedbar-tag-face ((t (:foreground "yellow" :height 0.8))))
 '(tabbar-button ((t (:background "#2d3743"))))
 '(tabbar-button-highlight ((t (:inherit tabbar-default :foreground "black"))))
 '(tabbar-default ((t (:inherit variable-pitch :background "#2d3743" :foreground "grey75"))))
 '(tabbar-highlight ((t (:background "#2d3743" :foreground "aquamarine"))))
 '(tabbar-modified ((t (:inherit tabbar-default :foreground "dark orange"))))
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "medium sea green"))))
 '(tabbar-selected-modified ((t (:inherit tabbar-default :foreground "red"))))
 '(tabbar-unselected ((t (:inherit tabbar-default))))
 '(tooltip ((t (:inherit variable-pitch :background "#797985" :foreground "black" :height 0.8))))
 '(vertical-border ((t (:foreground "#1d2733"))))
 '(vhdl-speedbar-architecture-face ((t (:foreground "LightSkyBlue" :height 0.8))))
 '(vhdl-speedbar-architecture-selected-face ((t (:foreground "LightSkyBlue" :underline t :height 0.8))))
 '(vhdl-speedbar-package-face ((t (:foreground "Grey80" :height 0.8))))
 '(vhdl-speedbar-package-selected-face ((t (:foreground "Grey80" :underline t :height 0.8))))
 '(vline ((t (:background "#454857")))))

(require 'tabbar)
; turn on the tabbar
; (tabbar-mode t)
; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,
;“User Buffer”.

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    ))) 

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(require 'package)
(add-to-list 'package-archives
    '("melpa" . 
      "http://melpa.milkbox.net/packages/") t)

(load "~/.emacs.d/hooks.el")
(load "~/.emacs.d/misc.el" )
(load "~/.emacs.d/workgroups.el" )

(require 'smooth-scroll)
(smooth-scroll-mode t)

(require 'dired-sort-menu)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

(swap-buffer-mode)
(show-paren-mode t)
(set-default 'truncate-lines t)
;;(powerline-default-theme)

;;;;;;;;;;;;;;
;; Org-mode ;;
;;;;;;;;;;;;;;

(defun fixPath(filename)
  (setq str (split-string filename "//"))
  (elt (substring (string-to-vector str) 1) 0)
  )

(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.hipnc\\'" "houdini_emacs" (file))
                              ("\\.hip\\'"   "houdini_emacs" (file))
                              ("\\.3b\\'"    "3D-coat"       (file))
                              ("\\.mkv\\'"   "mpv"           (file))
                              ("\\.mp4\\'"   "mpv"           (file))
                              ("\\.mov\\'"   "mpv"           (file))
                              ("\\.avi\\'"   "mpv"           (file))
                              ("\\.djvu\\'"  "djview"        (file))
                              ))

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)

;; (global-set-key (kbd "C-c 1") '(lambda () (interactive) (jump-to-register "1")))
;; (global-set-key (kbd "C-c 2") '(lambda () (interactive) (jump-to-register 2)))
;; (global-set-key (kbd "C-c 3") '(lambda () (interactive) (jump-to-register 3)))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c C-S-l") 'org-store-link)
(global-set-key (kbd "C-c C-S-c") 'org-capture)
(global-set-key (kbd "C-c C-S-a") 'org-agenda)
(global-set-key (kbd "C-c C-S-b") 'org-iswitchb)

(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "CANCELLED" "DONE")))

(global-set-key (kbd "C-c a") 'org-agenda)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")
(setq browse-url-default-browser "firefox")

;; * To manupulate a image under cursor.
;;
;;  M-x imagex-global-sticky-mode
(imagex-global-sticky-mode)
;;
;; * C-c + / C-c -: Zoom in/out image.
;; * C-c M-m: Adjust image to current frame size.
;; * C-c C-x C-s: Save current image.
;;
;; * Adjusted image when open image file.
;;
;;  M-x imagex-auto-adjust-mode
;; (org-mode)
(pdf-tools-install)

;;;;;;;;;;;;;;;
;; YASnippet ;;
;;;;;;;;;;;;;;;

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/plugins/yasnippet/snippets"))
(yas-global-mode 1)
(put 'narrow-to-region 'disabled nil)
(put 'scroll-left 'disabled nil)

;;;;;;;;;;;
;; STUFF ;;
;;;;;;;;;;;

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

(define-key ctl-x-map "S" 'save-current-configuration)
(define-key ctl-x-map "R" 'resume)
(define-key ctl-x-map "K" 'wipe)

(require 'dired+)

;;
;; BACKUP
;;

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.backup"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups
