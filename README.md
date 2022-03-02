# Dockerized MongoDB Shell (unofficial)

This repo contains the image definition for a dockerized version of the MongoDB Shell (`mongosh`).

It includes all bells and whistles with prompt personalization with a custom [`.mongoshrc.js`](./mongoshrc.js).

![screenshot](resources/screenshot.png)

## How do use it
 * Checkout the repo
 * Build the image with `docker build . -t mmarcon/mongosh`
 * Run it with `docker run -i -t mmarcon/mongosh <mongodb connection string>`