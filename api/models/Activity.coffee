# Activity model
module.exports =
  attributes:
    body: "STRING"
    location: "STRING"
    mediaURL: "STRING"
    karma: "INTEGER"
    author: "INTEGER"
    supportCause: "INTEGER"
    mentions: [ "INTEGER" ]
    repliesTo: [ "INTEGER" ]
