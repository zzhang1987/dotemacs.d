(setq user-mail-address "ZHANG, Zhen <zhen@zzhang.org>")
(setq gc-cons-threshold 100000000)

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


;; Auto update packages
(use-package auto-package-update
  :ensure t)
(auto-package-update-maybe)

(add-to-list 'exec-path "/home/zzhang/miniconda3/bin/")

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      setup coding system 
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(setq default-buffer-file-coding-system 'utf-8-unix)
;; (prefer-coding-system 'utf-8)
(setenv "LANG" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LC_CTYPE" "en_US.UTF-8")


;; modes
(setq load-prefer-newer t)
(xterm-mouse-mode 1)
;; (global-linum-mode 1)
(global-auto-revert-mode)
(global-hl-line-mode t)
(display-battery-mode 1)

(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'hist_related)
(require 'myhelm_config)
(require 'appearance)
(require 'basic_prog)
(require 'mkexe)
(require 'cppconfig)
(require 'latex_config)
(require 'confirm_exit)
(require 'load_modes)
(require 'org_config)
(require 'mykeybindings)
(require 'pyconfig)
(require 'pyim_config)
(require 'java_config)
(require 'mykeybindings)

(when (eq system-type 'windows-nt)
  ;; gc visible
  (use-package gcmh
    :ensure t)
  (gcmh-mode 1)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (setq inhibit-compacting-font-caches t)
  (setq w32-get-true-file-attributes nil)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用
  ;; (setq garbage-collection-messages t)
  )

(use-package exec-path-from-shell
  :ensure t)
(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))





