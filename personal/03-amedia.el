;; Amedia stuff

;; Release to snap5
(defun snap-release ()
  "Release current project to snap5"
  (interactive)
  (projector-run-command-buffer "release -u snap5 snapshot" t nil)
  )

;; Create new release
(defun release ()
  "Build a new release of current projectile project"
  (interactive)
  (projector-run-command-buffer "release" t nil)
  )
