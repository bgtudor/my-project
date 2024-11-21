# BLUEPRINT FOR BUILDING THE IMAGE

# install a specific node image
FROM node:13-alpine    

# set environment variables MONGO_DB_USERNAME=admin and MONGO_DB_PWD=password (optionally/alternative) - A better is to use the docker-compose to set the env var.)
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=pass

# execute any kind of linux command
# all the bellow commands are applied to the conteiner environment.
RUN mkdir -p /home/app

# executes on the host!
# copy from host to conteiner env.
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# executes an entry point in linux command inside docker conteiner
# no need for /home/app/server.js because of WORKDIR
# start the app with: node driver.js
CMD ["node", "server.js"]

