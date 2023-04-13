# README

**Software Requirments:**

* Ruby version 2.7

* Rails 5.2

# Project Configuration

* Database creation ( Postgresql Database use )

* For initalizing database run rails db:setup this which creating, loading schema, seed data into database.

* Three types of user created **manager**, **developer** and **qa**

* You can login using these accounts:
* **Manager:**
1. * email: manager@gmail.com
   * password: manager123@
2. * email: manager1@gmail.com
   * password: manager123@ 
* Developer:
1. * email: dev@gmail.com
   * password: developer123@
2. * email: dev1@gmail.com
   * password: developer123@
* QA:
1. * email: qa@gmail.com
   * password: qa123@
2. * email: qa1@gmail.com
   * password: qa123@

# Roles

1. Manager can create, show, edit and delete project.
2. Manager can add users in project and also see bugs in project.
3. Manager can also invite others user through link.
4. Developer can see project and they can assign bug him self and also mark bug as completed the bug.
5. Developer can also see other developers and QAs which is currently working on the project.
6. QA can see the all project and add bug in any project they can also see other developer or QAs which is currently working on the project.

* Deployment at Heroku
*App link: https://bugzilla-test-project2.herokuapp.com
