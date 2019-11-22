<form method="POST">

  <div class="form-group">
    <label for="cep">CEP</label>
    <input type="text" class="form-control" id="cep" placeholder="Digite seu cep" name="cep">
  </div>
  <div class="form-group">
    <label for="logradouro">Logradouro</label>
    <input type="text" class="form-control" id="logradouro" placeholder="Digite sua rua" name="logradouro">
  </div>
  <div class="form-group">
    <label for="bairro">Bairro</label>
    <input type="text" class="form-control" id="bairro" placeholder="Digite seu bairro" name="bairro">
  </div>
  <div class="form-group">
    <label for="bairro">Cidade</label>
    <input type="text" class="form-control" id="cidade" placeholder="Digite sua cidade" name="cidade">
  </div>
  <div class="form-group">
    <label for="uf">Estado</label>
    <input type="text" class="form-control" id="uf" placeholder="Digite seu estado" name="uf">
  </div>
  <button type="submit" class="btn btn-primary">Salvar</button>
  <button type="reset" class="btn btn-primary">Apagar</button>
</form>

<?php
    if(!empty($_POST)){

    require_once("./model/endereco.php");
    $endereco = new Endereco;
    $endereco->cep = $_POST['cep'];
    $endereco->logradouro = $_POST['logradouro'];
    $endereco->bairro = $_POST['bairro'];
    $endereco->cidade = $_POST['cidade'];
    $endereco->uf = $_POST['uf'];
    $endereco->add();

}