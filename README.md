# Task_app


### **About**

This is a mobile project built in Flutter with a focus on **clean architecture**. The app is a to-do list manager that consumes the todolist API, available in this example from Postman [link](https://documenter.getpostman.com/view/8858534/SW7dX7JG?version=latest)

![image](https://user-images.githubusercontent.com/61996692/176757171-7d5a43d6-51b6-46ee-a6c2-6c7158b2e537.png)

Architecture used as the basis for our application. Fonte: https://resocoder.com/


### **Dependencies and requirements**

Flutter 3.0.1 was used in this project and the most notorious dependencies:

 equatable: 2.0.3

 bloc: 8.0.3

 mocktail: 0.3.0

 flutter_bloc: 8.0.1

### Getting Started

Download the zip file, click the green button **''Code''** or copy the link available in the same place and git clone it in your terminal, as in the example:

​	`	git clone git@github.com:HalysonItallo/task_app.git`

Inside the 'lib' folder, run the ''main.dart'' file:

​	`Flutter run main.dart`

If you don't have the dependencies, you may need to run the following command:

​	`Flutter pub get`

### **Warning**

In some moments the API has gone offline, so it was not developed some functionality that depended on it working to implement, such as deleting users.
