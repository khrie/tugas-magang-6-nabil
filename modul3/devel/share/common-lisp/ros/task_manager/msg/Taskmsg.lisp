; Auto-generated. Do not edit!


(cl:in-package task_manager-msg)


;//! \htmlinclude Taskmsg.msg.html

(cl:defclass <Taskmsg> (roslisp-msg-protocol:ros-message)
  ((taskId
    :reader taskId
    :initarg :taskId
    :type cl:integer
    :initform 0)
   (description
    :reader description
    :initarg :description
    :type cl:string
    :initform "")
   (completed
    :reader completed
    :initarg :completed
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Taskmsg (<Taskmsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Taskmsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Taskmsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task_manager-msg:<Taskmsg> is deprecated: use task_manager-msg:Taskmsg instead.")))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <Taskmsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task_manager-msg:taskId-val is deprecated.  Use task_manager-msg:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'description-val :lambda-list '(m))
(cl:defmethod description-val ((m <Taskmsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task_manager-msg:description-val is deprecated.  Use task_manager-msg:description instead.")
  (description m))

(cl:ensure-generic-function 'completed-val :lambda-list '(m))
(cl:defmethod completed-val ((m <Taskmsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task_manager-msg:completed-val is deprecated.  Use task_manager-msg:completed instead.")
  (completed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Taskmsg>) ostream)
  "Serializes a message object of type '<Taskmsg>"
  (cl:let* ((signed (cl:slot-value msg 'taskId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'description))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'description))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'completed) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Taskmsg>) istream)
  "Deserializes a message object of type '<Taskmsg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'taskId) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'description) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'description) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'completed) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Taskmsg>)))
  "Returns string type for a message object of type '<Taskmsg>"
  "task_manager/Taskmsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Taskmsg)))
  "Returns string type for a message object of type 'Taskmsg"
  "task_manager/Taskmsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Taskmsg>)))
  "Returns md5sum for a message object of type '<Taskmsg>"
  "0270645c882f00d5a89cc03887a7c6ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Taskmsg)))
  "Returns md5sum for a message object of type 'Taskmsg"
  "0270645c882f00d5a89cc03887a7c6ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Taskmsg>)))
  "Returns full string definition for message of type '<Taskmsg>"
  (cl:format cl:nil "int32 taskId~%string description~%bool completed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Taskmsg)))
  "Returns full string definition for message of type 'Taskmsg"
  (cl:format cl:nil "int32 taskId~%string description~%bool completed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Taskmsg>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'description))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Taskmsg>))
  "Converts a ROS message object to a list"
  (cl:list 'Taskmsg
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':description (description msg))
    (cl:cons ':completed (completed msg))
))
