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
 '(browse-url-generic-program "chromium-browser")
 '(circe-default-directory "~/.circe")
 '(circe-format-self-say "me > {body}")
 '(circe-network-options
   (quote
    (("Freenode" :nick "madjestic" :channels
      ("#emacs" "#odforce" "#haskell-beginners")
      :nickserv-password asdfg))))
 '(circe-server-connected-hook nil)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(desktop-after-read-hook (quote (list-buffers)))
 '(desktop-path (quote ("~/")))
 '(desktop-save-mode f)
 '(dired-dwim-target t)
 '(dired-use-ls-dired t)
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
 '(minimap-dedicated-window t)
 '(minimap-width-fraction 0.1)
 '(minimap-window-location (quote right))
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(org-agenda-files (quote ("~/org/test.org" "~/org/index.org")))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default))))
 
 '(package-archives
   (quote
    (("marmalade" . "http://marmalade-repo.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(powerline-default-separator (quote slant))
 '(scalable-fonts-allowed t)
 '(scheme-program-name "guile" t)
 '(scroll-bar-mode nil)
 '(server-mode t)
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
 '(border ((t nil)))
 '(cursor ((t (:background "#707080"))))
 '(fringe ((t (:background "#2d3743"))))
 '(highlight ((t (:background "chocolate"))))
 '(hl-line ((t (:inherit highlight :background "#454857"))))
 '(iedit-occurrence ((t (:inherit highlight))))
 '(menu ((t (:background "#222244" :foreground "#797985" :inverse-video t))))
 '(minimap-active-region-background ((t (:background "#454857"))))
 '(minimap-font-face ((t (:height 0.1))))
 '(popup-tip-face ((t (:background "#797985" :foreground "black" :height 0.8))))
 '(powerline-active2 ((t (:inherit mode-line :background "sea green"))))
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
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "medium sea green" :weight bold))))
 '(tabbar-unselected ((t (:inherit tabbar-default))))
 '(tooltip ((t (:inherit variable-pitch :background "#797985" :foreground "black" :height 0.8))))
 '(vertical-border ((t (:foreground "#1d2733"))))
 '(vhdl-speedbar-architecture-face ((t (:foreground "LightSkyBlue" :height 0.8))))
 '(vhdl-speedbar-architecture-selected-face ((t (:foreground "LightSkyBlue" :underline t :height 0.8))))
 '(vhdl-speedbar-package-face ((t (:foreground "Grey80" :height 0.8))))
 '(vhdl-speedbar-package-selected-face ((t (:foreground "Grey80" :underline t :height 0.8))))
 '(vline ((t (:background "#454857")))))

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
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
(powerline-default-theme)

;;;;;;;;;;;;;;
;; Org-mode ;;
;;;;;;;;;;;;;;

(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "okular" (file))))

(smartparens-mode)
(auto-complete-mode)

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
      browse-url-generic-program "chromium-browser")
(setq browse-url-default-browser "chromium")

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
