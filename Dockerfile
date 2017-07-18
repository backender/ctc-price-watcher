FROM python:3

ARG mysql_dest
ARG mysql_schema
ENV mysql_dest=$mysql_dest
ENV mysql_schema=$mysql_schema

WORKDIR .

COPY subscriptions.ini ./
COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD /usr/local/bin/bitcoinexchangefh -mysql -mysqldest $mysql_dest -mysqlschema $mysql_schema -instmts subscriptions.ini
