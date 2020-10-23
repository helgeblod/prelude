;; (setq gnus-use-cache t)

;; (setq gnus-article-date-headers '(user-defined)
;;       gnus-article-time-format
;;       (lambda (time)
;;         (let* ((date (format-time-string "%a, %d %b %Y %T %z" time))
;;                (local (article-make-date-line date 'local))
;;                (combined-lapsed (article-make-date-line date
;;                                                         'combined-lapsed))
;;                (lapsed (progn
;;                          (string-match " (.+" combined-lapsed)
;;                          (match-string 0 combined-lapsed))))
;;           (concat local lapsed))))
(with-eval-after-load "mm-decode"
  (add-to-list 'mm-discouraged-alternatives "text/html")
  (add-to-list 'mm-discouraged-alternatives "text/richtext"))
