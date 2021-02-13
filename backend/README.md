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
* [Document](#document)
* [Image](#image)
* [Report](#report)


### Main
#### Search for a specific property by query
_Note: search is done by brand for Cars and Devices,and by type for Real-Estates_
```
/search/{query}
methods: GET
```
#### Search for a specific property by query
_Note: Get the history of Sell and Buy operations of a user
```
/history
methods: GET
```
#### Get statistics
```
/statistics
methods: GET
```

### Account
#### Create new lawyer
```
/lawyer
methods: POST
```
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
#### Update status by ID
```
/status
methods: PUT
```
#### Get all status of a specific user
```
/status
methods: GET
```
#### Get a status agreement By ID
```
/agreement/{ID}
methods: GET
```

### RealEstate
note:in postman send "entity":"RealEstateEntity"

#### Create new real estate
note : status field have default value : not sold.

note : state field have default value : Unaccepted.
```
/realEstate
methods: POST
```
#### Get a real estate by ID
```
/realEstate/ID
methods: GET
```
#### Get a real estate by ID Unaccepted
```
/realEstateUnaccepted/ID
methods: GET
```
#### Get all real estates Accepted
```
/allRealEstate
methods: GET
```
#### Get all real estates Unaccepted
```
/allRealEstateUnaccepted
methods: GET
```
#### Get all real estates of specific user
```
/realEstates
methods: GET
```
#### Update an existing real estate
note : if sold, submit status field value (sold).

note : if the admin agrees to offer the product, submit state field value (Accepted).

```
/realEstate
methods: PUT
```
#### Delete an existing real estate
```
/realEstate/ID
methods: DELETE
```

### Reaction
note: type = 1 .

note : in body postman  send entity value : CarEntity or DeviceEntity or RealEstateEntity .

note : itemID could be a car ID, a device ID, or a real estate ID .

#### Insert new reaction
```
/reactions
methods: POST
```
#### Get all reactions for specific property

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
/reactionForUser/itemID
methods: GET
```
#### Get notifications for a specific user.
```
/notification
methods: GET
```

### Car
note:in body postman send "entity":"CarEntity"

#### Insert new car
note : status field have default value : not sold.

note : state field have default value : Unaccepted.

```
/cars
methods: POST
```
#### Get a car by ID Accepted
```
/car/id
methods: GET
```
#### Get a car by ID Unaccepted
```
/carUnaccepted/id
methods: GET
```
#### Get the cars of specific user
```
/cars
methods: GET
```
#### Get all cars Accepted
```
/allCars
methods: GET
```
#### Get all cars Unaccepted
```
/allCarsUnaccepted
methods: GET
```
#### Update a specific car by ID
note : if sold, submit status field value (sold).

note : if the admin agrees to offer the product, submit state field value (Accepted).
```
/cars
methods: PUT
```
#### Delete a specific car by ID
```
/cars/id
methods: DELETE
```

#### Get all properties (Cars, Real Estates, and Devices)
```
/allproperties
methods: GET
```

### Device
note:in postman send "entity":"DeviceEntity"
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
/allDevices
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

### Document
note:in postman body send entity: RealEstateEntity.

#### Insert new document
```
/document
methods: POST
```
#### Get documents for item
```
documents/itemID/entity
methods: GET
```
### Image

#### Insert new image
```
/image
methods: POST
```

### Report

#### Create new report
```
/report
methods: POST
```
#### Get all reports
```
/reports
methods: GET
```
#### Get a specific report by Id
```
/report/id
methods: GET
```
#### Delete a specific report by Id
```
/deletereport/id
methods: DELETE
```
#### Delete all reports
```
/deletereports
methods: DELETE
```