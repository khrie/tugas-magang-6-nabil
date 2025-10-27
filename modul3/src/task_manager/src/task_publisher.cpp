#include "ros/ros.h"
#include "task_manager/Taskmsg.h"
#include <iostream>

int main(int argc, char** argv){
    ros::init(argc, argv, "task_publisher_message");
    ros::NodeHandle nh;

    ros::Publisher task_pub = nh.advertise<task_manager::Taskmsg>("task_topic", 10);
    ros::Rate rate(1);

    while(ros::ok()){
        task_manager::Taskmsg msg;

        std::cout << "\nEnter Task ID: ";
        std::cin >> msg.taskId;
        std::cin.ignore();

        std::cout << "Enter Description: ";
        std::getline(std::cin, msg.description);

        std::cout << "Completed?{1 = yes, 0 = no): ";
        std::cin >> msg.completed;

        ROS_INFO("Publishing task: [%d, %s, %s]",
                 msg.taskId, msg.description.c_str(),
                 msg.completed ? "Completed" : "Pending");

        task_pub.publish(msg);
        ros::spinOnce();
        rate.sleep();
    }

    return 0;
}
