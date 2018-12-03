(use-package python
  :ensure elpy
  :defer t
  :mode ("\\.py\\'" . python-mode)
  :config
  (use-package py-autopep8
    :ensure t)
  )


(use-package elpy
  :ensure t
  :after python
  :config 
  (with-eval-after-load 'python (elpy-enable))
  (with-eval-after-load 'elpy
    (remove-hook 'elpy-modules 'elpy-module-flymake)
    (add-hook 'elpy-mode-hook 'elpy-rpc-python-command "python")
    (add-hook 'elpy-mode-hook 'flycheck-mode)
    (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
  (setq py-autopep8-options '("--ignore E402"))
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter")
  )

