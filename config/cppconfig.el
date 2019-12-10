(provide 'cppconfig)
(setq cquery-executable "/usr/bin/cquery")


(when (eq system-type 'windows-nt)
  (setq cquery-executable "c:/LLVM/bin/cquery.exe")
  )

(use-package modern-cpp-font-lock
  :ensure t
  :config
  (add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
  )
(global-set-key (kbd "C-c m") 'recompile)

(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".cquery")
                projectile-project-root-files-top-down-recurring)))



(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'c-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'c++-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'python-mode-hook 'rainbow-delimiters-mode)
  )
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'company-mode) 
(add-hook 'c++-mode-hook 'yas-minor-mode) 
(add-hook 'c-mode-hook 'yas-minor-mode)

(req-package flycheck
  :ensure t
  :config
  (progn
    (global-flycheck-mode)))

(defun my/c-mode-hook ()
  (define-key c-mode-base-map "<f5>" 'realgud:gdb)
  (define-key c-mode-base-map "<f7>" 'compile)
)
(add-hook 'c-mode-hook 'my/c-mode-hook)
(add-hook 'c++-mode-hook 'my/c-mode-hook)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))


(use-package cmake-project
  :ensure t
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
	(goto-char (point-min))
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
	(goto-char (point-min))
	(while (and (not (eobp)) (forward-line))
	  (indent-according-to-mode))
	(goto-char (point-min))
	(search-forward "Description:")
	)
)
