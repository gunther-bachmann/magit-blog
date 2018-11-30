#!/bin/sh
":"; exec emacs --quick -l "$0"
(setq warning-minimum-level :emergency) ;; ignore warnings

(menu-bar-mode -1) ;; remove menu bar
(tool-bar-mode -1) ;; remove tool bar
(scroll-bar-mode -1) ;; remove scroll bars
(blink-cursor-mode 0) ;; cursor does not blink anymore
(kill-buffer "*scratch*") ;; remove initial buffer

(defalias 'yes-or-no-p 'y-or-n-p) ;; make sure to enable short answers

;; initialize package manager
(require 'package)
(add-to-list 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; ensure use-package is installed and usable
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; dark theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config (load-theme 'sanityinc-tomorrow-night t))

;; and finally magit
(use-package magit
  :ensure t
  :bind (:map magit-status-mode-map
         ("q" . kill-emacs))
  :init (let ((pop-up-windows nil))
            (call-interactively 'magit-status)))
