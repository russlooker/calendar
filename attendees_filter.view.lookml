
- view: attendees_filter
  derived_table:
    sql: |
      SELECT DISTINCT event_id
      FROM public.deduped_attendees DA
      WHERE
        {% condition attendees_filter.email %} DA.email {% endcondition %}

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: event_id
    hidden: true
    type: number
    sql: ${TABLE}.event_id

  - filter: email
    type: string 
    suggest_dimension: attendees.email

  sets:
    detail:
      - event_id

