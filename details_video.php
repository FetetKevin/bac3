<?php
session_start();
include('config.php');
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


<section>
        <?php
        $sql ='SELECT * FROM videos WHERE id_video = '.$_GET["id_video"].' ';
        $reponse = mysqli_query($link,  $sql);
        while($row = mysqli_fetch_array($reponse)) {

            ?>
    <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" id="titreVideo">
                    <h4 style="margin-top: 30px;margin-bottom: 20px; color: #E52C27;"><?= $row['titre_video']; ?></h4>
                    <br>
                    <p>DATE : <?= $row['date_video']; ?></p>
                    <br>
                    <p><?= $row['desc_video']; ?></p>
                </div>
            </div>

            <div class="row g-pad-bottom">
                <div class="col-md-6 col-sm-12 col-xs-12 col-md-offset-3" id="star">
                    <center>
                        <iframe width="600" height="400"
                                src="https://www.youtube.com/embed/<?= $row['url_video']; ?>"
                                frameborder="0" allowfullscreen style="margin-top:30px;"></iframe>
                    </center>
                </div>
            </div>
            <?php
        }
        ?>

        <br>
        <br>
        <div class="container">
            <?php
             $sql ='SELECT * 
                    FROM commentaires 
                    INNER JOIN users
                    ON commentaires.commentaire_id_user = users.id_user
                    WHERE id_video = '.$_GET["id_video"].' 
                    ORDER BY date_commentaire';
            $reponse = mysqli_query($link,  $sql);
            while($row = mysqli_fetch_array($reponse)) {

                ?>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">Posté par : <span style="color:red;"><?= strtoupper($row['nom']).' '. strtoupper($row['prenom']); ?></span> le <span style="color:red;"><?= $row['date_commentaire']; ?></span></div>
                        <div class="panel-body"><?= $row['desc_commentaire']; ?></div>
                    </div>
                </div>
            </div>
            <?php
            }
            ?>
            <hr>
            <br>
        </div>

        <!--<div class="container">
            <div class="row">
                <form method="POST" action="post_com.php">
                    <input name="lienCom" placeholder="Postez votre commentaire ici !">
                    <br>
                    <input type="submit" name="postez" class="btn btn-danger" value="Postez !">
                </form>
            </div>
        </div>-->
        <?php
        if($_SESSION['logged']) {
            ?>
            <div class="container" style="background: white;">
                <div class="row">
                    <h2 class="page-header text-center">Ajoutez un Commentaire !</h2>
                    <div class="col-md-5 col-sm-6 col-xs-12">
                    </div>
                </div>
            </div>
            <div class="container" style="background: white;border-bottom: 1px solid black;">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <form class="form-horizontal" role="form" method="post" action="post_com.php?id_video=<?= $_GET['id_video'] ?>" id="formuLogin">
                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">Votre commentaire</label>
                                <div class="col-sm-10">
                                    <textarea type="text" class="form-control" name="lienCom"></textarea>
                                </div>
                            </div>
<br>
                            <div class="form-group">
                                <div class="col-sm-10 col-sm-offset-2">
                                    <input id="ajouter" name="ajouter" type="submit" value="Ajouter"
                                           class="btn btn-danger">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <?php
        }
        ?>
        <br>
        <br><br>
        <br><br>
        <br><br>
        <br>

    </div>
</section>
</body>
</html>