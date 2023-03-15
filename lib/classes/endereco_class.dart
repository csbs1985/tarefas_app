class EnderecoModel {
  late String cep;
  late String lagradouro;
  late String? numero;
  late String? complemento;
  late String bairro;
  late String cidade;
  late String estado;
  late String pais;

  EnderecoModel(
    this.cep,
    this.lagradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.cidade,
    this.estado,
    this.pais,
  );
}
