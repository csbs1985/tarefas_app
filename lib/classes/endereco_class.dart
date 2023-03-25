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

class EnderecoClass {
  String montarEnderecoString(String enderecoCompleto) {
    Map<String, dynamic> jsonMap = jsonDecode(enderecoCompleto);

    String cep = jsonMap['cep'];
    String logradouro = jsonMap['logradouro'];
    String numero = jsonMap['numero'];
    String complemento = jsonMap['complemento'];
    String bairro = jsonMap['bairro'];
    String localidade = jsonMap['localidade'];
    String uf = jsonMap['uf'];

    StringBuffer endereco = StringBuffer(logradouro.trim());
    if (numero.isNotEmpty) endereco.write(', $numero');
    if (complemento.isNotEmpty) endereco.write(', $complemento');
    if (cep.isNotEmpty) endereco.write(' - CEP: $cep');
    if (bairro.isNotEmpty) endereco.write(' - $bairro');
    if (localidade.isNotEmpty) endereco.write(' - $localidade');
    if (uf.isNotEmpty) endereco.write(' - $uf');
    return endereco.toString();
  }

  String montarEnderecoMaps(String enderecoCompleto) {
    Map<String, dynamic> jsonMap = jsonDecode(enderecoCompleto);

    String logradouro = jsonMap['logradouro'];
    String numero = jsonMap['numero'];
    String bairro = jsonMap['bairro'];
    String localidade = jsonMap['localidade'];
    String uf = jsonMap['uf'];

    StringBuffer endereco = StringBuffer(numero.trim());
    if (numero.isNotEmpty) endereco.write(', $logradouro');
    if (bairro.isNotEmpty) endereco.write(' - $bairro');
    if (localidade.isNotEmpty) endereco.write(' - $localidade');
    if (uf.isNotEmpty) endereco.write(', $uf');
    return endereco.toString();
  }
}

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
  localidade('localidade'),
  uf('uf'),
  pais('pais');

  final String value;
  const EnderecoEnum(this.value);
}
