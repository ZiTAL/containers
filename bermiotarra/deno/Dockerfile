FROM docker.io/denoland/deno:debian

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
       ca-certificates \
       pandoc \
       pdftk \
       ghostscript \
       imagemagick \
       texlive-latex-recommended \
       texlive-latex-extra \
       texlive-fonts-recommended \
       texlive-full \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app/web/private

RUN cd /app/web/private && deno run --allow-run --allow-read --allow-write --allow-net --allow-env build.ts

CMD ["deno", "run", "--allow-all", "server.ts"]
