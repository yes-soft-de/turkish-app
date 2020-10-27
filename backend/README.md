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

Finally run migration versions to create tables
```
php bin/console doctrine:migration:migrate
```
***
#### API guide
* [Account](#account)
* [Car](#car)
* [Device](#device)

#### Account
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
<<<<<<< HEAD
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
=======

### Car
#### Insert new car
```
/cars
methods: POST
```
#### Get a car by ID
```
/car/id
methods: GET
```
#### Get the cars of specific user
```
/cars/createdBy
methods: GET
```
#### Get all cars
```
/cars
methods: GET
```
#### Update a specific car by ID
```
/cars
methods: PUT
```
#### Delete a specific car by ID
```
/cars/id
methods: DELETE
```

### Device
#### Insert new device
```
/devices
methods: POST
```
#### Get a device by ID
```
/device/id
methods: GET
```
#### Get the devices of specific user
```
/devices/createdBy
methods: GET
```
#### Get all devices
```
/devices
methods: GET
```
#### Update a specific device by ID
```
/devices
methods: PUT
```
#### Delete a specific device by ID
```
/devices/id
methods: DELETE
>>>>>>> 9ee4a3e03d164ef6c33b2bae96f4e7ce0b445c80
```