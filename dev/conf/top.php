<?php

require_once 'settings.php';
require_once LIB_PATH . 'db.php';

/* Initialisation moteur Twig */
require_once('lib/Twig/Autoloader.php');
Twig_Autoloader::register();
$loader = new Twig_Loader_Filesystem('../templates'); // Répertoire
$tpl = new Twig_Environment($loader, array(
     'cache' => false, // Désactiver le cache en développement
     //'cache' => 'compilation_cache' // Décommenter cette ligne en production
));

