# Plume

***

## Models

### Login
* (devise fields)
* person_type
* person_id

### Caregiver
- Datable
- Emailable
- Genderable
- Locatable
- Messageable
- Nameable
- Phonable
- Taggable
* group_id

### Client
- Datable
- Emailable
- Genderable
- Locatable
- Messageable
- Nameable
- Phonable
- Taggable
* description
* group_id

### Contact
- Emailable
- Nameable
- Phonable
* client_id

### Group
- Emailable
- Locatable
- Phonable
* name
* supergroup_id

### Manager
- Emailable
- Messageable
- Nameable
- Phonable
* group_id

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

### Emailable
* email

### Genderable
* gender

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

### Groupable (or Organizable?)
* group_id

### Messageable
- has_many messages
