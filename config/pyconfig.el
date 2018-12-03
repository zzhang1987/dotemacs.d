(elpy-enable)

(with-eval-after-load 'elpy
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'elpy-rpc-python-command "python")
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (add-hook 'elpy-mode-hook 'elpy-use-ipython)
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
(setq py-autopep8-options '("--ignore E402"))


(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "--simple-prompt --pprint")
(setq elpy-shell-send-region-or-buffer 0)
(setq elpy-shell-switch-to-shell 0)

(setenv "JUPYTER_CONSOLE_TEST" "1")
(add-to-list 'python-shell-completion-native-disabled-interpreters "ipython3")
(add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter")
(setq
 python-shell-prompt-detect-enabled nil
 python-shell-interpreter "jupyter"
 python-shell-interpreter-args "console"
 )
