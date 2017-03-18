# Plume

This project was created for a partnership that fell through.

The NGINX config or model concerns may be of use.

***
OLD README BELOW
***

## Models to be implemented

### Message
* body
* person_type
* person_id
* messageable_type
* messageable_id

### Shift
* start_date
* end_date
* weekday
* start_time
* duration
* client_id

### Visit
* start_date
* start_time
* start_latitude
* start_longitude
* end_time
* end_latitude
* end_longitude
* caregiver_id
* shift_id

***

## Concerns to be implemented

### Messageable
- has_many messages
