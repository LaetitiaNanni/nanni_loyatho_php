<?php 
	/*
	*	PAGE ACCUEIL
	*/


	// imports des fonctions necessaires au fonctionnement de la page
	require_once('conf/top.php');
	require_once('fonction.php');
	require_once('user.php');

	$template = $tpl->loadTemplate('index.html');

	/* ici le code php traitant le moteur de recherche */

	$plats="";

	if(isset($_SESSION['id_user'])) {
		$session=1;
		// session d'admin
		if($_SESSION['id_user']==1) {
			$session=2;
		}

	}
	
	$plats=getAllProducts();


	/* on envoie les infos necessaires */

	echo $template->render(array('ASSETS_PATH'=>ASSETS_PATH, 'plats'=>$plats,'session'=>$session));

