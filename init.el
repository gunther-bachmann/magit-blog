;; do some package initialization
(setq warning-minimum-level :emergency)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(setq package-to-install-initially
      '(magit
        color-theme-sanityinc-tomorrow))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn
        (let* ((archives (if (null package-archive-contents)
                             (progn (package-refresh-contents)
                                    package-archive-contents)
                           package-archive-contents))
               (avail (assoc package archives)))
          (if avail
              (package-install package)))
        (require package))))

(dolist (mpackage package-to-install-initially)
  (progn
    (message (concat "Preinstall/require " (symbol-name mpackage)))
    (require-package mpackage)))

;; do some ui configuration
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(blink-cursor-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(package-selected-packages (quote (color-theme-sanityinc-tomorrow magit)))
 '(tool-bar-mode nil))

(load-theme 'sanityinc-tomorrow-night t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defalias 'yes-or-no-p 'y-or-n-p)

(delete-other-windows)

(call-interactively 'magit-status)
