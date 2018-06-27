# Creates the davidsilva user
class users::davidsilva {
  govuk_user { 'davidsilva':
    ensure   => absent,
    fullname => 'David Silva',
    email    => 'david.silva@digital.cabinet-office.gov.uk',
    ssh_key  => 'ssh-rsa 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 david.silva@digital.cabinet-office.gov.uk',
  }
}
