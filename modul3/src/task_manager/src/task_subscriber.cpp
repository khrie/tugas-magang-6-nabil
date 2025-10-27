#include "ros/ros.h"
#include "task_manager/Taskmsg.h"

void taskCallback(const task_manager::Taskmsg::ConstPtr& msg){
    ROS_INFO("Received Task %d: %s [%s]",
             msg->taskId,
             msg->description.c_str(),
             msg->completed ? "Completed" : "Pending");
}

int main(int argc, char** argv){
    ros::init(argc, argv, "task_subscriber_message");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("task_topic", 10, taskCallback);
    ros::spin();
    return 0;
}
