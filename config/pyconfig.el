(provide 'pyconfig)
(defun my/python-mode-hook ()
  ;; (add-to-list 'company-backends 'company-jedi)
  ;; (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
  (define-key python-mode-map (kbd "<f5>") 'dap-debug)
  (define-key python-mode-map (kbd "<f10>") 'dap-next)
  (define-key python-mode-map (kbd "<f11>") 'dap-step-in)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'hs-minor-mode)
  )

(use-package python-docstring
  :ensure t
  :config
  (add-hook 'python-mode-hook 'python-docstring-mode)
  )

(use-package pyvenv
  :ensure t
  :init
  (setenv "WORKON_HOME" (concat (getenv "HOME") "/.conda/envs/"))
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1)
  )

(use-package sphinx-doc
  :ensure t
  :config
  (add-hook 'python-mode-hook 'sphinx-doc-mode))

;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))

(use-package yapfify
  :ensure t
  :config (add-hook 'python-mode-hook 'yapf-mode)
)

;; (use-package py-yapf
;;   :ensure t
;;   :config (add-hook 'python-mode-hook 'py-yapf-enable-on-save))



(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook (lambda ()
                              (python-docstring-mode 1)))


;; (use-package dap-python :after (lsp-python))
