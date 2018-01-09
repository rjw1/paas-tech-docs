---
title:  Deploy a backing or routing service
id:  deploying-services
navigator: false
order:  401
---

## MongoDB

MongoDB is an open source cross-platform document-oriented database program. It uses JSON-like documents with schemas, and is often used for content management such as articles on [GOV.UK](https://www.gov.uk/). This is an early version of the service that is available on request so that we can get feedback, and we will make you aware of any constraints in its use at that time.

## Redis

Redis is an open source in-memory data store that can be used as a database cache or message broker. This is an early version of the service that is available on request so that we can get feedback, and we will make you aware of any constraints in its use at that time.

## Elasticsearch

Elasticsearch is an open source full text RESTful search and analytics engine that allows you to store and search data. This is an early version of the service that is available on request so that we can get feedback, and we will make you aware of any constraints in its use at that time.

## Services and plans

Each service in the marketplace can have multiple plans available with different characteristics. For example, there are different PostgreSQL plans which vary by availability, storage capacity and encryption.

Users can also define their own external services that are not available in the marketplace by using [User-Provided Service Instances](/#user-provided-service-instance).

### Paid service plans

Some service plans are paid; you can potentially be billed by us based on your usage of the service. There is a free plan available with limited storage which should only be used for development or testing, not production.

By default, access to paid plans is not enabled for a new organisation. Whether this is enabled or not is controlled by your [organisation's quota settings](/#quotas).

If paid plans are not enabled, when you try to use a paid service you will receive an error stating "service instance cannot be created because paid service plans are not allowed". One of your [Org Managers](https://docs.cloud.service.gov.uk/#org-manager) must contact us at [gov-uk-paas-support@digital.cabinet-office.gov.uk](mailto:gov-uk-paas-support@digital.cabinet-office.gov.uk) to request that we enable paid services.

### Accessing services

Your app can find out what backing services are available, and obtain credentials for the services, by parsing the VCAP_SERVICES [environment variable](/#environment-variables).

### User-provided service instance

Cloud Foundry enables tenants to define a [user-provided service instance](https://docs.cloudfoundry.org/devguide/services/user-provided.html) [external link]. They can be used to deliver service credentials to an application, and/or to trigger streaming of application logs to a syslog compatible consumer. Once created, user-provided service instances behave like service instances created through the marketplace.

### Future services

If you need a particular backing service that we don't yet support, please let us know at [gov-uk-paas-support@digital.cabinet-office.gov.uk](mailto:gov-uk-paas-support@digital.cabinet-office.gov.uk).
---
title:  Deploy a backing or routing service
id:  deploying-services
navigator: false
order:  400
---

---
title:  Deploy a backing or routing service
id:  deploying-services
navigator: false
order:  400
---

