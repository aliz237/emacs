(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(unless (package-installed-p 'zenburn-theme)
  (package-refresh-contents)
  (package-install 'zenburn-theme))

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package better-defaults
  :ensure t)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))  ; Enable Elpy

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package ess
  :ensure t
  :init
  (setq ess-ask-for-ess-directory nil)
  :config

  (setq ess-default-style 'RStudio)
  (add-hook 'ess-r-mode-hook
            (lambda ()
              (setq ess-indent-level 2)
              (setq ess-continued-statement-offset 2)
              (setq ess-brace-offset 0)
              (setq ess-arg-function-offset 2)
              (setq ess-expression-offset 2)))
  (require 'ess-site))

(setq elpy-rpc-python-command "/Users/alizarringhalam/miniconda3/envs/ee2/bin/python")
(define-key elpy-mode-map (kbd "C-c C-b") 'elpy-build)

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :init
  (setq markdown-command "pandoc")
  :config
  (add-hook 'markdown-mode-hook (lambda () (visual-line-mode 1))))

(setq org-html-checkbox-type 'html)  ;; Ensure HTML checkbox rendering

(setq-default fill-column 80)  ;; Set line length limit
(add-hook 'text-mode-hook 'turn-on-auto-fill)  ;; Automatically wrap lines in text mode

;; (keymap-set-key (kbd "C-/") (kbd "C-_")) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("db86c52e18460fe10e750759b9077333f9414ed456dc94473f9cf188b197bc74" default))
 '(package-selected-packages '(## material-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq user-mail-address "alizarr@umd.edu")
