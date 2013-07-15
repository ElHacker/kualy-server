# Activities model
module.exports =
  attributes:
    body: 'STRING'
    location: 'STRING'
    mediaURL: 'STRING'
    karma: 'INTEGER'
    author: 'INTEGER'
    supportsCause: 'INTEGER'
    mentions: [ 'INTEGER' ]
    repliesTo: [ 'INTEGER' ]
