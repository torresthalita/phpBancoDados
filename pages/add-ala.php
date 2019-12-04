<?php
if (!empty($_POST)) {
    require_once("./model/ala.php");
    $ala = new ala;
    $ala->setNome($_POST['nome']);
    $ala->setQuant_leitos($_POST['leitos']);
    $ala->add();
}
?>
<form method="post" class="container">
    <div class="form-group">
        <label for="nome">Nome da Ala</label>
        <input type="text" class="form-control" id="nome" name="nome" required>
    </div>
    <div class="form-group">
        <label for="leitos">Quantidade de Leitos</label>
        <input type="number" class="form-control" id="leitos" name="leitos" required>
    </div>
    <button type="submit" class="btn btn-primary">Salvar</button>
    <button type="reset" class="btn btn-primary">Cancelar</button>
</form>