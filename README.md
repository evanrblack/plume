# Plume

***

## Models

### Login
* (devise fields)
* person_type
* person_id

### Caregiver
- Birthdatable
- Emailable
- Genderable
- Groupable
- Locatable
- Messageable
- Nameable
- Phonable
- Taggable

### Client
- Birthdatable
- Emailable
- Genderable
- Groupable
- Locatable
- Messageable
- Nameable
- Phonable
- Taggable
* description

### Contact
- Emailable
- Nameable
- Phonable
* client_id

### Group
- Emailable
- Groupable
- Locatable
- Messageble
- Phonable
* name

### Manager
- Emailable
- Groupable
- Messageable
- Nameable
- Phonable

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

### Birthdatable

### Emailable
* email

### Genderable
* gender

### Groupable (or Organizable?)
* group_id

### Locatable
* street_address
* extra_address
* city
* state
* latitude
* longitude

### Nameable (or Personable...?)
* first_name
* last_name

### Phonable
* phone_number

### Taggable
- has_many tags, through: :tag_joins

### Messageable
- has_many messages
