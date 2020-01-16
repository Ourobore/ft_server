docker rm $(docker ps -a -q)
docker build -t serv .
docker run -it -p 80:80 -p 443:443  serv
