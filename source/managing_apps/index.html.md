---
title:  Managing apps
id:  managing-apps
navigator: false
order:  501
---

### Increasing instances

You can change the number of instances of your app running in parallel. Running more than one app instance:

- allows your app to handle increased traffic and demand as incoming requests are automatically load-balanced across all instances
- helps maintain high availability and decreases the likelihood that the failure of a single component will take down your app

For example, this command sets the number of running instances to five:

``cf scale APPNAME -i 5``

You can also use the manifest to set the number of instances that will start when you push the app:

```
---
  ...
  instances: 2
```

For a production app, you should always run more than one instance.

### Increasing memory and disk space

You can scale an application vertically by increasing the memory or disk space available to each instance of the app.

For example, this command increases the available memory for an app to 1 gigabyte:

``cf scale APPNAME -m 1G``

This command increases the disc space limit for an app to 512 megabytes:

``cf scale myApp -k 512M``


### More about scaling

For more details, see [Scaling an Application Using cf scale](http://docs.cloudfoundry.org/devguide/deploy-apps/cf-scale.html) [external link] in the Cloud Foundry docs.

