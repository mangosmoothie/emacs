(setq delete-old-versions -1)		; delete excess backup versions silently
(setq version-control t)		; use version control
(setq vc-make-backup-files t)		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t)				       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t)	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore)	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8)	; use utf-8 by default
(setq coding-system-for-write 'utf-8)
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character
(setq initial-scratch-message "Welcome in Emacs") ; print a default message in the empty scratch buffer opened at startup
(setq column-number-mode t)
(setq package-install-upgrade-built-in t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives
  '(("org" . "http://orgmode.org/elpa/")
    ("gnu" . "http://elpa.gnu.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package)
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
(use-package evil-surround
  :after evil
  :ensure t
  :config
  (global-evil-surround-mode 1))
(use-package evil-escape
  :after evil
  :ensure t
  :config
  (evil-escape-mode))
(use-package magit :ensure t)
(use-package avy
  :ensure t
  :config
  (ivy-mode 1))
(use-package swiper :ensure t)
(use-package counsel :ensure t)
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
(use-package smartparens-mode
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :init
  (require 'smartparens-config))
(use-package projectile :ensure t)
(use-package neotree
  :ensure t
  :after projectile
  :init
  (setq neo-theme 'nerd))

(use-package general :ensure t
  :config
  (general-auto-unbind-keys)
  (general-define-key
    "C-s" 'swiper
    "M-x" 'counsel-M-x)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
    "b" '(:ignore t :which-key "buffers")
    "bb" 'ivy-switch-buffer
    "bd" 'kill-buffer
    "bk" 'kill-buffer

    "f" '(:ignore t :which-key "files")
    "ff" 'counsel-find-file
    "fr" 'counsel-recentf
    "fs" 'save-buffer
    "fS" 'save-some-buffers

    "g" '(:ignore t :which-key "git")
    "gs" 'magit-status
    "gc" 'magit-commit

    "h" '(:ignore t :which-key "help")
    "ha" 'counsel-apropos
    "ha" 'counsel-describe-function
    "hk" 'describe-key
    "hp" 'counsel-describe-package
    "hs" 'sp-cheat-sheet
    "hv" 'counsel-describe-variable

    "j" '(:ignore t :which-key "jump")
    "jj" 'avy-goto-char
    "jl" 'avy-goto-line
    "jw" 'avy-goto-word-1

    "k" '(:ignore t :which-key "kill & sexp")
    "ko" 'delete-other-windows
    "kk" 'delete-window
    "ks" 'sp-forward-slurp-sexp
    "kb" 'sp-forward-barf-sexp

    "p"  '(:ignore t :which-key "project")
    "pb" 'project-switch-to-buffer
    "pc" 'project-compile
    "pf" '(counsel-git :which-key "find file in git dir")
    "pp" 'project-switch-project
    "ps" 'counsel-git-grep   
    "pt" 'neotree-projectile-action

    "q" '(:ignore t :which-key "quit")
    "qq" 'save-buffers-kill-terminal

    "s" '(:ignore t :which-key "sexp")
    "sb" 'sp-backward-sexp
    "sf" 'sp-forward-sexp
    "sh" 'sp-cheat-sheet
    "sn" 'sp-next-exp
    "sp" 'counsel-ag

    "w" '(:ignore t :which-key "windows")
    "wk" 'evil-window-up
    "wj" 'evil-window-down
    "wh" 'evil-window-left
    "wl" 'evil-window-right
    "w-" 'split-window-vertically
    "w/" 'split-window-horizontally

    "x" '(:ignore t :which-key "exec")
    "?"   '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
    "xx" 'eval-last-sexp

    "/"   'counsel-rg
    "TAB" '(switch-to-other-buffer :which-key "prev buffer")
    "SPC" 'counsel-M-x))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(deeper-blue))
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(neotree sequential-yank highlight-escape-sequences counsel evil-escape evil-escape-mode evil which-key swiper general avy))
 '(warning-suppress-types '((transient))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

