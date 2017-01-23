ltsv.sh
=======

A simple [ltsv](http://ltsv.org/) parser with extended awk

## Usage

```console
$ cat foo.ltsv | ./ltsv.sh
time:05/Feb/2013:15:34:47 +0000	host:192.168.50.1	req:GET / HTTP/1.1	status:200
time:05/Feb/2013:15:35:15 +0000	host:192.168.50.1	req:GET /foo HTTP/1.1	status:200
time:05/Feb/2013:15:35:54 +0000	host:192.168.50.1	req:GET /bar HTTP/1.1	status:404
$ cat foo.ltsv | ./ltsv.sh 'key("status")==404'
time:05/Feb/2013:15:35:54 +0000 host:192.168.50.1       req:GET /bar HTTP/1.1   status:404
$ cat foo.ltsv | ./ltsv.sh 'key("status")==404 {print key("req")}'
time:05/Feb/2013:15:35:54 +0000 host:192.168.50.1       req:GET /bar HTTP/1.1   status:404
GET /bar HTTP/1.1
```

## Installation

```zsh
zplug 'b4b4r07/ltsv.sh', \
    as:command, \
    use:'(ltsv).sh', \
    rename-to:'$1'
```

## License

This script was heavily inspired by <http://koduki.hatenablog.com/entry/2013/07/31/000817>

## Author

b4b4r07
