#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <bits/stdc++.h>

const double L1 = 0.3;
const double L2 = 0.3;

ros::Publisher joint_pub;

void f_k(double hip, double shoulder, double elbow, double &x, double &y, double &z){
    double xy = L1 * cos(shoulder) + L2 * cos(shoulder + elbow);
    x = cos(hip) * xy;
    y = sin(hip) * xy;
    z = L1 * sin(shoulder) + L2 * sin(shoulder + elbow);
}

void i_k(double x, double y, double z){
    ROS_INFO("initial: x=%.3f, y=%.3f, z=%.3f", x, y, z);

    double hip = atan2(y, x);
    double r = sqrt(x * x + y * y);

    double D =(r * r + z * z - L1 * L1 - L2 * L2) /(2 * L1 * L2);
    if(D < -1.0 || D > 1.0){
        ROS_WARN("Target(%.2f, %.2f, %.2f) out of reach!", x, y, z);
        return;
    }

    double elbow = atan2(sqrt(1 - D * D), D);
    double shoulder = atan2(z, r) - atan2(L2 * sin(elbow), L1 + L2 * cos(elbow));

    sensor_msgs::JointState joint_state;
    joint_state.header.stamp = ros::Time::now();
    joint_state.name ={"hip", "shoulder", "elbow"};
    joint_state.position ={hip, shoulder, elbow};
    joint_pub.publish(joint_state);

    ROS_INFO("IK angles: hip=%.3f, shoulder=%.3f, elbow=%.3f", hip, shoulder, elbow);

    double x2, y2, z2;
    f_k(hip, shoulder, elbow, x2, y2, z2);
    double err = sqrt(pow(x - x2, 2) + pow(y - y2, 2) + pow(z - z2, 2));

    ROS_INFO_STREAM(std::fixed << std::setprecision(4)
        << "FK result: x'=" << x2 << ", y'=" << y2 << ", z'=" << z2
        << " | error = " << err << " m");
}

int main(int argc, char** argv){
    ros::init(argc, argv, "arm_ik_controller");
    ros::NodeHandle nh;

    joint_pub = nh.advertise<sensor_msgs::JointState>("/joint_states", 10);

    ros::AsyncSpinner spinner(1);
    spinner.start();

    while(ros::ok()){
        double x, y, z;
        std::cout << "\nEnter x y z(meters): ";
        std::cin >> x >> y >> z;
        i_k(x, y, z);
    }

    spinner.stop();
    return 0;
}
