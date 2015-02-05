;;; modeled on:
;;; https://github.com/acowley/dotfiles/blob/master/emacs

(require 'package)

;; Make sure the packages I use are installed
(setq my-packages '(ghc haskell-mode
                    company company-ghc
                    ;;outorg
                    ;;outshine
                    ;;htmlize
                    ;;impatient-mode
                    ;;auctex
                    ;;powerline smart-mode-line smart-mode-line-powerline-theme
                    ;;monokai-theme
                    markdown-mode
                    ;;session
                    ;;projectile helm-projectile ag
                    nix-mode
                    git-commit-mode git-rebase-mode magit
                    glsl-mode yaml-mode vagrant-tramp cmake-mode
                    ;;zenburn-theme
                    buffer-move multiple-cursors
                    ;;tuareg
                    flycheck
                    hi2
                    ))

; If we run package-initialize, then add-to-list melpa, the
; package-install invocation will fail. We need the package-archives
; list setup before calling package-initialize.
(setq package-archives '(;("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

; Fetch the list of available packages
(unless package-archive-contents (package-refresh-contents))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (princ "Installing package ")
    (princ package)
    (newline)
    (package-install package)))
