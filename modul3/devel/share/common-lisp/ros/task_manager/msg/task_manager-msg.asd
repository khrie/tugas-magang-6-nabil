
(cl:in-package :asdf)

(defsystem "task_manager-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Taskmsg" :depends-on ("_package_Taskmsg"))
    (:file "_package_Taskmsg" :depends-on ("_package"))
  ))