#!/bin/bash
[ -f .env ] && source .env
[ -f config.env ] && source config.env
export NODE_ENV="development"
babel-watch --extensions .js,.pug,.yaml --watch src --watch views --watch . --exclude node_modules src/cli.js -- "$@"
