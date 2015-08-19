(defmodule emotisongs-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'emotisongs))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(emotisongs ,(get-version)))))
