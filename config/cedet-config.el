;;; minimial-cedet-config.el --- Working configuration for CEDET from bzr
 
;; Copyright (C) Alex Ott
;;
;; Author: Alex Ott <alexott@gmail.com>
;; Keywords: cedet, C++, Java
;; Requirements: CEDET from bzr (http://cedet.sourceforge.net/bzr-repo.shtml)
 
;; Do checkout of fresh CEDET, and use this config (don't forget to change path below)

(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet/")
(setq cedet-root-path (file-name-as-directory "~/.emacs.d/site-lisp/cedet/"))

(require 'cedet-devel-load)


;;(load-file (concat cedet-root-path "cedet-devel-load.el"))
(add-to-list 'load-path (concat cedet-root-path "contrib"))
 
;; select which submodes we want to activate
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode) 
;; Activate semantic
(semantic-mode 1)
(require 'semantic/ia)
(require 'semantic/bovine/gcc) ; or depending on you compiler
(require 'semantic/bovine/clang)


;; load contrib library
(require 'eassist)
 
;; customisation of modes
(defun zzhang/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
 
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)

  (semantic-add-system-include "/usr/include/c++/4.2.1/" 'c++-mode)
  (semantic-add-system-include "/usr/include/" 'c++-mode)  
  (semantic-add-system-include "/usr/include/" 'c-mode)  
  (semantic-add-system-include "/usr/local/include/" 'c++-mode)
  (semantic-add-system-include "/usr/local/MATLAB/R2014b/extern/include/" 'c++-mode)  
  (semantic-add-system-include "/usr/local/MATLAB/R2014b/extern/include/" 'c-mode)  

  )
(add-hook 'c-mode-common-hook 'zzhang/cedet-hook)
(add-hook 'lisp-mode-hook 'zzhang/cedet-hook)
(add-hook 'scheme-mode-hook 'zzhang/cedet-hook)
(add-hook 'emacs-lisp-mode-hook 'zzhang/cedet-hook)
(add-hook 'erlang-mode-hook 'zzhang/cedet-hook)
 
(defun zzhang/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'zzhang/c-mode-cedet-hook)
 
(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)
 
(when (cedet-ectag-version-check t)
  (semantic-load-enable-primary-ectags-support))
 
;; SRecode
(global-srecode-minor-mode 1)
 
;; EDE
;; (global-ede-mode 1)
;; (ede-enable-generic-projects)
 
 
;; Setup JAVA....
;; (require 'cedet-java)



;; if you want to enable support for gnu global
(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode)
  (semanticdb-enable-gnu-global-databases 'c++-mode))

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(when (cedet-ectag-version-check)
  (semantic-load-enable-primary-exuberent-ctags-support))


(setq c-default-style
      '((java-mode . "java")
	(awk-mode . "awk")
	(other . "K&R")))

;; (require 'auto-complete-c-headers)
;; (add-to-list 'ac-sources 'ac-source-c-headers)
;; (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;;(eval-after-load 'flycheck
;;  '(progn
;;     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
;;     (flycheck-add-next-checker 'c/c++-clang
;;                                'c/c++-googlelint 'append)))

;;; minimial-cedet-config.el ends here

