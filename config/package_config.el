; package_config.el --- 
; Copyright (C) 2018 
; Author:  <ZHANG, Zhen <zhen@zzhang.org>>
; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License as
; published by the Free Software Foundation, either version 3 of the
; License, or (at your option) any later version.

; This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program.  If not, see https://www.gnu.org/licenses/.


(when (not package-archive-contents)
  (package-refresh-contents))


(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    auctex
    auctex-latexmk
    py-autopep8))


(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

(use-package better-defaults)
(use-package better-shell
  :ensure t
  :bind (("C-'" . better-shell-shell)
         ("C-;" . better-shell-remote-open)))
