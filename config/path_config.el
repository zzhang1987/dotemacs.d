(provide 'path_config)

(if (eq system-type 'darwin)
    (progn
      (add-to-list 'exec-path (concat (getenv "HOME") "/miniconda3/bin"))
      (add-to-list 'exec-path "/Library/TeX/texbin")
      (add-to-list 'exec-path "/opt/homebrew/bin")
      (setenv "PATH" "/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/homebrew/Caskroom/miniforge/base/bin:/opt/homebrew/Caskroom/miniforge/base/condabin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/sbin:/sbin:/opt/homebrew/bin" t)
      (setenv "PATH" (concat (concat (getenv "HOME") "/miniconda3/bin")  ":" (getenv "PATH")))
      )
  )

(if (eq system-type 'gnu/linux)


    (progn
      (setenv "PATH" (concat (concat (getenv "HOME") "/miniconda3/bin")  ":" (getenv "PATH")))
      (setenv "PATH" (concat (concat (getenv "HOME") "/miniforge3/bin")  ":" (getenv "PATH")))
      (setenv "PATH" (concat (concat (getenv "HOME") "/.local/bin")  ":" (getenv "PATH")))
      
      (add-to-list 'exec-path (concat (getenv "HOME") "/miniconda3/bin"))
      (add-to-list 'exec-path (concat (getenv "HOME") "/miniforge3/bin"))
      (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))
      )
    )
