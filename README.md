# docker-react-app-multi-stage-node-nginx [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
Dockerfile to build a react app generated (ideally) by create-react-app implementing [docker multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/) using node and nginx.

### Requirements

- Docker 17.05 or higher on the daemon and client.

### Folder structure

Make sure you add your nginx.conf under `server/nginx.conf`

```diff
  ├── public/
  ├── node_modules/
+ ├── server/
+ │   ├── nginx.conf
  ├── src/
+ ├── .dockerignore
  ├── .gitignore
+ ├── Dockerfile
+ ├── Makefile
  └── package.json
```

### TODO
- [ ] Improve documentation
- [ ] Look for a better way to structure the project in order to make it easier to get started and reuse it

### Contributing

[Contribution guidelines](https://github.com/jonathanpalma/docker-react-app-multi-stage-node-nginx/blob/master/CONTRIBUTING.md)
