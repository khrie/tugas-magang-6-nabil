#include "ros/ros.h"
#include "task_manager/Tasksrv.h"
#include <vector>
#include <string>

struct Task{
    int id;
    std::string desc;
    bool done;
};

std::vector<Task> taskList;

bool handleTask(task_manager::Tasksrv::Request &req,
                task_manager::Tasksrv::Response &res){
    std::string message;

    if(req.action == 1){ 
        taskList.push_back({req.taskId, req.description, req.completed});
        message = "Task " + std::to_string(req.taskId)+ " added.";

    }else if(req.action == 2){ 
        bool found = false;
        for(int i = 0; i < taskList.size(); i++){
            if(taskList[i].id == req.taskId){
                taskList[i].desc = req.description;
                taskList[i].done = req.completed;
                found = true;
                message = "Task " + std::to_string(taskList[i].id)+ " updated.";
                break;
            }
        }
        if(!found) message = "Task not found.";

    }else if(req.action == 3){ 
        bool found = false;
        for(int i = 0; i < taskList.size(); i++){
            if(taskList[i].id == req.taskId){
                taskList.erase(taskList.begin()+ i);
                found = true;
                message = "Task deleted.";
                break;
            }
        }
        if(!found)message = "Task not found.";

    }else if(req.action == 4){ 
        if(taskList.empty()){
            message = "No tasks available.";
        }else{
            message = "";
            for(int i = 0; i < taskList.size(); i++){
                message += "Task " + std::to_string(taskList[i].id)+ ": " 
                         + taskList[i].desc + " [" 
                         +(taskList[i].done ? "Completed" : "Pending")+ "]\n";
            }
        }

    }else{
        message = "Unknown action.";
    }

    res.message = message;
    ROS_INFO("%s", res.message.c_str());
    return true;
}

int main(int argc, char **argv){
    ros::init(argc, argv, "task_service_server");
    ros::NodeHandle nh;

    ros::ServiceServer server = nh.advertiseService("task_service", handleTask);
    ROS_INFO("Task Manager Service ready.");

    ros::spin();
    return 0;
}
