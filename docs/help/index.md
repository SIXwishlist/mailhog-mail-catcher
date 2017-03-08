
# Usage


### Get
```shell
$ docker pull daspanel/mailhog-mail-catcher:latest
```

### Run
```shell
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-mailhog-mail-catcher daspanel/mailhog-mail-catcher:latest
```

### Stop
```shell
$ docker stop my-mailhog-mail-catcher
```

### Update image
```shell
$ docker stop my-mailhog-mail-catcher
$ docker pull daspanel/mailhog-mail-catcher:latest
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-mailhog-mail-catcher daspanel/mailhog-mail-catcher:latest
```

# Tips
