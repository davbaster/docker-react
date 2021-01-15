#BUILD PHASE
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <--- has all the output files needed for RUN PHASE

#RUN PHASE
FROM nginx
#copy         from:    to:
COPY --from=0 /app/build /usr/share/nginx/html