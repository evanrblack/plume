# Plume

***

## Models

### Contact
- Emailable
- Nameable
- Phonable
* client_id

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

### Tag
* category
* name

### TagJoin
* tag_id
* taggable_type
* taggable_id

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

## Concerns

### Taggable
- has_many tags, through: :tag_joins

### Messageable
- has_many messages
