(setq user-mail-address "ZHANG, Zhen <zhen@zzhang.org>")
(set-language-environment "UTF-8")

(require 'use-package)
(use-package req-package
  :ensure t)
(use-package helm-config
  :ensure helm
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  )

;; To get path from shell
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
;; Installing company mode
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))
;; Disable the delay
(setq company-idle-delay 0)

(use-package helm-company
  :ensure t)

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "S-TAB") 'helm-company)
     (define-key company-active-map (kbd "<backtab>") 'helm-company)
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "TAB") 'helm-company)
     (define-key company-active-map (kbd "<tab>") 'helm-company)))

(set-frame-font "Source Code Pro-14")


;; Dash board
;; Or if you use use-package
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


(setq dashboard-items '((recents  . 15)
                        (agenda . 5)
                        (bookmarks . 5)
                        (projects . 5)
			))
(use-package project-explorer
  :ensure t)
(use-package nyan-mode
  :ensure t
  :config
  (nyan-mode))

(use-package rainbow-identifiers
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  )

(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode)) ;;邮件设置

(electric-pair-mode t) ;;

(use-package pyim
  :ensure t)
(use-package pyim-basedict
  :ensure t
  :after pyim
  :init
  (setq default-input-method "pyim")
  :config
  (pyim-basedict-enable)   ; 拼音词库，五笔用户 *不需要* 此行设置
  ) ; 拼音词库设置，五笔用户 *不需要* 此行设置


(setq load-prefer-newer t)
(use-package auto-compile
  :ensure t
  :init
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)
  )

(use-package realgud
  :ensure t)

(global-linum-mode 1)
(add-to-list 'load-path "~/.emacs.d/personal/config")

(load "package_config.el")
(load "mkexe.el")
(load "cppconfig.el")
(load "latex_config.el")
;(load "languatools.el")
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
(use-package tabbar
  :ensure tabbar
  :config
  (tabbar-mode 'nil)
  )

(use-package all-the-icons
  :ensure t
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pdf-tools gscholar-bibtex ac-math magic-latex-buffer rainbow-mode cmake-mode modern-cpp-font-lock zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens req-package rainbow-delimiters pyim py-autopep8 powerline operate-on-number nyan-mode move-text material-theme markdown-mode magit imenu-anywhere hl-todo helm-projectile guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region elpy el-get ein editorconfig easy-kill discover-my-major diminish diff-hl dashboard crux company-lsp cmake-project browse-kill-ring better-shell better-defaults beacon auto-org-md auto-compile auctex-latexmk anzu ace-window))))
