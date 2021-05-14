(setq user-mail-address "ZHANG, Zhen <zhen@zzhang.org>")
(setq gc-cons-threshold 100000000)
(setq max-lisp-eval-depth 5000)

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-enable-at-startup nil)

  
  (unless (assoc-default "melpa" package-archives)
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
  (unless (assoc-default "org" package-archives)
    (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))
  (unless (assoc-default "marmalade" package-archives)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  (package-initialize)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  )

(require 'use-package)
(use-package req-package
  :ensure t)


;; shell related
;; (if (eq system-type 'gnu/linux)
;;     (progn
;;       (setq explicit-shell-file-name "/usr/bin/bash")
;;       (setq shell-file-name "bash")
;;       (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
;;       (setenv "SHELL" shell-file-name)
;;       (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)      
;;       )
;; )

;; Auto update packages
(use-package auto-package-update
  :ensure t)
(auto-package-update-maybe)



;; Auto compiling elc file
(setq load-prefer-newer t)

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)
  )

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      setup coding system 
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(setq default-buffer-file-coding-system 'utf-8-unix)
;; (prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")


;; modes
(xterm-mouse-mode 1)
;; (global-linum-mode 1)
(global-auto-revert-mode)
(global-hl-line-mode t)
(display-battery-mode 1)

(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path (concat (getenv "XDG_CONFIG_HOME") "/emacs/config"))
;;(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(require 'path_config)
(require 'hist_related)
(require 'myhelm_config)
(require 'appearance)
(require 'basic_prog)
(require 'dap_config)
(require 'mkexe)
(require 'cppconfig)
(require 'latex_config)
(require 'confirm_exit)
(require 'load_modes)
(require 'org_config)
(require 'go_config)
(require 'mykeybindings)
(require 'pyconfig)
(require 'java_config)
(require 'mykeybindings)
(require 'others)
(require 'tabbar_config)

(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
