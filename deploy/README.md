# Deployment

The files here record how we deployed this app on the
[ART cluster](https://console-openshift-console.apps.art.xq1c.p1.openshiftapps.com/).

The namespace is `rhcos-redirector` but namespaces are not coded into the
objects here, so it could be replicated in any namespace for testing.

    oc new-project rhcos-redirector-dev
    oc apply -f deploy/builds.yaml
    oc apply -f deploy/app.yaml
    oc apply -f deploy/routes.yaml

(Note you'd probably want to change routes to avoid being masked by the
production deployment.)
