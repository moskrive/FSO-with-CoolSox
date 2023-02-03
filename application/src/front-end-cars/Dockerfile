FROM node:15.14-stretch-slim

ENV NODE_ENV "production"
ENV PORT 8079
EXPOSE 8079
RUN addgroup --gid 10001 mygroup && adduser --uid 10001 --ingroup mygroup --disabled-password --gecos "" myuser && mkdir -p /usr/src/app && chown -R myuser /usr/src/app

# Prepare app directory
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN chown -R myuser:mygroup /usr/src/app

USER myuser
RUN yarn install


# Start the app
CMD ["/usr/local/bin/npm", "start"]
