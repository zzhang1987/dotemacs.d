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

;; shell related
(if (eq system-type 'gnu/linux)
    (progn
      (setq explicit-shell-file-name "/usr/bin/bash")
      (setq shell-file-name "bash")
      (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
      (setenv "SHELL" shell-file-name)
      (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
      )
)

(require 'use-package)
(use-package req-package
  :ensure t)

(use-package exec-path-from-shell
  :ensure t)

;; Auto update packages
(use-package auto-package-update
  :ensure t)
(auto-package-update-maybe)

(if (eq system-type 'darwin)
    (progn
      (getenv "PATH")
      (setenv "PATH"
              (concat
               "/Library/TeX/texbin/" ":"
               (getenv "PATH")))
      )
    )
(add-to-list 'exec-path "/home/zzhang/miniconda3/bin/")

;; Auto compiling elc file
(setq load-prefer-newer t)
(defun gse-prompt-to-compile-init-file ()
  (interactive)
  (if (and
       (string-equal buffer-file-name (expand-file-name "~/.emacs/init.el"))
       (file-newer-than-file-p "~/.emacs/init.el" "~/.emacs/init.elc")
       (y-or-n-p "byte-compile init.el? "))
      (byte-compile-file "~/.emacs/init.el")))

(add-hook 'kill-buffer-hook 'gse-prompt-to-compile-init-file)
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
(require 'go_config)
(require 'mykeybindings)
(require 'pyconfig)
(require 'java_config)
(require 'mykeybindings)
(require 'others)

(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))


;; (native-comp-async "~/.config/emacs/elpa" n t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auto-async-byte-compile rainbow-identifiers yasnippet xclip vimish-fold undo-tree swiper-helm sphinx-doc solarized-theme req-package realgud rainbow-delimiters pyvenv python-docstring py-autopep8 project-explorer powerline pdf-tools ob-ipython nyan-mode nginx-mode neotree modern-cpp-font-lock magit magic-latex-buffer lsp-ui lsp-java helm-projectile helm-company helm-bibtex haskell-mode gscholar-bibtex gradle-mode go-mode git-gutter+ flycheck find-file-in-project fill-column-indicator exec-path-from-shell el-get dashboard dap-mode company-lsp company-box cmake-project cmake-mode better-shell better-defaults auto-package-update auto-org-md auto-compile auctex-latexmk all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
