(require 'gnus)
(require 'message)

(setq nnmail-expiry-wait '14)

(setq gnus-auto-expirable-newsgroups
      "INBOX")

(setq gnus-permanently-visible-groups "INBOX")

(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-most-recent-number))

(setq gnus-select-method
      '(nnimap "gmail"
	       (nnimap-address "imap.gmail.com")
	       (nnimap-server-port 993)
	       (nnimap-stream ssl)
               (nnir-search-engine imap)))

(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


;; http://groups.google.com/group/gnu.emacs.gnus/browse_thread/thread/a673a74356e7141f
;; (when window-system
;;   (setq gnus-sum-thread-tree-indent "  ")
;;   (setq gnus-sum-thread-tree-root "") ;; "● ")
;;   (setq gnus-sum-thread-tree-false-root "") ;; "◯ ")
;;   (setq gnus-sum-thread-tree-single-indent "") ;; "◎ ")
;;   (setq gnus-sum-thread-tree-vertical        "│")
;;   (setq gnus-sum-thread-tree-leaf-with-other "├─► ")
;;   (setq gnus-sum-thread-tree-single-leaf     "╰─► "))
;; (setq gnus-summary-line-format
;;       (concat
;;        "%0{%U%R%z%}"
;;        "%3{│%}" "%1{%d%}" "%3{│%}" ;; date
;;        "  "
;;        "%4{%-20,20f%}"               ;; name
;;        "  "
;;        "%3{│%}"
;;        " "
;;        "%1{%B%}"
;;        "%s\n"))
;; (setq gnus-summary-display-arrow t)

;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; (setq gnus-activate-level 1)

;; (setq mm-verify-option 'always)
;; (setq mm-decrypt-option 'always)
;; (setq mm-encrypt-option 'guided)
;; (setq gnus-buttonized-mime-types '("multipart/signed"))

;; (setq gnus-interactive-exit nil)
;; (add-hook 'kill-emacs-hook (lambda ()
;;                              (when (boundp 'gnus-group-exit)
;;                                (gnus-group-exit))))

;; (setq gnus-use-full-window nil)
