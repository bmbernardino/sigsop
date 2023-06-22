package sigsop

class Rua {
    String descricao

    static mapping = {
        table 'rua'
        version false
        id column: 'id16rua'
        descricao column: '16descricao'
    }
}
