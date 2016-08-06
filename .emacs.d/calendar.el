(require 'calfw)
(require 'calfw-org)
(require 'calfw-cal)
;;(require 'calfw-ical)
;;(require 'calfw-howm)
;;(require 'calfw-org)

(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    (cfw:org-create-source "Green")  ; orgmode source
    (cfw:cal-create-source "Orange") ; diary source
;;    (cfw:howm-create-source "Blue")  ; howm source
;;    (cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
;;    (cfw:ical-create-source "gcal" "https://..../basic.ics" "IndianRed") ; google calendar ICS
   ))) 

;; (cfw:open-org-calendar)
(my-open-calendar)


