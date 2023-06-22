package sigsop

class Bairro {
    String descricao

    static mapping = {
        table 'bairro'
        version false
        id column: 'id15bairro'
        descricao column: '15descricao'
    }
}
