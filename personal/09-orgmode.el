(setq org-capture-templates
      '(
        ("m" "TODO from Email" entry (file+headline "/Volumes/GoogleDrive/My Drive/Webstep/org/Inbox.org" "Inbox")
         "* TODO %a")))

(setq org-agenda-files (list "/Volumes/GoogleDrive/My Drive/Helsedirektoratet/org/Hdir.org"
                             "/Volumes/GoogleDrive/My Drive/Webstep/org/Webstep.org"
                             "/Volumes/GoogleDrive/My Drive/Webstep/org/Inbox.org"
                             "/Volumes/GoogleDrive/My Drive/NTNU/org/Memoro.org"))
