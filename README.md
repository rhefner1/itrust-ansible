# itrust-ansible

This project tries to make the iTrust development environment setup *repeatable*, quick and push-button easy. Here's a video of it running: [https://youtu.be/mEzdTTMkLAA](https://youtu.be/mEzdTTMkLAA) (ignore the part at the very end where I was too anxious and didn't let `TestDataGenerator` finish all the way).

Note that I explored automating the manual steps below, but Eclipse is not very scriptable. If I'm right, doing so would involve developing custom Eclipse plugins, which sounds like more work than it's worth.

Here's how to get started. Complete all of these steps in sequential order.

## Fetching the Project
1. Clone this project to a clean virtual machine. This project was developed with Fedora in mind, but it should theoretically work in any Linux distribution. You'll need to create an appropriate file in `roles/setup/vars` if you want to do this.
2. **Create an SSH key**: Run `ssh-keygen` and press Enter for all of the prompts.
3. **Copy SSH public key**: Copy the contents of `cat ~/.ssh/id_rsa.pub` to your clipboard.
4. **Add SSH Key to Git Host**: Go to your [Git host](https://github.ncsu.edu) and add this SSH key. If you're using GitHub, click on your avatar -> *Settings* -> *SSH keys*-> *Add SSH key*.

## Running Ansible Playbook
1. **Start Ansible**: Run `./install-itrust.sh`. This process should complete successfully.

## Importing the Project to Eclipse
1. **Clean Eclipse**: Open a terminal and run `eclipse -clean`. Eclipse should launch and you can continue on. The next time you open Eclipse, you can do so normally from the standard applications menu.
2. **Set Eclipse workspace**: Instead of `/home/{user}/workspace`, use `/home/{user}/code` as your workspace.
3. **Import iTrust**:
  - Click *File* -> *Import...*.
  - Under the *General* tab, choose *Existing Project from Workspace*.
  - Ensure *Select root directory* is selected and click *Browse*. Choose `/home/{user}/code` and press *OK*.
  - Ensure that iTrust shows up in the list of discovered projects. Unselect the *Copy Projects into Workspace* checkbox (if it is selected).
  - Click *Finish*.
6. Close the *Welcome* tab.
7. **Open Java perspective**: Click *Window* -> *Perspective* -> *Open Perspective* -> *Java*

## Adding a Server to Eclipse
1. Click *Window* -> *Show View* -> *Other...*
2. Under the *Server* tab, select *Servers* and click *OK*.
3. Click on the link in that new window to create a new server.
4. Find *Tomcat v8.0* in the list and click *Next*.
5. For the Tomcat installation directory, click *Browse* and choose `/home/{user}/code/apache-tomcat-{version}`. Click *Next*.
6. Click *Add All* to add iTrust to the new server. Click *Finish*.
7. Right click the new server and click *Start*. Wait for this process to complete.

## Adding Test Data to iTrust Database
1. On the left side, expand the iTrust codebase.
2. Right click `DBBuilder.launch` -> *Run As* -> *DBBuilder*. Open the Console tab to see if this finishes. If you see `<terminated> DBBuilder`, the process completed successfully.
3. Do the same for `TestDataGenerator.launch`.
4. Open up your browser to `http://localhost:8080/iTrust`. You're good to go!
