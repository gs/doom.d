;;; thirdstream-theme.el --- Theme Thirdstream

;; Copyright (C) 2020 Daw-Ran Liou

;; Author: Daw-Ran Liou
;; Version: 0.1
;; Package-Requires: ((emacs "24"))
;; Created with ThemeCreator, https://github.com/mswift42/themecreator.


;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;;; Code:

(deftheme thirdstream)
(let ((class '((class color) (min-colors 89)))
      (fg "#111111")
      (bg "#ffffff")
      (weak "#888888")
      (weaker "#dddddd")
      (weakest "#efefef")
      (highlight "#fda50f")
      ;; (highlight-gray "#d6d6d6")
      ;; (highlight-light-gray "#eeeeee")
      ;; (highlight-light-yellow "#fffceb")
      ;; (highlight-orange "#FDA50F")
      ;; (highlight-yellow "#fbf1a9")
      ;; (highlight-green "#9eebcf")
      ;; (highlight-blue "#cdecff")
      ;; (highlight-red "#ff725c")
      (str     "#0271b5")
      (success "#00ff00")
      (warning "#ff0000")
      (warning2 "#ff8800"))
  (custom-theme-set-faces
   'thirdstream

   ;; default
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(fringe ((,class (:background ,bg :foreground ,fg))))
   `(region ((,class (:foreground ,fg :background ,highlight))))
   `(show-paren-match ((,class (:background ,bg :foreground ,success :bold t))))
   `(show-paren-mismatch ((,class (:background ,bg :foreground ,warning :bold t))))
   `(minibuffer-prompt ((,class (:bold t :foreground ,fg))))
   `(isearch ((,class (:bold t :foreground ,warning :background ,weak))))
   `(lazy-highlight ((,class (:foreground ,fg :background ,weaker))))
   `(link ((,class (:underline t))))

   ;; mode line
   `(mode-line ((,class (:box (:line-width 1 :color nil)
                         ;; :bold t
                         :foreground ,fg :background ,weakest))))
   `(mode-line-inactive ((,class (:box (:line-width 1 :color ,weaker)
                                  :foreground ,weaker :background ,bg))))

   ;; font lock
   `(font-lock-builtin-face ((,class (:foreground ,fg))))
   `(font-lock-comment-face ((,class (:foreground ,weak))))
   `(font-lock-negation-char-face ((,class (:foreground ,fg))))
   `(font-lock-reference-face ((,class (:foreground ,fg))))
   `(font-lock-constant-face ((,class (:foreground ,fg))))
   `(font-lock-doc-face ((,class (:inherit font-lock-comment-face))))
   `(font-lock-function-name-face ((,class (:foreground ,fg))))
   `(font-lock-keyword-face ((,class (:foreground ,fg))))
   `(font-lock-string-face ((,class (:foreground ,str))))
   `(font-lock-type-face ((,class (:foreground ,fg))))
   `(font-lock-variable-name-face ((,class (:foreground ,fg))))
   `(font-lock-warning-face ((,class (:foreground ,fg :underline (:color ,warning :style wave)))))
   ;; `(highlight ((,class (:foreground ,fg :background ,highlight-yellow))))
   ;; `(idle-highlight ((,class (:foreground ,fg :background ,highlight-gray))))
   ;; `(hl-line ((,class (:background  ,highlight-light-gray))))
   `(hl-fill-column-face ((,class (:background ,weakest))))
   `(cursor ((,class (:background ,fg :foreground ,bg))))
   `(vertical-border ((,class (:foreground ,weaker))))
   `(default-italic ((,class (:italic t))))

   ;; paren
   `(parenthesis ((,class (:background ,bg :foreground ,weak))))

   ;; org
   `(org-code ((,class (:foreground ,fg))))
   `(org-hide ((,class (:foreground ,fg))))
   `(org-level-1 ((,class (:bold t :foreground ,fg :height 1.1))))
   `(org-level-2 ((,class (:bold nil :foreground ,fg))))
   `(org-level-3 ((,class (:bold t :foreground ,fg))))
   `(org-level-4 ((,class (:bold nil :foreground ,weaker))))
   `(org-date ((,class (:underline t :foreground ,fg) )))
   `(org-footnote  ((,class (:underline t :foreground ,fg))))
   `(org-link ((,class (:underline t :foreground ,fg ))))
   `(org-special-keyword ((,class (:foreground ,fg))))
   `(org-block ((,class (:foreground ,fg))))
   `(org-quote ((,class (:inherit org-block :slant italic))))
   `(org-verse ((,class (:inherit org-block :slant italic))))
   `(org-todo ((,class (:box (:line-width 1 :color ,fg) :foreground ,fg :bold t))))
   `(org-done ((,class (:box (:line-width 1 :color ,weaker) :bold t :foreground ,weaker))))
   `(org-warning ((,class (:underline t :foreground ,warning))))
   `(org-agenda-structure ((,class (:weight bold :foreground ,fg :box (:color ,fg) :background ,weaker))))
   `(org-agenda-date ((,class (:foreground ,fg :height 1.1 ))))
   `(org-agenda-date-weekend ((,class (:weight normal :foreground ,fg))))
   `(org-agenda-date-today ((,class (:weight bold :foreground ,fg :height 1.4))))
   `(org-agenda-done ((,class (:foreground ,weaker))))
   `(org-scheduled ((,class (:foreground ,fg))))
   `(org-scheduled-today ((,class (:foreground ,fg :weight bold :height 1.2))))
   `(org-ellipsis ((,class (:foreground ,fg))))
   `(org-verbatim ((,class (:foreground ,fg))))
   `(org-document-info-keyword ((,class (:foreground ,fg))))
   `(org-sexp-date ((,class (:foreground ,fg))))

   ;; ivy
   ;; `(ivy-current-match ((,class (:foreground ,fg :inherit highlight :underline t))))

   ;; undo tree
   `(undo-tree-visualizer-current-face ((,class :foreground ,fg)))
   `(undo-tree-visualizer-default-face ((,class :foreground ,fg)))
   `(undo-tree-visualizer-unmodified-face ((,class :foreground ,fg)))
   `(undo-tree-visualizer-register-face ((,class :foreground ,fg)))

   `(trailing-whitespace ((,class :foreground nil :background ,warning)))

   ;; company
   `(company-tooltip ((,class (:foreground ,fg :background ,weakest))))
   `(company-tooltip-selection ((,class (:background ,weaker :foreground ,fg))))
   `(company-tooltop-annotation ((,class (:foreground ,fg))))
   `(company-tooltip-common ((,class (:foreground ,fg :bold t))))
   `(company-tooltip-common-selection ((,class (:foreground ,fg :bold t))))
   ;; `(company-tooltip-mouse ((,class (:inherit highlight))))
   ;; `(company-echo-common ((,class (:foreground ,bg :background ,fg))))
   ;; `(company-preview ((,class (:background ,highlight-gray :foreground ,fg))))
   ;; `(company-preview-common ((,class (:foreground ,highlight-gray :foreground ,fg))))
   ;; `(company-preview-search ((,class (:foreground ,fg :background ,bg))))
   `(company-scrollbar-bg ((,class (:background ,weaker))))
   `(company-scrollbar-fg ((,class (:foreground ,weak))))
   ;; `(company-template-field ((,class (:inherit region))))

   ;; git gutter
   `(git-gutter:modified ((,class (:background ,highlight :foreground ,highlight))))
   `(git-gutter:added ((,class (:background ,success :foreground ,success))))
   `(git-gutter:deleted ((,class (:background ,warning :foreground ,warning))))

   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'thirdstream)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; thirdstream-theme.el ends here
