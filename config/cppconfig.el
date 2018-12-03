(setq cquery-executable "/usr/bin/cquery")
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
(global-set-key (kbd "C-c m") 'recompile)
(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".cquery")
                projectile-project-root-files-top-down-recurring)))

(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

(use-package cquery
  :commands lsp-cquery-enable
  :init (add-hook 'c-mode-hook #'cquery//enable)
  (add-hook 'c++-mode-hook #'cquery//enable)
  (setq cquery-sem-highlight-method 'font-lock)
  ;; alternatively, (setq cquery-sem-highlight-method 'overlay)

  ;; For rainbow semantic highlighting
  ;; (cquery-use-default-rainbow-sem-highlight)
  )

(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
(use-package company)
(use-package company-lsp
  :init
  (add-hook 'c-mode-hook 'company-mode)
  (add-hook 'c++-mode-hook 'company-mode) 
  (add-hook 'c++-mode-hook 'yas-minor-mode) 
  (add-hook 'c-mode-hook 'yas-minor-mode)
  :config
  (push 'company-lsp company-backends)
  )
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'c-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'c++-mode-hook 'rainbow-delimiters-mode)
  )

(use-package magit
  :ensure t)

(req-package flycheck
  :config
  (progn
    (global-flycheck-mode)))


(req-package projectile
  :config
  (progn
    (projectile-global-mode)
    ))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))


(use-package cmake-project
  :config
  (defun maybe-cmake-project-hook ()
    (if (file-exists-p "CMakeLists.txt") (cmake-project-mode)))
  :init
  (add-hook 'c-mode-hook 'maybe-cmake-project-hook)
  (add-hook 'c++-mode-hook 'maybe-cmake-project-hook)
  )

(setq c-default-style "linux"
      c-basic-offset 4)
;; (define-key c-mode-base-map (kbd "C-R") 'compile)




(defun ska-skel-cc-class (name)
  "Insert a C++ class definition.
 It creates a matching header file, inserts the class definition and
 creates the  most important function templates in a named after the
 class name. This might still be somewhat buggy."
  (interactive "sclass name: ")
  (let* ((header-file-name (concat (downcase name) ".hh"))
		 (header-include-string (upcase (concat name "_HH_INCLUDED")))
		 (def-file-name    (concat (downcase name) ".cc")))

	;; write header file
	(set-buffer (get-buffer-create header-file-name))
	(set-visited-file-name header-file-name)
	(c++-mode)
	(turn-on-font-lock)
	(insert (concat
			 "// -*- C++ -*-\n"
			 "// File: " header-file-name "\n//\n"
			 "// Time-stamp: <>\n"
			 "// $Id: $\n//\n"
			 "// Copyright (C) "(substring (current-time-string) -4)
			 " by School of Computing, National University of Singapore" "\n//\n"
			 "// Author: " (user-full-name) "\n//\n"
			 "// Description: \n// "
			 ;; get this point...
			 "\n\n" 
			 "# ifndef " header-include-string "\n"
			 "# define " header-include-string "\n\n"
			 "# include <iostream>\n\n"
			 "class " name ";\n\n"
			 "class " name " {\n"
			 "public:\n"
			 name "();" "\n"
			 name "(const " name "& src);\n"
			 "~" name "();" "\n"
			 name "& operator=(const " name "& rv);\n"
			 "\nprivate:\n"
			 "void init();\n"
			 "void reset();\n"
			 "void init_and_copy(const " name "& src);\n\n"
			 "protected: \n\n"
			 "};"
			 "\n\n# endif"))
	(beginning-of-buffer)
	(while (and (not (eobp)) (forward-line))
	  (indent-according-to-mode))
	
	;; create CC file
	(set-buffer (get-buffer-create def-file-name))
	(set-visited-file-name def-file-name)
	(switch-to-buffer (current-buffer))
	(c++-mode)
	(turn-on-font-lock)
	(insert (concat
			 "// -*- C++ -*-\n"
			 "// File: " def-file-name "\n//\n"
			 "// Time-stamp: <>\n"
			 "// $Id: $\n//\n"
			 "// Copyright (C) "(substring (current-time-string) -4)
			 " by School of Computing, National University of Singapore"  "\n//\n"
			 "// Author: " (user-full-name) "\n//\n"
			 "// Description: \n// "
			 "\n# include \"" header-file-name "\"\n\n"
			 name "::\n" name "() {\ninit();\n}\n\n"
			 name "::\n" name "(const " name "& src) {\ninit_and_copy(src);\n}\n\n"

		         name "::\n~" name "() {\nreset();\n}\n\n"
			 "void\n" name "::\ninit() {\n\n}\n\n"
			 "void\n" name "::\nreset() {\n\n}\n\n"
			 "void\n" name "::\ninit_and_copy(const " name "& src) {\n\n}\n\n"
			 name "&\n" name "::\noperator=(const " name "& src) {\n\n}\n\n"
			 ))
	(beginning-of-buffer)
	(while (and (not (eobp)) (forward-line))
	  (indent-according-to-mode))
	(beginning-of-buffer)
	(search-forward "Description:")
	)
)
