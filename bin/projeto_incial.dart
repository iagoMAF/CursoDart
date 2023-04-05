import 'dart:ffi';

import 'package:test/expect.dart';

void main() {
  String nome  = "Laranja";
  double peso  = 100.2;
  String cor   = "Verde e amarela";
  String sabor = "Doce e citrica";
  int diaDesdeColheita = 40;
  bool isMadura = funcEstaMad(diaDesdeColheita);

  Legumes  mandioca   = Legumes("Maxaceira", 1200, "Marrom", true);
  Fruta    banana1    = Fruta("Banana", 75, "Amarela", "Doce", 12);
  Nozes    macadamia1 = Nozes("Macadâmia", 2, "Branco Amarelado", "Doce", 20, 35);
  Citricas limao1     = Citricas("Limao", 100, "Verde", 5, "Azedo", true, 9);

  mandioca.printAlimento();
  banana1.printAlimento();
  macadamia1.printAlimento();
  limao1.printAlimento();

  mandioca.cozinhar();
  limao1.fazerSuco();
  banana1.separarIngredientes();
  limao1.separarIngredientes();
  macadamia1.fazerMassa();
}

class Fruta extends Alimento implements bolo {
  String sabor;
  int    diaDesdeColheita;
  bool?  isMadura;

  //Construtor
  Fruta(String nome,
        double peso,
        String cor,
        this.sabor,
        this.diaDesdeColheita,
       {this.isMadura}) : super(nome, peso,cor);

  void estaMadura(int diasParaMadura){
    isMadura = diaDesdeColheita >= diasParaMadura;
    print("A sua $nome ela foi colhida a $diaDesdeColheita, e precisa de $diasParaMadura. "
          "Ela está madura? $isMadura");
  }

  void fazerSuco(){
    print("Você fez um ótimo suco de $nome");
  }

  @override
  void assar() {
    print("Colocar no forno!");
  }

  @override
  void fazerMassa() {
    print("Fazer a massa!");
  }

  @override
  void separarIngredientes() {
    print("Catar a $nome!");
  }

}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento(){
    print("Este(a) $nome pesa $peso gramas e é $cor.");
  }
}

// "extends" faz uma classe receber tudo que uma outra classe pode proporcionar
// por exemplo -> class Legumes extends Alimento
// nesse exemplo a classe Legumes vai herdar tudo que a classe Alimento, neste
// caso as propriedades nome, peso e cor.

class Legumes extends Alimento {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar) :
    super(nome, peso, cor);

  void cozinhar(){
    if (isPrecisaCozinhar){
      print("Pronto, o $nome está cozinhando!");
    }else{
      print("Nem precisa cozinhar!");
    }
  }
}

class Citricas extends Fruta{
  double nivelAzedo;

  Citricas(String nome,
      double peso,
      String cor,
      int diaDesdeColheita,
      String sabor,
      bool? isMadura,
      this.nivelAzedo)
      : super(nome, peso, cor, sabor, diaDesdeColheita);

  void existeRefri(bool existe){
    if(existe){
      print("Existe refrigerante de $nome");
    }else{
      print("Não existe refrigerante de $nome");
    }
  }

}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome,
      double peso,
      String cor,
      String sabor,
      int diaDesdeColheita,
      this.porcentagemOleoNatural) :
      super(nome, peso, cor, sabor, diaDesdeColheita);

  @override
  void fazerMassa(){
     print("Tirar a casca");
     // super vai chamar a classe pai
    super.fazerMassa();
  }
}

funcQuantosDiasMad(int dias){
 int diasParMad = 30;
 int qntsDiasDiasFaltam = dias - diasParMad;
 return qntsDiasDiasFaltam;
}

void mostraFrutMad(String nome, int dias, {String? cor}){
  if (dias >= 30){
    print('Sim');
  } else{
    print('Não');
  }

  if (cor != "Sem cor"){
    print("A $nome é da cor $cor");
  } else
    {
      print("A cor não foi informada");
    }
}

bool funcEstaMad(int dias){
  if (dias >= 30){
    return true;
  } else {
    return false;
  }
}

abstract class bolo{
  void separarIngredientes();

  void fazerMassa();

  void assar();
}
