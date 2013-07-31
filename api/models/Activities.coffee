# Activities model
module.exports =
  attributes:
    body: 'STRING'
    location: 'STRING'
    mediaURL: 'STRING'
    karma: 
      type: ['INTEGER']
      defaultsTo: []
    author: 'INTEGER'
    supportsCause: 'INTEGER'
    mentions: ['INTEGER']
    repliesTo: ['INTEGER']
