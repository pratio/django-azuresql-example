FROM python:3.6-alpine

# Update the image, add basic utils as well as dependencies for odbc
RUN apk update; apk add vim; apk add nmap; apk add bash build-base unixodbc-dev freetds-dev tree gnupg curl gcc python2-dev libcurl libc-dev gpgme-dev
RUN pip install --upgrade pip
ADD project/dependencies/odbcinst.ini /etc/odbcinst.ini
ADD project/dependencies/requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.5.2.2-1_amd64.apk
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.5.2.1-1_amd64.apk
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.5.2.2-1_amd64.sig
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.5.2.1-1_amd64.sig
RUN curl https://packages.microsoft.com/keys/microsoft.asc  | gpg --import -
RUN gpg --verify msodbcsql17_17.5.2.2-1_amd64.sig msodbcsql17_17.5.2.2-1_amd64.apk
RUN gpg --verify mssql-tools_17.5.2.1-1_amd64.sig mssql-tools_17.5.2.1-1_amd64.apk
RUN apk add --allow-untrusted msodbcsql17_17.5.2.2-1_amd64.apk
RUN apk add --allow-untrusted mssql-tools_17.5.2.1-1_amd64.apk

EXPOSE 80
EXPOSE 8000
# The container starts in this directory
ADD project/service /project/service

WORKDIR /project/service


