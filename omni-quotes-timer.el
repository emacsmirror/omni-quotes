;;; omni-quotes-timer.el --- Timer functions for OmniQuotes
;;
;; Copyright (C) 2014-2020 Adrien Becchis
;;
;; Author: Adrien Becchis <adriean.khisbe@live.fr>
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; There are the timer code related of omni-quotes

;;; Code:


(defvar omni-quotes-idle-timer nil "OmniQuote timer.")

(defun  omni-quotes-idle-display-start (&optional no-repeat)
  "Add OmniQuote idle timer with repeat (by default).

With NO-REPEAT idle display will happen once."
  (when (timerp omni-quotes-idle-timer)
    (cancel-timer omni-quotes-idle-timer))
  (setq omni-quotes-idle-timer (run-with-timer omni-quotes-idle-interval
                                               (if no-repeat nil omni-quotes-repeat-interval)
                                               #'omni-quotes-idle-display-callback)))

(defun omni-quotes-idle-display-stop ()
  "Stop OmniQuote Idle timer."
  (when (timerp omni-quotes-idle-timer)
    (cancel-timer omni-quotes-idle-timer))
  (setq omni-quotes-idle-timer nil))

(provide 'omni-quotes-timer)
;;; omni-quotes-timer.el ends here
