package sigsop

class Email {
  static constraints = {
    id19email(nullable: false)
    '19email'(nullable: true)
  }

  static mapping = {
    table 'email'
    version false
    id name: 'id19email', generator: 'assigned'
    '19email' column: '19email'
  }

  int id19email
  String '19email'
}