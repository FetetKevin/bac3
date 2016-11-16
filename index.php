<?php
session_start();
include('config.php');
//PAGINATION
$per_page=4;
if (isset($_GET['page'])) {
    $page = $_GET['page'];
}
else {
    $page=1;
}
//var_dump($page);
// COMMENCE DE 0  MUTLIPLI PAR : PER PAGE
$start_from = ($page-1) * $per_page;


//barre de tri
if (isset($_GET['act'])) {

    $categorie = ucfirst($_GET['act']);

}




?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Bac </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
    <!-- CUSTOM STYLE CSS -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/nbpcss.css" rel="stylesheet" />
    <!-- ----- -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="http://orig04.deviantart.net/74de/f/2012/155/d/1/4chan_logo_hq_by_michaudotcom-d529rdh.png" type="image/x-icon" />
    <!-- JS : TRIER LES VIDEOS -->
    <script type="text/javascript" src="assets/js/tri_page_videos.js"></script>
    <script src="assets/js/placeholderTypewriter.js"></script>

</head>

<body>
<!-- MENU -->
<?php include('navbar.php'); ?>
<br>
<br>
<!-- BAR DE RECHERCHE -->
<?php include('sortbar.php'); ?>


<?php
//RECUPERE videos + categories
$TableVideos = "SELECT * FROM videos 
	LEFT JOIN categories 
	ON videos.categorie_video = categories.id_categorie";
//SI IL Y A UNE CATEGORIE
if(isset($categorie)){
    $TableVideos.= " WHERE categories.nom_categorie = '$categorie' ";
}

$TableVideos.=" ORDER BY id_video DESC LIMIT $start_from, $per_page";

$reponse = mysqli_query($link,  $TableVideos);
while($row = mysqli_fetch_assoc($reponse)){

    ?>
    <!----- Class
    video => indique un container video
    videoCat-number => id_categorie
    data-addVideo => timestamp
    ----->
    <?php
    if($row['etat_video'] == "publie") {
        ?>
        <div data-addVideo="<?= $row['date_video'] ?>" class="container video videoCat-<?= $row['id_categorie'] ?>">
            <div class="row g-pad-bottom">
                <div class="col-md-12">
                    <div class="col-md-6 col-sm-12 col-xs-12 col-md-offset-3" id="titreVideo">
                        <h4 style="margin-top: 30px;margin-bottom: 20px; color: #E52C27;"><?= $row['titre_video']; ?></h4>
                       <!-- <p><?= $row['desc_video']; ?></p>
                        <p>DATE : <?= $row['date_video']; ?></p>-->
                        <p>Categorie : <?= $row['nom_categorie']; ?></p>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-6 col-md-offset-3">
                            <center>
                                <a href="details_video.php?id_video=<?= $row['id_video'] ?>">
                                <img src="vignette/<?php echo $row['vignette_video'] ?>" class="img-squarre img-responsive" style="height: 200px;width:300px;">
                                    </a>
                            </center>
                        </div>
                    </div>

                    <hr>
                </div>
            </div>
        </div><!-- fin ontainer -->
        <?php
    }
}
?>

<!-- PAGINATION -->
<div>
    <?php

    // RECUPERER TABLE "VIDEOS"
    $TableVideos = "SELECT * FROM videos ORDER BY id_video";
    $exec = mysqli_query($link,  $TableVideos);

    // RECUPERER LE NOMBRE D'ENTREES
    $total_records = mysqli_num_rows($exec);

    //ARRONDI LE nmEntree / per_page
    $total_pages = ceil($total_records / $per_page);

    //GO TO FIRST PAGE
    echo '<center><ul class="pagination" style="margin-bottom: 140px;"><li><span><a href="index.php?page=1">First Page</a></span></li>';

    for ($i=1; $i<=$total_pages; $i++) {
        echo "<li><span><a href=index.php?page=$i>".$i."</a></span></li>";
    };
    // GO TO LAST PAGE
    echo "<li><span><a href=index.php?page=$total_pages>Last Page</a></span></li></center>";
    ?>
</div><!-- FIN PAGINATION -->

<script src="dynamicplaceholder.js"></script>

</body>
</html>