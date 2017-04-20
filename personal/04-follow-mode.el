;;Follow mode
(defun split-into-two-horizontally-and-follow ()
  "Splits current window into 2 windows horizontally and switchs
to follow-mode"
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (balance-windows)
  (follow-mode 1))

(defun split-into-three-horizontally-and-follow ()
  "Splits current window into 4 windows horizontally and switchs
to follow-mode"
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
  (follow-mode 1))

(defun split-into-four-horizontally-and-follow ()
  "Splits current window into 4 windows horizontally and switchs
to follow-mode"
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
  (follow-mode 1))

(global-set-key (kbd "C-c 1") 'split-into-two-horizontally-and-follow)
(global-set-key (kbd "C-c 2") 'split-into-three-horizontally-and-follow)
(global-set-key (kbd "C-c 3") 'split-into-four-horizontally-and-follow)
