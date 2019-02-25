(use-package better-defaults
  :ensure t)
(use-package better-shell
  :ensure t
  :bind (("C-'" . better-shell-shell)
         ("C-;" . better-shell-remote-open)))
(use-package cmake-mode
  :ensure t)
(use-package find-file-in-project
  :ensure t)
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
;; (server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode)) ;;邮件设置

(electric-pair-mode t) ;;



(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-c C-x c") 'magit-commit-create)
  (global-set-key (kbd "C-c C-x p") 'magit-push-popup)
  (global-set-key (kbd "C-c C-x l") 'magit-pull-popup))


(use-package yasnippet
  :ensure t
  :config 
  (yas/initialize)
  (yas/load-directory "~/.emacs.d/snippets")
  (yas-global-mode 1)
  )


(use-package lsp-mode
  :ensure t
  :config
  (when (eq system-type 'windows-nt)
        (setq lsp-python-ms-dir
              (expand-file-name "~/source/python-language-server/output/bin/Release/"))
        (load-file "~/.emacs.d/site-lisp/lsp-python-ms/lsp-python-ms.el")
        )
  ;; (setq lsp-python-ms-dotnet "dotnet")
  (add-hook 'python-mode-hook #'lsp)
  (require 'lsp-clients)
  )



(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-max-height 20
	lsp-ui-doc-max-width 50
	lsp-ui-sideline-ignore-duplicate t
	lsp-ui-peek-always-show t))
  
(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0
	company-tooltip-limit 10
	company-transformers nil
	company-show-numbers t
	)
  (global-company-mode +1))

(use-package company-lsp
  :ensure t
  :commands (company-lsp)
  )

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))


(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  )


