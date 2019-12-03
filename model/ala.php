<?php
require_once("especialidade.php");

class Ala
{
    private $id_ala;
    private $especialidade;
    private $nome;
    private $quant_leitos;

    public function __construct()
    {
        $especialidade = new Especialidade;
        $quant_leitos  = 1;
    }


    // START TRANSACTION;
    // insert into ala 
    // (ala.fk_id_hospital,ala.fk_id_especialidade, ala.nome, ala.quant_leitos) 
    // values (1, 1, "B", 123);
    // COMMIT;
    // #ROLLBACK;
    function add()
    {
        try {
            $sql = "
            START TRANSACTION;

            insert into ala (fk_id_hospital,fk_id_especialidade,quant_leitos) 
            values (:id_hospital, :id_especialidade, :leitos);

            ";
            require_once("dao.php");
            $dao = new Dao;
            $stman = $dao->conecta()->prepare($sql);
            $stman->bindParam(":especialidade", $this->nome);
            $stman->bindParam(":valor", $this->valor_dia);
            $stman->execute("COMMIT;");
            aviso("Cadastrado!");
        } catch (PDOException $e) {
            if ($e->getCode() == 23000) {
                $stman.exec("ROLLBACK");
                erro("Dados ja cadastrados!");
            } else {
                $stman.exec("ROLLBACK");
                erro("Erro ao cadastrar! " . $e->getCode());
            }
        }
    }

    function listAll()
    {
        $result = null;
        try {
            $sql = "select * from especialidade";
            require_once("dao.php");
            $dao = new Dao;
            $stman = $dao->conecta()->prepare($sql);
            $stman->execute();
            $result = $stman->fetchAll(PDO::FETCH_OBJ);
        } catch (Exception $e) {
            erro("Erro ao listar! " . $e->getMessage());
        }
        return $result;
    }

    public function getId_ala()
    {
        return $this->id_ala;
    }

    public function setId_ala($id_ala)
    {
        $this->id_ala = $id_ala;

        return $this;
    }

    public function getEspecialidade()
    {
        return $this->especialidade;
    }

    public function setEspecialidade($especialidade)
    {
        $this->especialidade = $especialidade;

        return $this;
    }

    public function getQuant_leitos()
    {
        return $this->quant_leitos;
    }

    public function setQuant_leitos($quant_leitos)
    {
        $this->quant_leitos = $quant_leitos;

        return $this;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function setNome($nome)
    {
        $this->nome = $nome;

        return $this;
    }
}
