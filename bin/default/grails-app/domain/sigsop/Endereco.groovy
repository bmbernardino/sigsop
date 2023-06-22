package sigsop

class Endereco {
    Rua rua
    Bairro bairro
    Cidade cidade
    Estado estado
    Cep cep

    static mapping = {
        table 'endereco'
        version false
        id column: 'id13endereco'
        rua column: 'fk16rua'
        bairro column: 'fk15bairro'
        cidade column: 'fk14cidade'
        estado column: 'fk17estado'
        cep column: 'fk18cep'
    }
}
/*
class Endereco {
  static constraints = {
    id04endereco(nullable: false)
    fk04pessoa(nullable: false)
    '04logradouro'(nullable: true)
    '04numero'(nullable: true)
    '04bairro'(nullable: true)
    '04cep'(nullable: true)
    '04cidade'(nullable: true)
    '04uf'(nullable: true)
  }

  static mapping = {
    table 'endereco'
    version false
    id name: 'id04endereco', generator: 'assigned'
    fk04pessoa column: 'fk04pessoa'
    '04logradouro' column: '04logradouro'
    '04numero' column: '04numero'
    '04bairro' column: '04bairro'
    '04cep' column: '04cep'
    '04cidade' column: '04cidade'
    '04uf' column: '04uf'
  }

  int id04endereco
  Pessoa fk04pessoa
  String '04logradouro'
  String '04numero'
  String '04bairro'
  String '04cep'
  String '04cidade'
  String '04uf'
}

*/