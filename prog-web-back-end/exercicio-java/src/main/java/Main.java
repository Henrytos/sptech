import java.util.Arrays;

public class Main {

    public static void main(String[] args) {

//        1-Escreva um programa em Java que recebe um número inteiro positivo e verifica se ele é um número primo.

        System.out.println("Numero 17 eh primo:");
        System.out.println(isNumberPrimo(17));
        System.out.println("Numero 10 eh primo:");
        System.out.println(isNumberPrimo(10));

//        2-Crie um programa que recebe um número inteiro positivo e calcula a soma de seus dígitos.
//
        System.out.println(calcularDigitos(11120));
//        3-Escreva um programa que imprime os N primeiros números da sequência de Fibonacci. O valor de N deve ser fornecido pelo usuário.
        fibonacci(10);
//        4-Crie um programa quei recebe uma palavra e verifica se ela é um palíndromo (ou seja, se pode ser lida da mesma forma de trás para frente).
        System.out.println(isPalindromo("ana", "ana"));
        System.out.println(isPalindromo("ana2", "ana"));
        //        5-Escreva um programa que recebe uma frase e conta quantas vogais (a, e, i, o, u) ela possui.

        System.out.println(quantidadesDeVogais("henry"));

    }

    private static Quantidades quantidadesDeVogais(String palavra) {
        palavra = palavra.toLowerCase();

        int a = palavra.length() - palavra.replaceAll("a","").length();
        palavra = palavra.replaceAll("a","");


        int e = palavra.length() - palavra.replaceAll("e","").length();
        palavra = palavra.replaceAll("e","");


        int i = palavra.length() - palavra.replaceAll("i","").length();
        palavra = palavra.replaceAll("i","");


        int o = palavra.length() - palavra.replaceAll("o","").length();
        palavra = palavra.replaceAll("o","");

        int u = palavra.length() - palavra.replaceAll("u","").length();
        palavra = palavra.replaceAll("u","");

        return new Quantidades(a, e, i, o, u);
    }

    record Quantidades(
            Integer a,
            Integer e,
            Integer i,
            Integer o,
            Integer u
    ) {
        @Override
        public String toString() {
            return "Quantidades{" +
                    "a=" + a +
                    ", e=" + e +
                    ", i=" + i +
                    ", o=" + o +
                    ", u=" + u +
                    '}';
        }
    }

    private static boolean isPalindromo(String palavra, String palavra2) {
        return new StringBuilder(palavra).reverse().toString().equalsIgnoreCase(palavra2);
    }

    private static void fibonacci(int i) {
        int valorAtual = 1;
        int proximoValor = 1;

        for (int x = 0; x < i; x++) {
            System.out.println(valorAtual);

            int temp = valorAtual + proximoValor; // calcula o próximo termo
            valorAtual = proximoValor;            // anda: atual vira o que era o próximo
            proximoValor = temp;                  // próximo vira o calculado
        }
    }

    public static boolean isNumberPrimo(int number) {

        int divisor = number - 1;
        while (divisor > 1) {

            if ((Double.valueOf(number) / Double.valueOf(divisor)) % 1 == 0) {
                return false;
            }

            divisor--;
        }

        return true;
    }

    public static int calcularDigitos(int numero) {
        String[] numeroArray = String.valueOf(numero).split("");
        int total = 0;

        for (Integer i : Arrays.stream(numeroArray).map(num -> Integer.valueOf(num)).toList()) {
            total += i;
        }

        return total;
    }
}
