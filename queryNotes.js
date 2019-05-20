query getUsers {
  users {
    email
    id
    password
    events {
      title
      id
      attendingUsers {
        email
        id
        password
      }
    }
  }
}

query getUser {
  user(id: 4) {
    email
    id
    password
    events {
      title
      id
    }
  }
}

query getUser($id: ID!) {
  user(id: $id) {
    email
    id
    password
    events {
      title
      id
    }
  }
}

query getUser($id: ID!, $hasEvents: Boolean!) {
  user(id: $id) {
    email
    id
    password
    events @include(if: $hasEvents) {
      title
      id
    }
  }
}

query getUser($id: ID!, $hasEvents: Boolean!) {
  user(id: $id) {
    email
    id
    password
    events @skip(if: $hasEvents) {
      title
      id
    }
  }
}

query twoUsers {
  userOne: user(id: 4) {
    email
  }
  userTwo: user(id: 5) {
    email
  }
}

query twoUsers($withEvents: Boolean!) {
  userOne: user(id: 4) {
    ...FindUser
  }
  userTwo: user(id: 5) {
    ...FindUser
  }
}

fragment FindUser on User {
  email
  id
  events @include(if: $withEvents) {
    title
    id
  }
}

mutation deleteUser {
  deleteUser(id: 3) {
    id
  }
}

mutation createUser {
  createUser: createUser(email: "bestmail@mail.com", password: "password"){
    email
    id
    password
  }
}
