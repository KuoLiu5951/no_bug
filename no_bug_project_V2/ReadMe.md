# Project 6: Ruby on rails 
## Introduction
In this project we create a web application for CSE department to select graders for each cse course depend on the 
student free time. 

Since ruby on rails are hard to be finished by using version control, our team finished this project by face-to-face at 
one group member's home on his desktop. And we set all environments on his desktop such as postgresql, nodejs etc.

We have different kinds of users could access this application. We will talk more about this feature 
in the demo part. 

Also, in order to be convenient, we create a csv file (you can find this file at the bottom of the 
main directory) which contains information of courses and teachers.
 
## Build environment 

### Postgresql
We use PostgreSQL in our project, so you need to install it in VM./n

First, update apt-get
```bash
$ sudo apt-get update
```
then install PostgreSQL
```bash
$ sudo apt-get install postgresql postgresql-contrib libpq-dev
```
Create a PostgreSQL user with name "postgres" by using this command
```bash
$ sudo -u postgres createuser -s postgres #second postgres is the username
```
set password of database.
```bash
$ sudo -u postgres psql
```
```bash
postgres=# \password postgres
```
Then you need input our password: 123456

Now, you install PostgreSQL successfully! And you finish building environment of this project.(ruby 2.5.0; rails 5.1.4)

### Node js 
In order to run our project successfully, we need a new version of nodejs. The version of nodejs installed according to 
the instruction of CSE3901 course website is not suitable and its version is v4.2.6. (To Check this, type nodejs -v in 
command line) In order to solve this, we need:


```bash
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
```

After these, your nodejs version should become v10.15.3

### Run project
Open this project in Rubymine. You can start running this project by using these 3 line comment. 

```bash
bundle install
```

```bash
rails db:drop  #drop databases that created before
```

```bash
rails db:create
```

```bash
rails db:migrate
```

```bash
rails server
```

### Demo
When you successfully create a server, open your browser in VM.

Redirect to address: http://localhost:3000

### Log in and sign up

You can see the first page. If you have a account, you can log in. If you do not, you can click 'sign up' to create a account.

All users are considered as students. If you are a teacher, administrator update your information to give you teachers' permission.

In order to seeing all features of our demo, you can log in as administrator. 


```bash
Administrator Account:admin@admin.com

Password:admin@admin.com
```

### Home page
This page can remind that you log in successfully.

There is button 'Home'. You can click it to go back home page in every page in this project.

You can choose 'log out'.

There are three applications for different users including administrator, teachers and students.

Students can only access the last one 'go to student'. Teacher can access 'go to teacher'. Only administrator can access
'go to admin'.

### Go to admin
In 'Go to admin', administrator can manage all information in this project. 

'Manage project' You can see all course information. Administrator can add a new course. 'Show' you can see information
of courses. 'edit' you can update information of any courses in CSE. You have right to delete some courses in this
table. 

'Manage teacher' You can see all information of teacher. You can see, update or delete their information. 

'Manage student' There are information of student. Students can update their information and add their information in
this student table.

'Manage users' All accounts will be added in this table. Administrator can edit that account is teacher, student or
administrator.

'Manage applies' If students submit their apply permission, their information can be added in this table. Administrator 
can edit information. If you click is_published and update it, students can get permission to become grader of a course.
Before administrator click is_published, he need make sure that free time of this students suits this class.

'Manage graders' you can see and update information of all graders. 

### Go to teacher
If you want to access this page, you need to make sure that your account is a teacher. You can manage this information
in 'Manage user' in "Go to admin".

'Manage student' There are information of student. Students can update their information and add their information in
this student table.

'Manage graders' you can see and update information of all graders.

'Manage project' You can see all course information. Teacher can add a new course. 'Show' you can see information
of courses. 'edit' you can update information of any courses in CSE. You have right to delete some courses in this
table. 
 
### Go to Student

'Go to profile' Students can add their information on this page. After they update their information, you can see their
information in student table. You can add a new student and go into 'go to admin' -> 'manage students' to check new
student information in that page. 

'Go to Apply' If a student wants to be a grader, he need to choose course and teacher firstly. After he submit his
permission, he can see is_published is false. Because administrator did not check his information. You can go into
'go to admin' -> 'manage apply' to check this information has been added in that table. And you can make decision to
give him permission or not.

'Go to grader' Students can only see all information of graders. They cannot edit this table.


### Change (Final Project)
We suppose that a student apply permission of grader. When he chooses a course, he can see the teacher's name of this course. (This page will exist after click 'Apply' in 'Go to Apply page'


Teacher can manage information of graders who apply his class. 


We have optimized the UI of our webpage that make it more beatiful than before. 


 


### Meetings



 -- 04/02/2019: 
 Our team learned ruby on rails by reading textbook, watching youtube tutorial and searching information on website.
 
 -- 04/04/2019:
 Our team discussed and draw the framework of this project. And decided to use postgresql to finish this project since 
 Xueqian Liu learnt postgresql online at home, and Jian Gao, Kuo Liu had already taken Introduction of database last 
 semester.
 
 -- 04/06/2019:
 Our team implemented the basic frame work of views, controllers, and views. And designed the layouts by using bootstrap.
 However, some difficulties remained to be solved such as relationships between relational data models and routes. 
 
 -- 04/07/2019:
 We solved this routes problems and it worked fine although there were only useless buttons on web pages. We discussed 
 what could each buttons do and what methods were needed. And created methods. 
 
 -- 04/09/2019:
 Our team finished creating users, sign-in, sign-up parts . And discussed what could each user do and access. 
 
 -- 04/11/2019:
 Our team decide to create a project that could be shown to class first, since there was a presentation. Thus, we decide 
 to implement some tough work later such as teacher's interface and links between projects and teachers.
 
 -- 04/14/2019:
 Our team tried to add some teachers, students and projects by just inputting information one by one. And we discussed 
 how to make it more convenient. We rejected the web scraping method since it is tough to link the outcome of the 
 scraping to out tables.
 
 -- 04/15/2019:
 Our team decided to use a csv file to finish the importing data part. And it worked successfully after searching for 
 some methods of importing. 
 
 -- 04/16/2019:
 Our team linked tables together. And students could choose course from the drop-down form in apply part. Also, when we 
 load projects into the table, teachers were loaded into teacher table as well.
 
 -- 04/17/2019:
 Our team moved the project from windows environment to linux environment on Ubuntu. Found some bugs and differences 
 between two environments, but we fixed them.

 --04/20/2019
 Our team adds one more function. Teacher can manage information of students who apply permission to his class. Fix a error. When student choose a course, they cannot see names of teacher.
 


