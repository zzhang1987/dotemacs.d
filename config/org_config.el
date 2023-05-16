(provide 'org_config)
(use-package auto-org-md
  :straight t)
(require 'org)
(use-package calendar
  :straight t)

(require 'org-protocol)
(with-eval-after-load 'org
  (add-to-list 'org-modules 'org-protocol)
  )

(setq org-capture-templates
      `(("c" "Captured" entry (file ,(concat "/home/zzhang/Proj/Notes/" "capture.org"))
         "* %t %:description\nlink: %l \n\n%i\n" :prepend t :empty-lines-after 1)
        ("n" "Captured Now!" entry (file ,(concat "/home/zzhang/Proj/Notes/" "capture.org"))
         "* %t %:description\nlink: %l \n\n%i\n" :prepend t :emptry-lines-after 1 :immediate-finish t)
        )
      )
;; (use-package org-wild-notifier
;;   :straight


t
;;   :config
;;   (org-wild-notifier-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(global-visual-line-mode t) 
(setq org-highlight-latex-and-related '(latex script entities))
(setq org-src-fontify-natively t)
(setq org-latex-create-formula-image-program 'imagemagick)
(add-hook 'org-mode-hook 'turn-on-flyspell)


 ;; (setq org-agenda-files (list "~/org/work.org"
 ;;                             "~/org/school.org" 
 ;;                             "~/org/home.org"))

 (setq org-agenda-include-diary t)
 (setq calendar-mark-holidays-flag t)



;(require 'org-latex)
(setq org-export-latex-listings t) 
;; Originally taken from Bruno Tavernier: \ http://thread.gmane.org/gmane.emacs.orgmode/31150/focus=31432
;; but adapted to use latexmk 4.20 or higher.  
(defun my-auto-tex-cmd ()
  "When exporting from .org with latex, automatically run latex,
       pdflatex, or xelatex as appropriate, using latexmk."
  (let ((texcmd)))
  ;; default command: oldstyle latex via dvi
  (setq texcmd "latexmk -dvi -pdfps %f")        
  ;; pdflatex -> .pdf
  (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
      (setq texcmd "latexmk -pdf %f"))
  ;; xelatex -> .pdf
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq texcmd "latexmk -pdflatex=xelatex -pdf %f"))
  ;; LaTeX compilation command
  (setq org-latex-to-pdf-process (list texcmd)))
(add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-cmd)
;; Default packages included in every tex file, pdflatex or xelatex
(setq org-export-latex-packages-alist
      '(("" "graphicx" t)
	("" "longtable" nil)
	("" "float" nil)))

(defun my-auto-tex-parameters ()
  "Automatically select the tex packages to include."
  ;; default packages for ordinary latex or pdflatex export
  (setq org-export-latex-default-packages-alist
	'(("AUTO" "inputenc" t)
	  ("T1"   "fontenc"   t)
	  (""     "fixltx2e"  nil)
	  (""     "wrapfig"   nil)
	  (""     "soul"      t)
	  (""     "textcomp"  t)
	  (""     "marvosym"  t)
	  (""     "wasysym"   t)
	  (""     "latexsym"  t)
	  (""     "amssymb"   t)
	  (""     "hyperref"  nil)))
  
  ;; Packages to include when xelatex is used
  ;; (see https://github.com/kjhealy/latex-custom-kjh for the 
  ;; non-standard ones.)
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq org-export-latex-default-packages-alist
	    '(("" "fontspec" t)
	      ("" "xunicode" t)
	      ("" "url" t)
	      ("" "rotating" t)
	      ("" "memoir-article-styles" t)
	      ("american" "babel" t)
	      ("babel" "csquotes" t)
	      ("" "listings" nil)
	      ("" "listings-sweave-xelatex" nil)
	      ("svgnames" "xcolor" t)
	      ("" "soul" t)
	      ("xetex, colorlinks=true, urlcolor=FireBrick, plainpages=false, pdfpagelabels, bookmarksnumbered" "hyperref" nil)
	      )))
  
  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
      (setq org-export-latex-classes
	    (cons '("article"
		    "\\documentclass[11pt,article,oneside]{memoir}
        \\input{vc}
        \\usepackage[style=authoryear-comp-ajs, abbreviate=true]{biblatex}
        \\bibliography{socbib}"
		    ("\\section{%s}" . "\\section*{%s}")
		    ("\\subsection{%s}" . "\\subsection*{%s}")
		    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		    ("\\paragraph{%s}" . "\\paragraph*{%s}")
		    ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
		  org-export-latex-classes))))  

(add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-parameters)

;; (setq calendar-and-diary-frame-parameters
;;       '((name . "Calendar") (title . "Calendar")
;; 	(height . 20) (width . 78)
;; 	(minibuffer . t)))
