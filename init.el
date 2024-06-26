(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome in Emacs") ; print a default message in the empty scratch buffer opened at startup

(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package) ; guess what this one does too ?
(setq evil-want-C-u-scroll t)
(use-package evil :ensure t)
(evil-mode 1)
(use-package evil-escape :ensure t)
(evil-escape-mode)
(use-package general :ensure t)
(use-package avy :ensure t)
(use-package swiper :ensure t)
(use-package counsel :ensure t)
(use-package which-key :ensure t)
(which-key-mode)

(general-auto-unbind-keys)
(general-define-key
  "C-f" 'swiper             ; search for string in current buffer
  "M-x" 'counsel-M-x)

(use-package general :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"


    "f" '(:ignore t :which-key "files")
    "ff" 'counsel-find-file
    "fr" 'counsel-recentf
    "fs" 'save-buffer
    "fS" 'save-some-buffers

    "j" '(:ignore t :which-key "jump")
    "jj" 'avy-goto-char
    "jl" 'avy-goto-line
    "jw" 'avy-goto-word-0

    "p"  '(:ignore t :which-key "project")
    "pf" '(counsel-git :which-key "find file in git dir")
    "ps" 'counsel-git-grep   

    "b" '(:ignore t :which-key "buffers")
    "bb" 'ivy-switch-buffer
    "bd" 'kill-buffer

    "q" '(:ignore t :which-key "quit")
    "qq" 'save-buffers-kill-terminal

    "w" '(:ignore t :which-key "windows")
    "wd" 'delete-other-windows

    "'"   '(iterm-focus :which-key "iterm")
    "?"   '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
    "/"   'counsel-ag
    "TAB" '(switch-to-other-buffer :which-key "prev buffer")
    "SPC" 'counsel-M-x))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit counsel evil-escape evil-escape-mode evil which-key swiper general avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

