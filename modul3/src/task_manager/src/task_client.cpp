#include "ros/ros.h"
#include "task_manager/Tasksrv.h"
#include <iostream>

int main(int argc, char **argv){
    ros::init(argc, argv, "task_service_client");
    ros::NodeHandle nh;

    ros::ServiceClient client = nh.serviceClient<task_manager::Tasksrv>("task_service");
    task_manager::Tasksrv srv;

    while(ros::ok()){
        int action;
        std::cout << "\n1. Add  2. Update  3. Delete  4. Display  0. Exit\n";
        std::cout << "Enter action: ";
        std::cin >> action;

        if(action == 0)break;

        srv.request.action = action;

        if(action == 1 || action == 2){
            std::cout << "Task ID: ";
            std::cin >> srv.request.taskId;
            std::cin.ignore();
            std::cout << "Description: ";
            std::getline(std::cin, srv.request.description);
            std::cout << "Completed?(1=yes, 0=no): ";
            std::cin >> srv.request.completed;
        }else if(action == 3){
            std::cout << "Task ID: ";
            std::cin >> srv.request.taskId;
        }

        if(client.call(srv)){
            std::cout << "Response:\n" << srv.response.message << std::endl;
        }else{
            std::cout << "Failed to call service.\n";
        }
    }

    return 0;
}
