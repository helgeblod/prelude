;;Follow mode
(defun split-horizontally-and-follow (columns)
  "Splits current window horizontally and switches to follow-mode"
  (interactive)
  (delete-other-windows)
  (dotimes (index columns value)
    (split-window-horizontally))
  (balance-windows)
  (follow-mode 1))

(global-set-key (kbd "C-x 1") (lambda () (interactive) (split-horizontally-and-follow 1)))
(global-set-key (kbd "C-x 2") (lambda () (interactive) (split-horizontally-and-follow 2)))
(global-set-key (kbd "C-x 3") (lambda () (interactive) (split-horizontally-and-follow 3)))
