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
(load "mykeybindings.el") 

(global-set-key (kbd "C-s") 'swiper)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (setq inhibit-compacting-font-caches t)
  (setq w32-get-true-file-attributes nil)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用
  ;; (setq garbage-collection-messages t)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (matlab-mode lua-mode yasnippet-snippets vimish-fold tabbar req-package realgud rainbow-identifiers rainbow-delimiters python-docstring pyim py-yapf py-autopep8 project-explorer powerline pdf-tools org-wild-notifier org-alert oceanic-theme nyan-mode neotree modern-cpp-font-lock meghanada material-theme magit magic-latex-buffer lsp-ui ivy-bibtex helm-projectile helm-company gscholar-bibtex fvwm-mode find-file-in-project exec-path-from-shell el-get ein dashboard counsel company-lsp company-jedi company-box color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmake-project cmake-mode better-shell better-defaults auto-org-md auto-compile auctex-latexmk ample-theme all-the-icons ac-math))))
