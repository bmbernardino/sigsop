package sigsop

class Unidade {
    Endereco endereco
    String nome
    String nomeFantasia
    Integer numeroUnidade
    String tipo

    static mapping = {
        table 'unidade'
        version false
        id column: 'id01unidade'
        endereco column: 'fk13endereco'
        nome column: '01nome'
        nomeFantasia column: '01nomefantasia'
        numeroUnidade column: '01numerounidade'
        tipo column: '01tipo'
    }
}
