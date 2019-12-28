(setq user-mail-address "ZHANG, Zhen <zhen@zzhang.org>")


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
(prefer-coding-system 'utf-8)
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
(load "hist_related.el")
;; (load "myivy_config.el")
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



(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (setq inhibit-compacting-font-caches t)
  (setq w32-get-true-file-attributes nil)
  (run-with-idle-timer 5 t #'garbage-collect)
  ;; 显示垃圾回收信息，这个可以作为调试用
  ;; (setq garbage-collection-messages t)

  
  (setq TeX-view-program-list
        '(("Sumatra PDF" ("\"c:/Emacs/bin/SumatraPDF.exe\" -reuse-instance"
                          (mode-io-correlate " -forward-search %b %n ") " %o"))))

  (eval-after-load 'tex
    '(progn
       (assq-delete-all 'output-pdf TeX-view-program-selection)
       (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF")))
    )
  )

(use-package exec-path-from-shell
  :ensure t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(when (eq system-type 'darwin)
  (server-start)
  )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(custom-safe-themes
   (quote
    ("0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "24fc62afe2e5f0609e436aa2427b396adf9a958a8fa660edbaab5fb13c08aae6" "2540689fd0bc5d74c4682764ff6c94057ba8061a98be5dd21116bf7bf301acfb" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(fci-rule-color "#073642")
 '(hl-sexp-background-color "#121212")
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (lsp-sh solarized-theme zenburn-theme fill-column-indicator fcitx haskell-mode arc-dark-theme afternoon-theme nova-theme lsp-mode org-wild-notifier vimish-fold tabbar req-package realgud rainbow-identifiers rainbow-delimiters py-yapf py-autopep8 project-explorer powerline pdf-tools oceanic-theme nyan-mode neotree modern-cpp-font-lock meghanada material-theme magit magic-latex-buffer lsp-ui ivy-bibtex helm-themes helm-swoop helm-projectile helm-company gscholar-bibtex ghub find-file-in-project el-get dashboard counsel company-lsp company-jedi company-box cmake-project cmake-mode better-shell better-defaults auto-package-update auto-org-md auto-compile auctex-latexmk all-the-icons-ivy ac-math))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
