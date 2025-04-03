FROM node:18

WORKDIR /app

COPY package.json ./
RUN git config --global url."https://github.com/".insteadOf "git@github.com:" \
  && git config --global url."https://github.com/".insteadOf "ssh://git@github.com/" \
  && npm install --legacy-peer-deps \
  && npm cache clean --force

COPY tools ./tools

CMD ["npm", "start"]
