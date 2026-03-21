FROM docker.io/denoland/deno:alpine-2.3.2

RUN apk add imagemagick ghostscript texlive texmf-dist-latexextra texmf-dist-fontsrecommended texmf-dist-latexrecommended texmf-dist-latex texmf-dist pandoc

WORKDIR /app/web/private

RUN cd /app/web/private && deno run --allow-all build.ts

CMD ["deno", "run", "--allow-all", "server.ts"]
