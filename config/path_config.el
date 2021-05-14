(provide 'path_config)

(if (eq system-type 'darwin)
    (progn
      (use-package exec-path-from-shell
        :ensure t)
      (setenv "PATH"
              (shell-command-to-string "source $HOME/.zshrc && printf $PATH"))
      (setq exec-path (split-string (getenv "PATH") ":"))
      )
  )

(if (eq system-type 'gnu/linux)
    (progn
      (add-to-list 'exec-path (concat (getenv "HOME") "/miniconda3/bin"))
      (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))
      )
    )
