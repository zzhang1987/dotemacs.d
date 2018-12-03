(setq user-mail-address "ZHANG, Zhen <zhen@zzhang.org>")

(require 'use-package)
(require 'req-package)
(use-package helm-config
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  )


(set-frame-font "Source Code Pro-14")


;; Dash board
;; Or if you use use-package
(use-package dashboard
  :config
  (dashboard-setup-startup-hook))


(setq dashboard-items '((recents  . 15)
                        (agenda . 5)
                        (bookmarks . 5)
                        (projects . 5)
			))

(nyan-mode)

(use-package helm-projectile
  :config
  (helm-projectile-on)
  )

(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode)) ;;邮件设置

(electric-pair-mode t) ;;

(use-package pyim)
(use-package pyim-basedict
  :init
  (setq default-input-method "pyim")
  :config
  (pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
  ) ; 拼音词库设置，五笔用户 *不需要* 此行设置


(setq load-prefer-newer t)
(use-package auto-compile
  :init
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)
  )

(global-linum-mode 1)
(add-to-list 'load-path "~/.emacs.d/personal/config")

(load "package_config.el")
(load "mkexe.el")
(load "cppconfig.el")
(load "latex_config.el")
(load "languatools.el")
(load "confirm_exit.el")
(load "predictive_config.el")
(load "load_modes.el")
(load "org_config.el")
(load "mykeybindings.el")
(load "pyconfig.el")
(load "pyim_config.el")
(load "java_config.el")


;; 颜色
(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp/moe-theme/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/moe-theme/")


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load "color.el")
(tabbar-mode 'nil)

(use-package all-the-icons)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (project-explorer zop-to-char zenburn-theme which-key volatile-highlights undo-tree twittering-mode tabbar-ruler sphinx-doc smartrep smartparens smart-mode-line skeletor rtags req-package rainbow-delimiters pyim-wbdict py-autopep8 pdf-tools ox-twbs ov org-caldav operate-on-number ob-ipython nyan-mode mu4e-maildirs-extension move-text moe-theme modern-cpp-font-lock meghanada matlab-mode material-theme magic-latex-buffer lsp-ui lsp-python latex-preview-pane langtool json-mode jedi irony-eldoc imenu-anywhere hl-todo helm-xref helm-projectile helm-notmuch helm-make helm-bibtex guru-mode gscholar-bibtex grizzl grandshell-theme god-mode gitignore-mode gitconfig-mode git-timemachine git-messenger gist ghub+ expand-region elscreen elpy elbank el-get ein editorconfig easy-kill dracula-theme doom-themes dockerfile-mode discover-my-major dired-sidebar dired-explorer diminish diff-hl dashboard cyberpunk-theme cuda-mode csv-mode crux cquery counsel company-lsp company-jedi company-irony-c-headers company-irony cmake-project cmake-mode cmake-ide browse-kill-ring better-shell better-defaults beacon auto-package-update auto-org-md auto-compile auctex-latexmk anzu ample-theme ample-regexps all-the-icons-dired ace-window ac-math))))
