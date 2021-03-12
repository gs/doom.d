;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'sketch-white)
(setq doom-theme 'sketch-black)
(setq doom-font (font-spec :family "Monolisa" :size 12))


;; Turn off title bar
;; Or use `defaults write org.gnu.Emacs HideDocumentIcon YES' in the termnial
;; https://emacs.stackexchange.com/questions/33680/how-to-remove-the-icon-in-the-titlebar
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

(add-hook 'window-setup-hook #'toggle-frame-maximized)

;; mode line
;;
(setq doom-modeline-buffer-file-name-style 'auto)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(setq doom-localleader-key ","
      doom-localleader-alt-key "M-,")

(setq company-idle-delay nil)

(after! evil
  (setq evil-move-beyond-eol t
        evil-move-cursor-back nil))

(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)

;;; Webby web web
;;;
(setq-default
 css-indent-offset             2
 js-indent-level               2
 js2-basic-offset              2
 js2-bounce-indent-p           nil
 js2-highlight-level           3
 web-mode-code-indent-offset   2
 web-mode-css-indent-offset    2
 web-mode-markup-indent-offset 2
 web-mode-script-padding       2
 web-mode-style-padding        2
 )

(use-package lispy
  :config
  (lispy-set-key-theme '(lispy c-digits)))

(use-package lispyville
  :config
  (lispyville-set-key-theme '((operators normal)
                              c-w
                              (prettify insert)
                              (atom-movement normal visual)
                              additional
                              additional-insert
                              additional-movement
                              slurp/barf-lispy)))

(add-hook! clojure-mode
  (setq clojure-indent-style 'align-arguments
        clojure-align-forms-automatically t)
  (map! (:localleader
         (:map (clojure-mode-map clojurescript-mode-map)
          "," #'cider))))

(remove-hook 'clojure-mode-hook #'rainbow-delimiters-mode)


(map! (:localleader
       (:map (clojure-mode-map clojurescript-mode-map)
        (:prefix ("e" . "eval")
         "p" #'cider-pprint-eval-last-sexp))))

(map! :leader
      :desc "Last buffer" "TAB" #'mode-line-other-buffer)

(global-set-key (kbd "s-'") 'er/expand-region)
(global-set-key (kbd "s-\"") 'er/contract-region)
;; swiper-isearch as default
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "s-f") 'swiper-isearch)
(global-set-key (kbd "s-F") '+ivy/project-search)
(global-set-key (kbd "s-P") 'counsel-M-x)
(global-set-key (kbd "s-b") 'ivy-switch-buffer)
(global-set-key (kbd "s-;") 'avy-goto-char-timer)

(after! counsel-projectile
  (counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((default counsel-projectile-switch-project-action-vc))))

(setq git-commit-summary-max-length 68)

(use-package! org-journal
  :config
  (setq
   org-journal-date-prefix "* "
   org-journal-file-format "%F.org"
   org-journal-file-type 'weekly))

(map! :leader
      :desc "Open Current Journal" "njo" #'org-journal-open-current-journal-file)

(use-package! deft
  :config
  (setq deft-directory "~/org/"
        deft-recursive t))

(map! :nv ";" #'evil-ex)
