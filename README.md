# motioneye
Install and Use motioneye on raspberry pi

## How to use

### Use Send-bot python package

Create .env file
```sh
MESSAGE_TOKEN=<your-token>
SERVER_IP=<your-server-ip>
PORT=<your-port>
```

```sh
$ pip install .
$ send-bot "How are you doing?"
```

### Or More easier way to just use curl to send message
This package is no needed anymore.

### Push message with MotionNotification
with script [motion-trig-command.sh](./motion-trig-command.sh)
![](./Pictures/motionNotification01.png)