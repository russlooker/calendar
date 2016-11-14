- connection: calendar

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# - explore: order_items
#   joins:
#     - join: orders
#       sql_on: ${orders.id} = ${order_items.order_id}
#     - join: users
#       sql_on: ${users.id} = ${orders.user_id}

- explore: calendar_data
  joins:
    - join: attendees
      type: left_outer
      relationship: one_to_many
      sql_on: ${calendar_data.id} = ${attendees.event_id}