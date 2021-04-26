# Redirector service

This is part of https://github.com/openshift/os/issues/542
whch is part of https://github.com/openshift/os/issues/477

Hopefully in the future we'll move the full release browser
into Github and run it in app.ci, but for now this tiny
service should be run by ART to backend the openshift/installer
metadata.

## Origin

I took the basic config from the currently internal
https://gitlab.cee.redhat.com/coreos/release-browser
and also used as a reference the code from
https://github.com/cgwalters/os/commit/6b4cdd758300d62d3df37c436f7b626d27224fc4


After some investigation, it does seem like it's the current
`nginx.conf` from the release-browser repository that's running.

## Building/running

This runs a simple read-only service on port 8080 built via a `Dockerfile`.

To test locally you can e.g.:
```
$ podman build -t localhost/redirector .
$ podman run --name redirector -d -p 8080:8080 localhost/redirector
$ curl -L --head http://127.0.0.1:8080/art/storage/releases/rhcos-4.7/47.83.202012030221-0/x86_64/rhcos-47.83.202012030221-0-qemu.x86_64.qcow2.gz
...
HTTP/1.1 200 OK
...
$
```

## Deploying in OpenShift

Just needs a usual BuildConfig/Service/Route etc. that `oc new-app` will make happily.
