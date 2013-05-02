<?php

require_once 'settings.php';
require_once LIB_PATH . 'db.php';


connectDb();
session_start();
	$session=0;

	if(isset($_GET["logout"])) {
		if($_GET["logout"] == 1) {
			session_destroy();
			$session=0;
			header('Location: p_accueil.php'); 
		}
	}
/* Initialisation moteur Twig */
require_once('lib/Twig/Autoloader.php');
Twig_Autoloader::register();
$loader = new Twig_Loader_Filesystem('../templates'); // Répertoire
$tpl = new Twig_Environment($loader, array(
     'cache' => false, // Désactiver le cache en développement
     //'cache' => 'compilation_cache' // Décommenter cette ligne en production
));

