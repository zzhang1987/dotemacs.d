(setq user-mail-address "ZHANG, Zhen <zhen@zzhang.org>")
;; language settings
(set-language-environment "UTF-8")
(set-frame-font "Fira Code-14")
(setq default-frame-alist '((font . "Fira Code-14")))


;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(use-package req-package
  :ensure t)

(setq load-prefer-newer t)
(xterm-mouse-mode 1)

(global-linum-mode 1)
(global-auto-revert-mode)
(use-package realgud
  :ensure t)
(add-to-list 'load-path "~/.emacs.d/config")
(load "myhelm_config.el")
(load "appearance.el")
(load "basic_prog.el")
(load "mkexe.el")
(load "cppconfig.el")
(load "latex_config.el")
(load "confirm_exit.el")
(load "predictive_config.el")
(load "load_modes.el")
(load "org_config.el")
(load "mykeybindings.el")
(load "pyconfig.el")
(load "pyim_config.el")
(load "java_config.el")
(load "mykeybindings.el") 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(fci-rule-color "#3a3a3a")
 '(hl-sexp-background-color "#121212")
 '(package-selected-packages
   (quote
    (oceanic-theme yasnippet-snippets vimish-fold tabbar req-package realgud rainbow-identifiers rainbow-delimiters python-docstring pyim py-yapf py-autopep8 project-explorer powerline pdf-tools org-wild-notifier org-alert nyan-mode modern-cpp-font-lock meghanada material-theme magit magic-latex-buffer lsp-ui lsp-python helm-projectile helm-company gscholar-bibtex fvwm-mode find-file-in-project exec-path-from-shell el-get ein dashboard company-lsp company-jedi company-box color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmake-project cmake-mode better-shell better-defaults auto-org-md auto-compile auctex-latexmk ample-theme all-the-icons ac-math)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
