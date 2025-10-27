; Auto-generated. Do not edit!


(cl:in-package task_manager-srv)


;//! \htmlinclude Tasksrv-request.msg.html

(cl:defclass <Tasksrv-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:integer
    :initform 0)
   (taskId
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

(cl:defclass Tasksrv-request (<Tasksrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tasksrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tasksrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task_manager-srv:<Tasksrv-request> is deprecated: use task_manager-srv:Tasksrv-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <Tasksrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task_manager-srv:action-val is deprecated.  Use task_manager-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'taskId-val :lambda-list '(m))
(cl:defmethod taskId-val ((m <Tasksrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task_manager-srv:taskId-val is deprecated.  Use task_manager-srv:taskId instead.")
  (taskId m))

(cl:ensure-generic-function 'description-val :lambda-list '(m))
(cl:defmethod description-val ((m <Tasksrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task_manager-srv:description-val is deprecated.  Use task_manager-srv:description instead.")
  (description m))

(cl:ensure-generic-function 'completed-val :lambda-list '(m))
(cl:defmethod completed-val ((m <Tasksrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task_manager-srv:completed-val is deprecated.  Use task_manager-srv:completed instead.")
  (completed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tasksrv-request>) ostream)
  "Serializes a message object of type '<Tasksrv-request>"
  (cl:let* ((signed (cl:slot-value msg 'action)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tasksrv-request>) istream)
  "Deserializes a message object of type '<Tasksrv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tasksrv-request>)))
  "Returns string type for a service object of type '<Tasksrv-request>"
  "task_manager/TasksrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tasksrv-request)))
  "Returns string type for a service object of type 'Tasksrv-request"
  "task_manager/TasksrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tasksrv-request>)))
  "Returns md5sum for a message object of type '<Tasksrv-request>"
  "8bcfa7c56e0fb0577520f0ba123ec0b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tasksrv-request)))
  "Returns md5sum for a message object of type 'Tasksrv-request"
  "8bcfa7c56e0fb0577520f0ba123ec0b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tasksrv-request>)))
  "Returns full string definition for message of type '<Tasksrv-request>"
  (cl:format cl:nil "int32 action~%int32 taskId~%string description~%bool completed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tasksrv-request)))
  "Returns full string definition for message of type 'Tasksrv-request"
  (cl:format cl:nil "int32 action~%int32 taskId~%string description~%bool completed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tasksrv-request>))
  (cl:+ 0
     4
     4
     4 (cl:length (cl:slot-value msg 'description))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tasksrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Tasksrv-request
    (cl:cons ':action (action msg))
    (cl:cons ':taskId (taskId msg))
    (cl:cons ':description (description msg))
    (cl:cons ':completed (completed msg))
))
;//! \htmlinclude Tasksrv-response.msg.html

(cl:defclass <Tasksrv-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass Tasksrv-response (<Tasksrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tasksrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tasksrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name task_manager-srv:<Tasksrv-response> is deprecated: use task_manager-srv:Tasksrv-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <Tasksrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader task_manager-srv:message-val is deprecated.  Use task_manager-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tasksrv-response>) ostream)
  "Serializes a message object of type '<Tasksrv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tasksrv-response>) istream)
  "Deserializes a message object of type '<Tasksrv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tasksrv-response>)))
  "Returns string type for a service object of type '<Tasksrv-response>"
  "task_manager/TasksrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tasksrv-response)))
  "Returns string type for a service object of type 'Tasksrv-response"
  "task_manager/TasksrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tasksrv-response>)))
  "Returns md5sum for a message object of type '<Tasksrv-response>"
  "8bcfa7c56e0fb0577520f0ba123ec0b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tasksrv-response)))
  "Returns md5sum for a message object of type 'Tasksrv-response"
  "8bcfa7c56e0fb0577520f0ba123ec0b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tasksrv-response>)))
  "Returns full string definition for message of type '<Tasksrv-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tasksrv-response)))
  "Returns full string definition for message of type 'Tasksrv-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tasksrv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tasksrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Tasksrv-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Tasksrv)))
  'Tasksrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Tasksrv)))
  'Tasksrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tasksrv)))
  "Returns string type for a service object of type '<Tasksrv>"
  "task_manager/Tasksrv")