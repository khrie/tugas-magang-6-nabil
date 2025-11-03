
(cl:in-package :asdf)

(defsystem "arm_controller-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "move" :depends-on ("_package_move"))
    (:file "_package_move" :depends-on ("_package"))
  ))