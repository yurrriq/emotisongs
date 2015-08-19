(defmodule emotisongs-routes
  (export all))

(include-file "deps/exemplar/include/html-macros.lfe")
(include-file "deps/lfest/include/lfest-macros.lfe")

(defroutes
  ('GET "/"
    (emotisongs-content:get-sidebar-content arg-data))
  ('GET "/content/:id"
    (emotisongs-content:get-content id arg-data))
  ('GET "/relation/:userid/:accountid"
    (emotisongs-content:get-content userid accountid arg-data))
  ;; When nothing matches, do this
  ('NOTFOUND
   (let* ((joined-path (++ "/" (string:join path "/")))
          (msg (++ "Unmatched route!~n~n"
                   "Path-info: ~p~n"
                   "joined path: ~p~n"
                   "arg-data: ~p~n~n"))
          (msg-args `(,path ,joined-path ,arg-data)))
     (io:format msg msg-args)
     (emotisongs-content:four-oh-four
      (++ (strong "Unmatched Route: ") joined-path)))))
