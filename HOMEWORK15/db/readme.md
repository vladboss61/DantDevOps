1 create My sql DB in AWS, make its and public accessible
2 open 3306 port for that db using Security Groups.
3 create EC2 then connect to its and install `sudo apt install mysql-client`
4 invoke `mysql -u admin -p -h database-vlad.cnoeqkywkkgi.us-west-2.rds.amazonaws.com`
(but change -h (host) for your database.)
