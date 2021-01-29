 ;;; boon-balance13.el --- An Ergonomic Command Mode  -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:
(require 'boon)

;; Left hand - top row
(define-key boon-select-map "q"  'boon-select-outside-quotes)
(define-key boon-select-map "c"  'boon-select-inside-pairs) ;; Contents
(define-key boon-select-map "C"  'boon-select-comment)
(define-key boon-select-map "l"  'boon-select-justline)
(define-key boon-select-map "d"  'boon-select-document)
(define-key boon-select-map "b"  '("block" . boon-select-block))

;; Left hand - home row
(define-key boon-select-map "r"  'boon-select-borders) ;; aRound
(define-key boon-select-map "s"  '("symbol" . boon-select-wim)) ;; symbol
(define-key boon-select-map "S"  'boon-select-sentence)
(define-key boon-select-map "n"  'boon-select-content) ;; iNside
(define-key boon-select-map "t"  'boon-select-with-spaces)
(define-key boon-select-map "T"  'boon-select-org-tree)
(define-key boon-select-map "g"  'boon-select-org-table-cell)

;; Left hand - bottom row
(define-key boon-select-map "v"  '("blanks" . boon-select-blanks))
; the f-key is still free...
(define-key boon-select-map "m"  'boon-select-outside-pairs) ;; more content
(define-key boon-select-map "p"  'boon-select-paragraph)
(define-key boon-select-map "w"  'boon-select-word)

;; Right hand - top row
(define-key boon-moves-map "o"  '("⇤" . boon-beginning-of-line))
(define-key boon-moves-map "u"  '("↑" . previous-line))
(define-key boon-moves-map "U"  'backward-paragraph)
(define-key boon-moves-map "y"  '("↓" . next-line))
(define-key boon-moves-map "Y"  'forward-paragraph)
(define-key boon-moves-map ";"  '("⇥" . boon-end-of-line))

;; Right hand - home row
(define-key boon-moves-map ","  '("hop" . avy-goto-word-1))
(define-key boon-moves-map ":"  'avy-goto-char)
(define-key boon-moves-map "a"  '("⇠" . boon-smarter-backward))
(define-key boon-moves-map "A"  'boon-navigate-backward)
(define-key boon-moves-map "e"  '("←" . backward-char))
(define-key boon-moves-map "E"  'boon-smarter-upward)
(define-key boon-moves-map "i"  '("→" . forward-char))
(define-key boon-moves-map "I"  'boon-smarter-downward)
(define-key boon-moves-map "h"  '("⇢" . boon-smarter-forward))
(define-key boon-moves-map "H"  'boon-navigate-forward)
(define-key boon-moves-map "k"  'xref-find-definitions)
(define-key boon-moves-map "K"  'xref-find-references)

;; Right hand - bottom row
(define-key boon-moves-map "." '("previous point" . boon-switch-mark)) ; bacK to marK
(define-key boon-moves-map "=" 'xref-pop-marker-stack)
(define-key boon-moves-map "-"  '("↜" . boon-beginning-of-expression))
(define-key boon-moves-map "_"  'beginning-of-buffer)
(define-key boon-moves-map "j"  '("↝" . boon-end-of-expression))
(define-key boon-moves-map "J"  'end-of-buffer)
(define-key boon-command-map "x" 'boon-x-map)

;; LEFT HAND
;; Top row
(define-key boon-command-map "q" '("quote" . boon-quote-character))
(define-key boon-moves-map "Q"  'boon-qsearch-previous-at-point)
(define-key boon-moves-map "c" '("loCate backward" . boon-backward-search-map))
(define-key boon-moves-map "C"  'boon-qsearch-previous)
(define-key boon-moves-map "l" '("locate forward" . boon-forward-search-map))
(define-key boon-moves-map "L"  'boon-qsearch-next)
(define-key boon-command-map "d" 'boon-repeat-command)
(define-key boon-moves-map "D"  'boon-qsearch-next-at-point)
(define-key boon-command-map "b" '("bank" . insert-register))
(define-key boon-command-map "B" 'boon-copy-to-register)

;; Home row
(define-key boon-command-map "r" '("aRound" . boon-enclose))
(define-key boon-command-map "R" '("Record" . kmacro-start-macro))
(define-key boon-command-map "s" '("substitute" . boon-substitute-region))
(define-key boon-command-map "n" '("iNsert here" . boon-splice))
(define-key boon-command-map "N" 'yank-pop)
(define-key boon-command-map "t" '("take" . boon-take-region))
(define-key boon-command-map "T" 'boon-treasure-region) ; "treasure"
(define-key boon-command-map "g" '("goto" . boon-goto-map))

;; Bottom row - search on bottvom as c is on the top row
(define-key boon-command-map "v" 'boon-replace-by-character)
(define-key boon-command-map "V" 'boon-highlight-regexp)
(define-key boon-moves-map "f"  'undo)
; reserve F for redo?
(define-key boon-command-map "m" 'boon-c-god)
(define-key boon-command-map (kbd "C-w") 'boon-open-line-and-insert)
(define-key boon-command-map "w" '("write" . boon-set-insert-like-state))
(define-key boon-command-map "W" 'boon-open-next-line-and-insert)
(define-key boon-command-map "p" '("pinpoint" . occur))
(define-key boon-command-map "P" 'kmacro-end-or-call-macro) ; Play

;; Most of the moves are in boon-moves-map. Yet some moves do not work
;; as selectors, so they are put in the boon-command-map instead.
(define-key boon-command-map (kbd "C-u") 'scroll-down-line)
(define-key boon-command-map (kbd "C-y") 'scroll-up-line)

(define-key indent-rigidly-map "i" 'indent-rigidly-right)
(define-key indent-rigidly-map "e" 'indent-rigidly-left)

(provide 'boon-balance13)
;;; boon-balance13.el ends here
