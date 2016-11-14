- view: attendees
  sql_table_name: public.deduped_attendees
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: accepted
    type: string
    sql: ${TABLE}.accepted

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: event_id
    type: number
    sql: ${TABLE}.event_id

  - measure: count
    type: count
    drill_fields: [id, email, accepted]

