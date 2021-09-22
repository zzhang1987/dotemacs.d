(provide 'path_config)

(if (eq system-type 'darwin)
    (progn
      (add-to-list 'exec-path (concat (getenv "HOME") "/miniconda3/bin"))
      (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))
      )
  )

(if (eq system-type 'gnu/linux)
    (progn
      (add-to-list 'exec-path (concat (getenv "HOME") "/miniconda3/bin"))
      (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))
      )
    )
