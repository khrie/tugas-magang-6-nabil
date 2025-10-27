
(cl:in-package :asdf)

(defsystem "task_manager-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Tasksrv" :depends-on ("_package_Tasksrv"))
    (:file "_package_Tasksrv" :depends-on ("_package"))
  ))