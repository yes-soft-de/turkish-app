# Skeleton App Backend  🚧
*. env file and private-public keys not enclosed .*
## Project setup

### Composer thing
```
composer update
```
### Database setup
First add to** .env** file correct connection string
`DATABASE_URL=mysql://root@127.0.0.1:3306/animeDB?serverVersion=5.7`

Then create database
```
php bin/console doctrine:database:create
```

After that make migration
```
php bin/console make:migration
```

Finaly run migration versions to create tables
```
php bin/console doctrine:migration:migrate
```

### Account
#### Create new user
```
/user
methods: POST
```
#### login
```
/login_check
methods: POST
```
#### Create user profile
```
/userprofile
methods: POST
```
#### Update user profile
```
/userprofile
methods: PUT
```
#### Get user profile by userID
```
/userprofile
methods: GET
```
### Status
#### Create new status 
```
/status
methods: POST
```
#### Update status
```
/status
methods: PUT
```
#### Get agreements of a specific user
```
/status/{userID}
methods: GET
```
### RealEstate
#### Create new real estate
```
/real-estate
methods: POST
```
#### Get an item by ID
```
/real-estate/{ID}
methods: GET
```
#### Get all items
```
/real-estate
methods: GET
```
#### Get all items of specific user
```
/real-estates/{userID}
methods: GET
```
#### Update an existing item
```
/real-estate
methods: PUT
```
#### Delete an item
```
/real-estate/{ID}
methods: DELETE
```
### Reaction
#### Insert new reaction
```
/reactions
methods: POST
```
#### Get all reactions for specific item
```
/reactions/{itemID}
methods: GET
```
#### Get all reactions for specific user. 
```
/reactionss/{userID}
methods: GET
```