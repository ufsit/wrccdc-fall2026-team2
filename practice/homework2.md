---
link-images: false
---
# WordPress

## Setup
1. Make sure you have Docker installed on your system. Ask on Discord if
   you're not sure how to install Docker.
2. Clone the repository. Install Git and run
   ```
   https://github.com/ufsit/wrccdc-fall2026-team2
   ```
   Alternatively, go to the following link and unzip the file:
<https://github.com/ufsit/wrccdc-fall2026-team2/archive/refs/heads/main.zip>
3. Go to the `practice/wp` directory within the GitHub
   repository.
4. Run `docker compose up -d`.
5. Go to `http://127.0.0.1:8080/`. You should see the WordPress setup
   screen.
6. Select a language, choose a site name (like "WRCCDC"), and choose a 
   username and password. For email, you can put a fake email like
   `fake@email.example`. Make sure to remember your username, password,
   and email! You'll need the email to login.
7. Close the tab that is now open. Now, open up an Incognito window and
   go to `http://127.0.0.1:8080`. You should a "Hello world" blog post.

## Questions/Tasks
Once you have WordPress set up, please answer the following questions.
You probably won't know the answers to these questions initially. Try
googling or using LLMs to help you find the answer!

*Tip:* If you find your self needing to start the images back up from
scractch (e.g. changed password but forgot what it is), run the following 
commands to get a fresh copy of the images:
```
docker compose down
docker system prune --all
docker compose up -d
```

1. How do you log in to the administrator's account? Go ahead and log 
   in.
2. How do you change the administrator's password? Go ahead and change
   it to something else. Then, try logging out and back in.
3. How do you check which accounts exist on the WordPress site?
4. How do you back up content from the WordPress site? Go ahead and take
   a backup.
5. **Important:** How do you restore content to the WordPress site? It's
   not as simple as it initially seems. Try restoring your backup. Edit the
   "Hello world!" post (suppose the red team has vandalized it). How would
   you restore the post to how it initially was? What if all pages and posts
   had been vandalized? How would you restore them then?
6. *Bonus:* If you're done with the other tasks, there is a MySQL server
   on port 26548. Follow the commands in our plan document from last
   week to back up the MySQL database. You may have to install MySQL client
   on your local machine. Here's some information that might be helpful:
   ```
   IP: 127.0.0.1
   Port: 26548
   Root Password: admin
   Database: wpdb
   ```
   *Bonus bonus question:* How would you find out the database name if I
   had not given it to you?
7. Once you're done will all tasks, run `docker compose down` to free
   up resources.

# OPNsense

## Setup
Please try to get as far as you can at home. We will go over this
during our meeting, but also please feel free to ask questions on
Discord.

1. Download the gzipped OVA file from Google Drive.
2. Extract the file with `gunzip` or 7-zip.
3. Import the OVA file into VirtualBox or UTM.
4. Before booting the virtual machine, go to the Network tab in the
   left menu of VirtualBox. Ensure a Host-Only network is enabled.
5. If no Host-Only network is enabled, create one. You can use the
   default settings, but make sure to enable the DHCP server. Configure
   the adapter automatically if you can.
6. Go back to the OPNsense machine that you just imported. Go to
   `Settings > Network`. Click `Adapter 1`. Make sure it is attached to
   the Host-Only network. Also make sure `Virtual Cable Connected` is
   selected.
7. Start the machine. In the window that pops up, after a minute or so,
   an IP address should be displayed (similar to `192.168.56.4/24`).
8. Go to your web browser and type `http://192.168.56.4/` or similar
   (do not type the `/24` at the end of the IP).
9. Accept the security warning, then log in with username `root` and
   password `admin`.
10. You are now ready to answer the questions in the next section.

## Questions/Tasks
Please pay extra attention to tasks marked **[Important]**.

1. **[Important]** How do you change the root OPNsense password? Once 
   you find out, go ahead and change it.
2. How do you see what users are on OPNsense? What users are on the
   system?
3. **[Important]** How do you back up the OPNsense configuration? Go
   ahead and take a backup.
4. Restore the backup that you just took.
5. How do you get a dump of traffic in OPNsense? What if you want to 
   see network traffic in real-time? Go ahead and capture some packets
   or view the live dump.
6. If you wanted to view the current firewall rules, how would you do it?
