#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <boost/bind.hpp>

ros::Subscriber control_sub;
ros::Publisher control_pub;
std::string raw_cmd_topic;
std::string cmd_topic;
double coefficient;
double frequence;
geometry_msgs::Twist cmd_vel;

void cmd_callback(const geometry_msgs::TwistConstPtr& cmd_msg){

    cmd_vel = *cmd_msg;

}

int main(int argc, char ** argv){

    ros::init(argc, argv, "control_mapping_node");
    ros::NodeHandle nh;
    nh.getParam("/control_mapping_node/raw_cmd_topic", raw_cmd_topic);
    nh.getParam("/control_mapping_node/cmd_topic", cmd_topic);
    nh.getParam("/control_mapping_node/coefficient", coefficient);
    nh.getParam("/control_mapping_node/frequence", frequence);
    // control_sub = nh.subscribe(raw_cmd_topic, 1, boost::bind(&cmd_callback, _1, coefficient));
    control_sub = nh.subscribe(raw_cmd_topic, 1, &cmd_callback);    
    control_pub = nh.advertise<geometry_msgs::Twist>(cmd_topic, 1);

    while (ros::ok())
    {
        ros::spinOnce();
        cmd_vel.angular.z *= coefficient;
        control_pub.publish(cmd_vel);
        ros::Duration(1.0 / frequence).sleep();
    }
    
    return 0;

}

