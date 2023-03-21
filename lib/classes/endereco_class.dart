import 'dart:convert';
import 'package:http/http.dart' as http;

class EnderecoModel {
  String cep;
  String logradouro;
  String? numero;
  String? complemento;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;
  String gia;

  EnderecoModel({
    required this.cep,
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.unidade,
    required this.ibge,
    required this.gia,
  });

  factory EnderecoModel.fromJson(String str) =>
      EnderecoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromMap(Map<String, dynamic> json) => EnderecoModel(
        cep: json["cep"],
        logradouro: json["logradouro"],
        numero: json["numero"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        unidade: json["unidade"],
        ibge: json["ibge"],
        gia: json["gia"],
      );

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "unidade": unidade,
        "ibge": ibge,
        "gia": gia,
      };
}

// final EnderecoModel EnderecoPagamento = EnderecoModel(
//   cep: EnderecoEnum.cep.value,
//   logradouro: EnderecoEnum.logradouro.value,
//   numero: EnderecoEnum.numero.value,
//   complemento: EnderecoEnum.complemento.value,
//   bairro: EnderecoEnum.bairro.value,
//   cidade: EnderecoEnum.cidade.value,
//   estado: EnderecoEnum.estado.value,
//   pais: EnderecoEnum.pais.value,
// );

class ViaCepService {
  static Future<EnderecoModel> fetchCep({required cep}) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200)
      return EnderecoModel.fromJson(response.body);
    else
      throw Exception('Requisição inválida!');
  }
}

enum EnderecoEnum {
  cep('cep'),
  logradouro('logradouro'),
  numero('número'),
  complemento('complemento'),
  bairro('bairro'),
  cidade('cidade'),
  estado('estado'),
  pais('pais');

  final String value;
  const EnderecoEnum(this.value);
}
