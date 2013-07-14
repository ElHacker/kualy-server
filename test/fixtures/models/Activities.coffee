Activities = [
  {
    id: 1
    body: 'Alimente a un perrito de la calle'
    location: 'Hacker House'
    mediaURL: 'http://foo.com/dog.jpeg'
    karma: 0
    author: 1
    supportsCause: 1
    mentions: [ 2 ]
    repliestTo: []
  },
  {
    id: 2
    body: 'Jugue con un perrito de la calle'
    location: 'Hacker House'
    mediaURL: 'http://foo.com/dog2.jpeg'
    karma: 0
    author: 1
    supportsCause: 1
    mentions: []
    repliestTo: []
  },
  {
    id: 3
    body: 'Lave a un perrito abandonado'
    location: 'Hacker House'
    mediaURL: 'http://foo.com/dog3.jpeg'
    karma: 0
    author: 2
    supportsCause: 1
    mentions: []
    repliestTo: []
  },
  {
    id: 4
    body: 'Adopte a un gato abandonado'
    location: 'Hacker House'
    mediaURL: 'http://foo.com/cat.jpeg'
    karma: 0
    author: 2
    supportsCause: 2
    mentions: [ 1 ]
    repliestTo: []
  }
]

module.exports = Activities
