<?php


if(!empty($_POST['modifier']) && isset($_POST)){

    var_dump($_POST);

    $id_categorie = (int) $_POST['id_categorie'] ;
    $nom_categorie = (string) $_POST['nom_categorie'] ;


    $link = mysqli_connect('localhost','knab','knab','bac');

    $sql= "UPDATE categories SET  
	`nom_categorie` = '$nom_categorie'
	WHERE id_categorie  = $id_categorie";
    var_dump($sql);
    if(mysqli_query($link, $sql)){
        header("Location:formuAjoutCategorie.php?modif=ok");
    }
}
