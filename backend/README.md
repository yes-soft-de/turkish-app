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
* [Login](#login)
* [Status](#status)
* [RealEstate](#realestate)
* [Reaction](#reaction)
* [Car](#car)
* [Device](#device)


### Account
#### Create new user
```
/user
methods: POST
```
### login
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
/status
methods: GET
```
### RealEstate
#### Create new real estate
```
/real-estate
methods: POST
```
#### Get a real estate by ID
```
/real-estate/ID
methods: GET
```
#### Get all real estates
```
/all-real-estate
methods: GET
```
#### Get all real estates of specific user
```
/real-estates
methods: GET
```
#### Update an existing real estate
```
/real-estate
methods: PUT
```
#### Delete an existing real estate
```
/real-estate/ID
methods: DELETE
```
#### Filter For real estate
key = price OR location  
value = is the value you want to find
for example:
real-estatesFilter/price/500000

```
real-estatesFilter/{key}/{value}
methods: GET
```
### Reaction
#### Insert new reaction
```
/reactions
methods: POST
```
#### Get all reactions for specific property
_itemID could be a car ID, a device ID, or a real estate ID_
```
/reactions/itemID
methods: GET
```
#### Get all reactions for specific user. 
```
/reactions
methods: GET
```
#### Get reaction for specific user And specific item. 
```
/reactionForUser/{itemID}
methods: GET
```

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
/cars
methods: GET
```
#### Get all cars
```
/all-cars
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
#### Filter For cars
key = location OR price 
value = is the value you want to find
for example:
carsFilter/location/syria

```
carsFilter/{key}/{value}
methods: GET
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
/devices/
methods: GET
```
#### Get all devices
```
/all-devices
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
```
#### Filter For devices
key = price OR location 
value = is the value you want to find
for example:
devicesFilter/price/450000

```
devicesFilter/{key}/{value}
methods: GET
```