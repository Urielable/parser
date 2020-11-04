# PARSER api rest

The present documentation is for use the REST services to Parser "https://www.poderjudicialvirtual.com" api.

Version: 0.1.0

### Requirements:
Ruby Version: **2.6.3**

Rails Version: **6.0.2**

PostgresQL

#### Installation

Run:

```
bundle install
```

#### Configuration

You need create the enviroment variables:

```
export PARSER_APP_DB_TEST=<database_dev_name>
export PARSER_APP_DB_HOST=<hostDB>
export PARSER_APP_DB_USER=<database_user>
export PARSER_APP_DB_DEV=<database_dev_name>
export PARSER_APP_DB_PASS=<database_user_pass>
export PARSER_APP_DB_PRD=<database_prd>
export SECRET_KEY_BASE=<secretKey>
```

Or modify directly teh `database.yml`, you can feel free of use any method.

**Create database:**

```
rake db:create
```

Run migrations for create entities.

```
rake db:migrate
```

**Run server:**

```
rails s
```

## How to use

You can use the live demo [front.jasper-project.online](front.jasper-project.online).

The demo is mount in AWS EC2.

You can view api docs in the [wiki](https://github.com/Urielable/parser/wiki).

You can use this Postman collection [Postman collection](https://www.getpostman.com/collections/2795bb25d553385d8005).  

### TO-DO

- Test suite


