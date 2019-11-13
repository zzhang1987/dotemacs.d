(provide 'basic_prog)

(use-package realgud
  :ensure t)

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
(use-package projectile
  :ensure t)
(use-package haskell-mode
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
  (global-set-key (kbd "C-c C-x p") 'magit-push)
  (global-set-key (kbd "C-c C-x l") 'magit-pull))
(use-package git-gutter+
  :ensure t
  :config
  (progn
    (global-git-gutter+-mode)))

(use-package yasnippet
  :ensure t
  :config 
  (yas-global-mode 1)
  (yas-load-directory "~/.emacs.d/snippets")
  (yas-global-mode 1)
  )


(use-package ob-ipython
  :after pyvenv
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   ;; other languages..
   ))


(use-package pyvenv
  :ensure t
  :init  
  (setenv "WORKON_HOME" "~/.conda/envs/")
  (when (eq system-type 'windows-nt)
    (setenv "WORKON_HOME" "c:/Miniconda3/envs/")
    )
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1)
  (pyvenv-workon "python3.6")
  )

(use-package lsp-mode
  :ensure t
  :requires pyvenv
  :config
  (require 'lsp-clients)
  (use-package lsp-java
    :ensure t
    :after lsp
    :config (add-hook 'java-mode-hook 'lsp))
  :hook (python-mode . lsp)
  )
(use-package flycheck
  :ensure t)


(use-package lsp-ui
  :ensure t
  :requires lsp-mode flycheck
  :config
  (setq lsp-ui-doc-max-height 20
	lsp-ui-doc-max-width 50
	lsp-ui-sideline-ignore-duplicate t
	lsp-ui-peek-always-show t)
  (add-hook lsp-mode-hook 'lsp-ui-mode)
  )

  
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


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      Fixme-mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(add-to-list 'load-path (expand-file-name "~/.emacs.d/pkg/vendors"))
(require 'fixme-mode)
(defvar my-highlight-words
  '("FIXME" "TODO" "BUG"))
;; Ensure that the variable exists.
(defvar wcheck-language-data nil)
(push '("FIXME"
        (program . (lambda (strings)
                     (let (found)
                       (dolist (word my-highlight-words found)
                         (when (member word strings)
                           (push word found))))))
        (face . highlight)
        (read-or-skip-faces
         (nil)))
      wcheck-language-data)
(fixme-mode 1)


(use-package fill-column-indicator
  :ensure t
  :config
  (add-hook 'python-mode-hook 'fci-mode)
  )

(use-package nginx-mode
  :ensure t)
