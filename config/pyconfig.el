(defun my/python-mode-hook ()
  ;; (add-to-list 'company-backends 'company-jedi)
  ;; (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
  (define-key python-mode-map (kbd "C-c <f5>") 'realgud:pdb)
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
  (setenv "WORKON_HOME" "/home/zzhang/.conda/envs/")
  (pyvenv-mode 1)
  (pyvenv-tracking-mode 1))

(use-package py-yapf
  :ensure t
  :config (add-hook 'python-mode-hook 'py-yapf-enable-on-save))


(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'python-mode-hook (lambda ()
                              (python-docstring-mode 1)))


(use-package dap-python :after (lsp-python))



(when (eq system-type 'windows-nt)
  (use-package lsp-python-ms
    :ensure t
    :demand nil
    :config
    (setq lsp-python-ms-dir
          (expand-file-name "~/python-language-server/output/bin/Release/"))
    )
  )
