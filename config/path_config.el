(provide 'path_config)

(if (eq system-type 'darwin)
    (progn
      (add-to-list 'exec-path "/opt/homebrew/Caskroom/miniforge/base/bin")
      (add-to-list 'exec-path "/opt/homebrew/Caskroom/miniforge/base/condabin")
      (add-to-list 'exec-path "/Library/TeX/texbin")
      (add-to-list 'exec-path "/opt/homebrew/bin")
      (setenv "PATH" "/opt/homebrew/Caskroom/miniforge/base/bin:/opt/homebrew/Caskroom/miniforge/base/condabin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/homebrew/Caskroom/miniforge/base/bin:/opt/homebrew/Caskroom/miniforge/base/condabin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/sbin:/sbin:/opt/homebrew/bin" t)
      )
  )

(if (eq system-type 'gnu/linux)


    (progn
      (setenv "PATH" (concat (getenv "PATH") ":" (concat (getenv "HOME") "/miniconda3/bin")))
      (setenv "PATH" (concat (getenv "PATH") ":" (concat (getenv "HOME") "/mambaforge/bin")))
      (setenv "PATH" (concat (getenv "PATH") ":" (concat (getenv "HOME") "/.local/bin")))
      
      (add-to-list 'exec-path (concat (getenv "HOME") "/miniconda3/bin"))
      (add-to-list 'exec-path (concat (getenv "HOME") "/mambaforge/bin"))
      (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))
      )
    )
