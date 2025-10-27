;; Auto-generated. Do not edit!


(when (boundp 'task_manager::Tasksrv)
  (if (not (find-package "TASK_MANAGER"))
    (make-package "TASK_MANAGER"))
  (shadow 'Tasksrv (find-package "TASK_MANAGER")))
(unless (find-package "TASK_MANAGER::TASKSRV")
  (make-package "TASK_MANAGER::TASKSRV"))
(unless (find-package "TASK_MANAGER::TASKSRVREQUEST")
  (make-package "TASK_MANAGER::TASKSRVREQUEST"))
(unless (find-package "TASK_MANAGER::TASKSRVRESPONSE")
  (make-package "TASK_MANAGER::TASKSRVRESPONSE"))

(in-package "ROS")





(defclass task_manager::TasksrvRequest
  :super ros::object
  :slots (_action _taskId _description _completed ))

(defmethod task_manager::TasksrvRequest
  (:init
   (&key
    ((:action __action) 0)
    ((:taskId __taskId) 0)
    ((:description __description) "")
    ((:completed __completed) nil)
    )
   (send-super :init)
   (setq _action (round __action))
   (setq _taskId (round __taskId))
   (setq _description (string __description))
   (setq _completed __completed)
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
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
    ;; int32 _action
    4
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
     ;; int32 _action
       (write-long _action s)
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
   ;; int32 _action
     (setq _action (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _taskId
     (setq _taskId (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _completed
     (setq _completed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass task_manager::TasksrvResponse
  :super ros::object
  :slots (_message ))

(defmethod task_manager::TasksrvResponse
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass task_manager::Tasksrv
  :super ros::object
  :slots ())

(setf (get task_manager::Tasksrv :md5sum-) "8bcfa7c56e0fb0577520f0ba123ec0b4")
(setf (get task_manager::Tasksrv :datatype-) "task_manager/Tasksrv")
(setf (get task_manager::Tasksrv :request) task_manager::TasksrvRequest)
(setf (get task_manager::Tasksrv :response) task_manager::TasksrvResponse)

(defmethod task_manager::TasksrvRequest
  (:response () (instance task_manager::TasksrvResponse :init)))

(setf (get task_manager::TasksrvRequest :md5sum-) "8bcfa7c56e0fb0577520f0ba123ec0b4")
(setf (get task_manager::TasksrvRequest :datatype-) "task_manager/TasksrvRequest")
(setf (get task_manager::TasksrvRequest :definition-)
      "int32 action
int32 taskId
string description
bool completed
---
string message

")

(setf (get task_manager::TasksrvResponse :md5sum-) "8bcfa7c56e0fb0577520f0ba123ec0b4")
(setf (get task_manager::TasksrvResponse :datatype-) "task_manager/TasksrvResponse")
(setf (get task_manager::TasksrvResponse :definition-)
      "int32 action
int32 taskId
string description
bool completed
---
string message

")



(provide :task_manager/Tasksrv "8bcfa7c56e0fb0577520f0ba123ec0b4")


