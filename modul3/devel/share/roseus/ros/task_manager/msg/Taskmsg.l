;; Auto-generated. Do not edit!


(when (boundp 'task_manager::Taskmsg)
  (if (not (find-package "TASK_MANAGER"))
    (make-package "TASK_MANAGER"))
  (shadow 'Taskmsg (find-package "TASK_MANAGER")))
(unless (find-package "TASK_MANAGER::TASKMSG")
  (make-package "TASK_MANAGER::TASKMSG"))

(in-package "ROS")
;;//! \htmlinclude Taskmsg.msg.html


(defclass task_manager::Taskmsg
  :super ros::object
  :slots (_taskId _description _completed ))

(defmethod task_manager::Taskmsg
  (:init
   (&key
    ((:taskId __taskId) 0)
    ((:description __description) "")
    ((:completed __completed) nil)
    )
   (send-super :init)
   (setq _taskId (round __taskId))
   (setq _description (string __description))
   (setq _completed __completed)
   self)
  (:taskId
   (&optional __taskId)
   (if __taskId (setq _taskId __taskId)) _taskId)
  (:description
   (&optional __description)
   (if __description (setq _description __description)) _description)
  (:completed
   (&optional (__completed :null))
   (if (not (eq __completed :null)) (setq _completed __completed)) _completed)
  (:serialization-length
   ()
   (+
    ;; int32 _taskId
    4
    ;; string _description
    4 (length _description)
    ;; bool _completed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _taskId
       (write-long _taskId s)
     ;; string _description
       (write-long (length _description) s) (princ _description s)
     ;; bool _completed
       (if _completed (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _taskId
     (setq _taskId (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _completed
     (setq _completed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get task_manager::Taskmsg :md5sum-) "0270645c882f00d5a89cc03887a7c6ff")
(setf (get task_manager::Taskmsg :datatype-) "task_manager/Taskmsg")
(setf (get task_manager::Taskmsg :definition-)
      "int32 taskId
string description
bool completed

")



(provide :task_manager/Taskmsg "0270645c882f00d5a89cc03887a7c6ff")


