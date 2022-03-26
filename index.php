<!DOCTYPE html>
<html lang="pt-Br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Conteiner</title>
</head>
<body>

<fieldset>
    <form method="post">

        <div>
            <p>Olá, seja bem vindo ao meu sistema!</p>
        </div>

        <div>
            <label><strong>Cliente</strong></label>
            <input type="text" name="cliente" id="cliente" required>
        </div>

        <div>
            <label><strong>Numero do conteiner</strong></label>
            <input type="text" name="numConteiner" id="numConteiner" placeholder="Ex: TEST1234567" required>
        </div>

        <div>
            <label><strong>Tipo</strong></label>
            <input type="radio" name="tipo" value="20" checked> 20 Pés
            <input type="radio" name="tipo" value="40"> 40 Pés
        </div>

        <div>
            <label><strong>Status</strong></label>
            <input type="radio" name="status" value="cheio" checked> Cheio
            <input type="radio" name="status" value="vazio"> Vazio
        </div>

        <div>
            <label><strong>Categoria</strong></label>
            <input type="radio" name="categoria" value="importação" checked> Importação
            <input type="radio" name="categoria" value="exportação"> Exportação
        </div>

        <div>
            <button type="submit" value="cadastrar">Cadastrar
        </div>

    </form>
</fieldset>

<?php
    //conexao do banco
    $pdo = new PDO('mysql:host=localhost;dbname=db_portuario','root','');
    $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

    $sql = $pdo->prepare("SELECT * FROM con_conteiner");
    $sql -> execute();
    
    $fetchConteiner = $sql ->fetchAll();

    //lista dados do banco
    foreach($fetchConteiner as $key => $value){
        
      echo $value['cliente'].' 
       | '.$value['numConteiner'].' 
       | '.$value['tipo'].' 
       | '.$value['status'].' 
       | '.$value['categoria'].'<a href="?delete=' .$value['id'].'">  (DELETAR) </a></br></br>';
        
    }

        //cadastro
    if(isset($_POST['cliente'])){
        $sql = $pdo ->prepare("INSERT INTO con_conteiner VALUES (null,?,?,?,?,?)");
        $sql -> execute(array($_POST['cliente'],$_POST['numConteiner'],$_POST['tipo'],$_POST['status'],$_POST['categoria'],));
        echo "<script>alert('Cadastro feito com sucesso!');location.href=\"index.php\";</script>";
    }

    //delete
    if(isset($_GET['delete'])){
        $id = (int)$_GET['delete'];
        $pdo->exec("DELETE FROM con_conteiner WHERE id=$id");
        echo "<script>alert('Registro deletado com sucesso!');location.href=\"index.php\";</script>";
    }


?>


</body>
</html>