Example for utf8 problems in shiny-server vs no-problem in rstudio-server

Reproducing the problem:
```
# Pull
docker pull skranz/utf8test
# Alternatively build yourself
docker build github.com/skranz/utf8test -t skranz/utf8test:latest

# Now copy app.R from the github.com/skranz/utf8test into a
# new directory on your server

docker run -entrypoint="/usr/bin/with-contenv bash" --name utf8test -d -p 4101:3838 -p 4102:8787 -v <directory with app.R on your server>:/srv/shiny-server -e ROOT=TRUE -e USER=admin -e PASSWORD=<your_password> skranz/courser


# Stop and remove container
docker stop utf8test
docker rm utf8test
```
In rstudio (port 4102) the app runs well, in shiny server (port 4101) UTF-8 encoding does not work properly.