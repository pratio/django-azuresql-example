# django-azuresql-example

### CRUD app with django and azuresql


#### What is this
> A basic crud app that uses the Azure MSSQL as backend database for a django project along with Auth0 authentication


#### What it has
1. [Auth0 for application login](https://github.com/python-social-auth/social-app-django)
2. [Auth0 for Django Admin](https://auth0.com/blog/django-tutorial-building-and-securing-web-applications/)
3. Django admin can be used to edit the models
4. Sample of Migrations
5. [Azure SQL backend](https://github.com/ESSolutions/django-mssql-backend)
6. [Djangotables 2 for a sortable grid render](https://github.com/jieter/django-tables2/blob/master/docs/pages/tutorial.rst) 
7. [Dockerized application](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/#postgres)
8. [Using a docker alpine container with Azure SQL](https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15#alpine17)

#### How to use
1. Clone the repository
2. Build the image with `docker build django-azuresql-example -t .`
3. Run the image with the command below, grab the credentials from keepass

```
docker run -p 80:80
-v django-azuresql-example/project/service:/project/service
--env DJANGO_ALLOWED_HOSTS=*
--env DEBUG=1
--env DBNAME='nameofstagingdb'
--env USER='username@nameofstagingdb'
--env PASSWORD='password'
--env HOST='hostnameofdb'
--env DOMAIN='auth0dmain'
--env KEY='clientid'
--env SECRET='clientsecret'
--name django-azuresql-example
django-azuresql-example:latest python manage.py runserver 0.0.0.0:80
```


