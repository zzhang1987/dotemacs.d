(provide 'basic_prog)


(use-package better-defaults
  :straight t)



(use-package better-shell
  :straight t
  :bind (("C-'" . better-shell-shell)
         ("C-;" . better-shell-remote-open)))
(use-package cmake-mode
  :straight t)
(use-package find-file-in-project
  :straight t)
(use-package auto-compile
  :straight t
  :init
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode)
  )
;; Installing company mode
(use-package company
  :straight t
  :config
  (add-hook 'after-init-hook 'global-company-mode))
;; Disable the delay
(setq company-idle-delay 0)

(use-package helm-company
  :straight t)
(use-package projectile
  :straight t)
(use-package haskell-mode
  :straight t)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "S-TAB") 'helm-company)
     (define-key company-active-map (kbd "<backtab>") 'helm-company)
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "TAB") 'helm-company)
     (define-key company-active-map (kbd "<tab>") 'helm-company)))

(use-package flycheck
  :straight t)

(use-package project-explorer
  :straight t)
;; (server-start)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode)) ;;邮件设置

(electric-pair-mode t) ;;



(use-package magit
  :straight t
  :config
  (global-set-key (kbd "C-c C-x c") 'magit-commit-create)
  (global-set-key (kbd "C-c C-x p") 'magit-push)
  (global-set-key (kbd "C-c C-x l") 'magit-pull))
(use-package git-gutter+
  :straight t
  :config
  (progn
    (global-git-gutter+-mode)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/lsp-bridge/")
(use-package yasnippet
  :straight t
  :config
  (yas-global-mode 1))

(require 'lsp-bridge)
(global-lsp-bridge-mode)


;; (use-package yasnippet
;;   :straight t
;;   :config 
;;   (yas-load-directory "~/.snippets")
;;   (yas-global-mode 1)
;;   )


(use-package ob-ipython
  :straight t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   ;; other languages..
   ))

;; (when (eq system-type 'windows-nt)

;;   (use-package pyvenv
;;     :straight t
;;     :init
;;     (setenv "WORKON_HOME" "c:/Miniconda3/envs/")
    
;;     (pyvenv-mode 1)
;;     (pyvenv-tracking-mode 1)
;;     (pyvenv-workon "python3.6")
;;     )
;;   )

;; (when (eq system-type 'gnu/linux)
;;   (use-package pyvenv
;;     :straight t
;;     :init
;;     (setenv "WORKON_HOME" "~/.conda/envs/") 
;;     (pyvenv-mode 1)
;;     (pyvenv-tracking-mode 1)
;;     (pyvenv-workon "python3.6")
;;     )
;;   )

;; (when (eq system-type 'darwin)
;;   (use-package pyvenv
;;     :straight t
;;     :init
;;     (setenv "WORKON_HOME" "~/miniconda3/envs/")
    
;;     (pyvenv-mode 1)
;;     (pyvenv-tracking-mode 1)
;;     (pyvenv-workon "python3.6")
;;     )
;;   )

;; (use-package lsp-mode
;;   :straight t
;;   :config
;;   (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error"))
;;   (setq max-specpdl-size 32000) ;; HACK - fix bug in LSP
;;   (setq lsp-prefer-capf t)

;;   :custom
;;   (lsp-enable-codeaction t)
;;   (lsp-enable-completion-at-point t)
;;   (lsp-enable-eldoc t)
;;   (lsp-enable-flycheck t)
;;   (lsp-enable-indentation nil)
;;   (lsp-enable-indentation t)
;;   (lsp-highlight-symbol-at-point t)
;;   :hook
;;   (python-mode . lsp)
;;   (c++-mode . lsp)
;;   (c-mode . lsp)
;;   :commands lsp
;;   )



;; (use-package lsp-java
;;   :straight t
;;   :after lsp
;;   :config (add-hook 'java-mode-hook 'lsp))

;; (use-package lsp-ui
;;   :straight t
;;   :requires lsp-mode flycheck
;;   :config
;;   (setq lsp-ui-doc-max-height 20
;; 	lsp-ui-doc-max-width 50
;; 	lsp-ui-sideline-ignore-duplicate t
;; 	lsp-ui-peek-always-show t)
;;   (add-hook lsp-mode-hook 'lsp-ui-mode)
;;   )

  
(use-package company
  :straight t
  :hook (prog-mode . company-mode)
  :bind (:map company-mode-map
         ([remap completion-at-point] . company-complete))
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0
	company-tooltip-limit 10
	company-transformers nil
	company-show-numbers t
	)
  (global-company-mode +1)
  :custom
  (company-idle-delay 0)
  (company-echo-delay 0)
  (company-show-numbers t)
  (company-require-match nil)
  (company-tooltip-align-annotations t)
  (company-backends '(company-capf))
  
  )

;; (use-package company-lsp
;;   :straight t
;;   :commands (company-lsp)
;;   )

;; (use-package company-box
;;   :straight t
;;   :hook (company-mode . company-box-mode))


(use-package neotree
  :straight t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  )



;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      Fixme-mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(add-to-list 'load-path (expand-file-name "~/.emacs.d/pkg/vendors"))
(add-to-list 'load-path (expand-file-name (concat (getenv "XDG_CONFIG_HOME") "/emacs/pkg/vendors")))

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
  :straight t
  :config
  (add-hook 'python-mode-hook 'fci-mode)
  )

(use-package nginx-mode
  :straight t)


