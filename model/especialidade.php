<?php
    class Especialidade{
        private $id_especialidade;
        private $especialidade;
        private $valor_dia;

        //
        public function getId(){
            return $this->id_especialidade;
        }
        public function setId($id){
            $this->id_especialidade = $id;
        }
        
        //
        public function getEspecialidade(){
            return $this->id_especialidade;
        }
       public function setEspecialidade($id){
            $this->id_especialidade = $id;
        }
        
        //especialidade
        public function getEspecialidade(){
        return $this->especialidade;
        }
        public function setEspecialidade($especialidade){
    }

         //valor ----------
         public function getValor_dia(){
            return $this->valor_dia
    }
    public function setvalor_dia($valor_dia){
        $this->getValor_dia = $valor_dia;
    }

    function add(){
        try{
            $sql= "insert into especialidade (especialidade, valor_dia)
            values (:especialidade, :valor)";
            require_once("dao.php");
            $dao = new Dao;
            $stman = $dao->conecta()->prepare($sql);
            $stman->bindParam(":especialidade", getEspecialidade());
            $stman->bindParam(":valor", getValor_dia());
            $stman->execute();
            aviso("Cadastrado!");

        } catch(Exception $e){
            erro("Erro ao cadastrar! " . $e->getMessage());
        }
    }

    
    function listAll(){
        try{
            $sql= "select * from especialidade";
            require_once("dao.php");
            $dao = new Dao;
            $stman = $dao->conecta()->prepare($sql);
            $stman->execute();
            $result = $stman->fetchAll(PDO::FETCH_OBJ);
            
        } catch(Exception $e){
            erro("Erro ao listar! " . $e->getMessage());
        }
       return $result;
    }
}
