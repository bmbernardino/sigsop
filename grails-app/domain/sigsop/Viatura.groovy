package sigsop

class Viatura {
  static constraints = {
    id02viatura(nullable: false)
    fk02unidade(nullable: false)
    '02perfixo'(nullable: true)
    '02placa'(nullable: true)
    '02marca'(nullable: true)
    '02modelo'(nullable: true)
    '02hodometro'(nullable: true)
    '02status'(nullable: true)
    '02combustivel'(nullable: true)
    '02ano'(nullable: true)
    '02chassi'(nullable: true)
    '02renavam'(nullable: true)
    '02diferencial'(nullable: true)
    '02bateria'(nullable: true)
    '02caixademarcha'(nullable: true)
    '02pneu'(nullable: true)
    '02recebemos'(nullable: true)
    '02inventario'(nullable: true)
  }

  static mapping = {
    table 'viatura'
    version false
    id name: 'id02viatura', generator: 'assigned'
    fk02unidade column: 'fk02unidade'
    '02perfixo' column: '02perfixo'
    '02placa' column: '02placa'
    '02marca' column: '02marca'
    '02modelo' column: '02modelo'
    '02hodometro' column: '02hodometro'
    '02status' column: '02status'
    '02combustivel' column: '02combustivel'
    '02ano' column: '02ano'
    '02chassi' column: '02chassi'
    '02renavam' column: '02renavam'
    '02diferencial' column: '02diferencial'
    '02bateria' column: '02bateria'
    '02caixademarcha' column: '02caixademarcha'
    '02pneu' column: '02pneu'
    '02recebemos' column: '02recebemos'
    '02inventario' column: '02inventario'
    unidade lazy: false
    email lazy: false
    endereco lazy: false
  }

  int id02viatura
  Unidade fk02unidade
  String '02perfixo'
  String '02placa'
  String '02marca'
  String '02modelo'
  String '02hodometro'
  String '02status'
  String '02combustivel'
  Integer '02ano'
  String '02chassi'
  Integer '02renavam'
  String '02diferencial'
  String '02bateria'
  String '02caixademarcha'
  String '02pneu'
  String '02recebemos'
  String '02inventario'
}
