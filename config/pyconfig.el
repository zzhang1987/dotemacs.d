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
  :straight t
  :config
  (add-hook 'python-mode-hook 'python-docstring-mode)
  )

;; (use-package pyvenv
;;   :straight t
;;   :init
;;   (setenv "WORKON_HOME" "/opt/homebrew/Caskroom/miniforge/base/envs")
;;   (pyvenv-mode 1)
;;   (pyvenv-tracking-mode 1)
;;   (pyvenv-workon "torch-nightly")
;;   )

(use-package sphinx-doc
  :straight t
  :config
  (add-hook 'python-mode-hook 'sphinx-doc-mode))

;; (use-package elpy
;;   :straight t
;;   :init
;;   (elpy-enable))

(use-package yapfify
  :straight t
  :config (add-hook 'python-mode-hook 'yapf-mode)
)

(use-package pyvenv
  :straight t)
;; (use-package py-yapf
;;   :straight t
;;   :config (add-hook 'python-mode-hook 'py-yapf-enable-on-save))



(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook (lambda ()
                              (python-docstring-mode 1)))


(use-package ein
  :straight t)

;; (use-package dap-python :after (lsp-python))
