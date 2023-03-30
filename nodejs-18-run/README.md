nodejs-18-run
================

You see [docker hub](https://hub.docker.com/r/peter1209/nodejs-18-run/), too.

## Project and zip structures：
```
├── package.json
└── server.js
```
> package.json
```
{
  "main":"server.js"
}
```

The container will run `main` of `package.json`, and , **expose 8080 port (default)**..

## Support format：

* zip
* tgz(tar)

## Run command：
```
docker run -p 8080:8080 -it peter1209/nodejs-8-run http://your.source.com/test.zip
```

