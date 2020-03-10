# Charlize

## Setup with Docker

Create a `.env.development` file with the next values:

```
POSTGRES_USER=db_user
POSTGRES_PASSWORD=db_password
```

Then run the docker commands


```sh


# Build the Docker images
docker-compose build

# Create
docker-compose run --rm app rails db:create db:migrate

docker-compose up
```

## Setup without Docker

You'll need to have a Postgres installation running on port 5432.

Go to the `config/database.yml` file and edit the following lines with your current values:

```
	host: localhost
	username: YOUR USERNAME GOES HERE
	password: YOUR PASSWORD GOES HERE
```

Then run the following commands on the project's directory

```sh

$ bundle install -j4

$ bundle exec rails db:create db:migrate

$ bundle exec rails s

```