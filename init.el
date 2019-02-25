(setq user-mail-address "ZHANG, Zhen <zhen@zzhang.org>")
;; language settings
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
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

(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (setq inhibit-compacting-font-caches t)
  (setq w32-get-true-file-attributes nil)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用
  ;; (setq garbage-collection-messages t)
  )


(setq load-prefer-newer t)
(xterm-mouse-mode 1)

(global-linum-mode 1)
(global-auto-revert-mode)
(use-package realgud
  :ensure t)
(add-to-list 'load-path "~/.emacs.d/config")
;; (load "myhelm_config.el")
(load "myivy_config.el")
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

(global-set-key (kbd "C-s") 'swiper)
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
    (0blayout all-the-icons-ivy helm-themes helm-swoop lsp-mode auto-package-update yasnippet-snippets python-docstring vimish-fold use-package exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring beacon anzu ace-window))))

(load "mykeybindings.el") 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

