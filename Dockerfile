FROM rocker/tidyverse

COPY add_shiny.sh /etc/cont-init.d/add
RUN export ADD=shiny && bash /etc/cont-init.d/add

COPY app.R /srv/shiny-server/utf8test/app.R
