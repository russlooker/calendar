- view: calendar_data
  sql_table_name: public.deduped_calendar_data
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: attendees_list
    hidden: true
    type: string
    sql: ${TABLE}.attendees_list

  - dimension_group: calendar_end
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.calendar_end_time

  - dimension: calendar_etl_instance_id
    hidden: true
    type: number
    sql: ${TABLE}.calendar_etl_instance_id

  - dimension: calendar_id
    hidden: true
    type: string
    sql: ${TABLE}.calendar_id

  - dimension: inferred_company_name
    label: 'Company Name'
    type: string
    sql: ${TABLE}.inferred_company_name

  - dimension: inferred_meeting_type
    label: 'Meeting Type'
    type: string
    sql: ${TABLE}.inferred_meeting_type

  - dimension_group: inserted
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.inserted_on

  - dimension_group: meeting
    label: 'Start'
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.meeting_time

  - dimension: meeting_title
    label: 'Title'
    type: string
    sql: ${TABLE}.meeting_title

  - dimension: opportunity_id
    hidden: true
    type: string
    sql: ${TABLE}.opportunity_id

  - dimension: timezone
    hidden: true
    type: string
    sql: ${TABLE}.timezone

  - dimension: duration
    type: number
    sql: EXTRACT(EPOCH FROM ${calendar_end_raw} - ${meeting_raw})/(60*60)
    value_format_name: decimal_2

  - dimension: duration_tier
    type: tier
    tiers: [0,.25,.5,.75,1,1.5,2,3,4]
    sql: ${duration}


  - measure: total_duration
    type: sum
    sql: ${duration}
    drill_fields: [inferred_company_name, meeting_time, calendar_end_time, duration, inferred_meeting_type, attendees.count]
    value_format_name: decimal_2
    
  - measure: count
    type: count
    drill_fields: [id, inferred_company_name, attendees.count]

