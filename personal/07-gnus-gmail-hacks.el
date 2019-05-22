;; Some stupid Gmail hacks to make it play nicer with Gnus (in my
;; opinion).

;; Please load these AFTER you have loaded and initialized BOTH gnus
;; and org-mode (if you use org-mode, but of course you do). Load with
;; (load-library "/path/to/file/gnus-gmail-archive.el") or .elc if you
;; run byte compiled, which I generally do.

;;-----------------------

;; First stupid Gmail hack: additional keybindings to move Gmail
;; messages around easily.

;; Reading an email in Gnus doesn't move it from the INBOX, by design.
;; Mail needs to be moved, not just read, to get it out of the Gmail
;; INBOX. Archiving moves it to "All Mail" (even though it's already
;; there, which is kind of silly but that's how it works). Moving to
;; Spam or Trash work as expected; the article moves out of INBOX
;; /and/ 'All Mail'.  You can also move something /to/ INBOX, say from
;; Spam or Trash in case of false positives. But moving from 'All
;; Mail' to INBOX doesn't delete the mail from 'All Mail'. It's the
;; Gmail way.

;; To use these, just put the cursor on the mail you want to move (in
;; the group summary). Alternatively, process mark a selection of
;; mails (with '#') to have them all moved at once (to the same place,
;; of course).

;; Of course you can do these things with Gnus B-m (bulk move) but it
;; requires more typing. This way is very fast.

;; To see the effects you will have to sync back with Gmail by using
;; the 'g' command in the Group buffer.

;; Another feature "missing" in gnus is the ability to reply to
;; something that came in from gmail, and simultaneously send the
;; reply and archive the received mail. Ctrl-c d will do that
;; here. It's not completely robust as currently coded, but it works.

;; USAGE: prefix v (reserved by gnus for user stuff?) then
;; a=archive (to 'all mail')
;; A=archive all (to 'all mail')
;; s=spam
;; S=mark all articles as spam and move to Spam
;; t=trash
;; T=trash all articles
;; i=inbox (move something back to INBOX)
;; e=empty spam or trash (delete all); only in Spam or Trash groups
;; ctrl-c d (no 'v' prefix) send reply and archive parent

;; Archive.

(define-key gnus-summary-mode-map "va"
  (lambda () (interactive)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/All Mail" nil)))

;; Archive all.
(define-key gnus-summary-mode-map "vA"
  (lambda () (interactive)
    (gnus-uu-mark-buffer)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/All Mail" nil)))
;; Spam.
(define-key gnus-summary-mode-map "vs"
  (lambda () (interactive)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Spam" nil)))
;; Spam all.
(define-key gnus-summary-mode-map "vS"
  (lambda () (interactive)
    (gnus-uu-mark-buffer)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Spam" nil)))
;; Trash.
(define-key gnus-summary-mode-map "vt"
  (lambda () (interactive)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Bin" nil)))
;; Trash all.
(define-key gnus-summary-mode-map "vT"
  (lambda () (interactive)
    (gnus-uu-mark-buffer)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Bin" nil)))
;; Move to INBOX.
(define-key gnus-summary-mode-map "vi"
  (lambda () (interactive)
    (gnus-summary-move-article nil "nnimap+gmail:INBOX" nil)))
;; Delete ('empty') all spam or trash.  We verify that variable
;; "gnus-summary-buffer" contains [Gmail]/Spam or [Gmail]/Bin.
;; (Or "reviews" for my local use.)
(define-key gnus-summary-mode-map "ve"
  (lambda () (interactive)
    (if (or  (string-match "\\[Gmail\\]/Bin" (format "%s" gnus-summary-buffer))
             (string-match "\\[Gmail\\]/Spam" (format "%s" gnus-summary-buffer))
             (string-match "reviews" (format "%s" gnus-summary-buffer)) )
        (progn
          (gnus-uu-mark-buffer)
          (gnus-summary-delete-article)
          )
      (message "Valid only in Spam or Trash groups")
      )
    )
  )

;; Reply to email, archive parent.
(define-key message-mode-map "\C-cd"
  (lambda () (interactive)
    ;; Sending has to be done as below, as orgtbl might be active in
    ;; message mode.
    (call-interactively (key-binding "\C-c\C-c"))

    ;; This assumes we started with a message reply originated by typing
    ;; 'r' or 'R' in a summary buffer. There's no way to check that
    ;; specifically, but the buffer name should contain "*Summary" at
    ;; least.

    (if (string-match "*Summary" (buffer-name))
        (progn
          (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/All Mail" nil)
          (message "Sent and archived")
          )
      (message "Sent but cannot archive, not in a summary buffer")
      )
    )
  )

;;-----------------------

;; Second stupid gmail hack: save drafts in Gmail draft folder,
;; not in local draft folder.

;; We don't do this directly. Instead, after a gnus draft is saved
;; with (say) C-c C-d then we run this to move the draft (and any
;; others that might still be there) out of local and into Gmail.

(defun gmail-move-drafts ()
  "Move all local drafts to Gmail draft folder"
  (interactive)

  ;; Better than 'let' for debugging.
  (defvar gmail-draft-saved-hooks)

  ;; This avoids an error when using the gnus registry.
  ;; It is not ideal. Is there a better way?
  (setq gmail-draft-saved-hooks gnus-summary-article-move-hook)
  (setq gnus-summary-article-move-hook nil)

  ;; The long way around. If there is a group buffer go there.
  ;; If there is a draft folder, go there. (There ought to be but...)
  ;; Mark all the draft messages.
  ;; Move them to Gmail.
  ;; Be /sure/ to exit the summary buffer!
  ;; Return to the buffer from whence we came.
  ;; Restore the hooks.
  (if (get-buffer "*Group*")
      (with-current-buffer "*Group*"
        (if (gnus-group-goto-group "nndraft:drafts" t)
            (if (or (gnus-group-select-group) (gnus-topic-select-group))
                (progn
                  (gnus-uu-mark-buffer)
                  (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Drafts" nil)
                  (gnus-summary-exit))))))
  (setq gnus-summary-article-move-hook gmail-draft-saved-hooks))

;; Make our function run after saving a draft.
(advice-add 'message-dont-send :after #'gmail-move-drafts)

;;-----------------------

;; Third stupid Gmail hack: fix INBOX org links to always point to All
;; Mail so that the links stay valid when mail is archived. The issue
;; is that links made from INBOX would become invalid when mail is
;; filed (archived) in another folder. Gmail always has everything in
;; All Mail, regardless of other folder designations.

;; We do this by advising the org-gnus function that makes gnus mail
;; links, and changing INBOX to [Gmail]/All Mail.

(defun changegroupinemaillink (args)
  (setcar args
          (replace-regexp-in-string
           "gmail.com:INBOX"
           "gmail.com:[Gmail]/All Mail" (car args)))
  args
  )

(advice-add 'org-gnus-article-link :filter-args #'changegroupinemaillink)
