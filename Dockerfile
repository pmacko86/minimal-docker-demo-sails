FROM node:12.13.1
RUN npm -g install sails

RUN bash -c "echo 2 | sails new demo"
WORKDIR /demo
RUN sed -E -i 's/.* migrate:.*$/  migrate: "safe",/' config/models.js
RUN sails generate api message

# Necessary for OpenShift
RUN chgrp -R 0 /demo && chmod -R g=u /demo

EXPOSE 1337
CMD ["sails","lift"]

