#include "ros/ros.h"
#include "geometry_msgs/Point.h"

void pointCallback(const geometry_msgs::Point::ConstPtr& msg){
    ROS_INFO("Received hand point: x=%.1f, y=%.1f", msg->x, msg->y);
}

int main(int argc, char **argv){
    ros::init(argc, argv, "cpp_listener");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/hand_point", 10, pointCallback);

    ros::spin();

    return 0;
}
