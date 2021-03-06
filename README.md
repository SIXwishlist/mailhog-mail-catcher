
# Mailhog Mail Catcher

Docker image using Mailhog that provides simple SMTP server which catches any message sent to it to display in a web interface.

* Free software: MIT license
* Documentation: <https://github.com/daspanel/mailhog-mail-catcher/blob/master/docs/index.md> or <https://daspanel.github.io/mailhog-mail-catcher>

## Environment variables
| Variable | Optional      | Example Value | Purpose
|----------|---------------|---------------|---------------|
| DASPANEL_SYS_UUID | yes | ksdf09832klsdfkjsdlk | UUID used in Daspanel system to identify a unique instance of data. If you don't provide one Daspanel generate it using [Getuuid API](https://9jzojg54n7.execute-api.us-east-1.amazonaws.com/v1/uuid)|

You can find the value of variables automatically generated by examining the 
container log after it starts. Or looking at the output of the console where 
you run your docker.

## How to use
Get
```shell
docker pull daspanel/mailhog-mail-catcher:latest
```

Run
```shell
docker run -e DASPANEL_SYS_UUID=ksdf09832klsdfkjsdlk daspanel/mailhog-mail-catcher:latest sh
```

## Features

* Alpine Linux with S6 overlay

## Additional docs and credits

* [Project home page](https://daspanel.github.io/mailhog-mail-catcher)

