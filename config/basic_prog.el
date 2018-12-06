
(use-package better-defaults)
(use-package better-shell
  :ensure t
  :bind (("C-'" . better-shell-shell)
         ("C-;" . better-shell-remote-open)))
(use-package auto-compile
  :ensure t
  :init
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)
  )
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



(use-package project-explorer
  :ensure t)
(server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode)) ;;邮件设置

(electric-pair-mode t) ;;
