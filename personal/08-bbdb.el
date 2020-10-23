;; Bbdb stuff
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(bbdb-mua-auto-update-init 'message) ;; use 'gnus for incoming messages too
(setq bbdb-mua-auto-update-p 'create) ;; or 'create to create without asking

;;If you don't live in Northern America, you should disable the
;;syntax check for telephone numbers by saying
(setq bbdb-north-american-phone-numbers-p nil)

;;Tell bbdb about your email address:
(setq bbdb-user-mail-names
      (regexp-opt '("jonas.helgemo@webstep.no"
                    "jonas.helgemo@gmail.com")))
;;cycling while completing email addresses
(setq bbdb-complete-name-allow-cycling t)

;;No popup-buffers
(setq bbdb-use-pop-up nil)
