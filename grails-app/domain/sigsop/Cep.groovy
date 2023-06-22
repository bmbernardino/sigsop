package sigsop

class Cep {
    String numero

    static mapping = {
        table 'cep'
        version false
        id column: 'id18cep'
        numero column: '18numero'
    }
}
