FROM node:24.1.0-alpine3.21

RUN npm i -g @vercel/ncc
WORKDIR /app/web/private

#RUN cd /app/web/private && \
#    ncc build ./build.ts -o dist/build && \
#    ncc build ./search.ts -o dist/search && \
#    ncc build ./server.ts -o dist/server

CMD ["node", "dist/server/index.js"]
