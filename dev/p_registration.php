<?php 
	/*
	*	PAGE INSCRIPTION ou IDENTIFICATION
	*/

	/* imports des fonctions necessaires au fonctionnement de la page */

	require_once('conf/top.php');

	$template = $tpl->loadTemplate('registration.html');
	
	/* declaration variables a envoyé au template */
	$taberrors_login="";
	$taberrors_registration="";
	$msg_connexion_login="";
	$msg_connexion_registration="";
	//$id_user="";
	
	require_once('user.php');




	/* on envoie les infos necessaires */
	echo $template->render(array(
		'ASSETS_PATH'=>ASSETS_PATH,
		'taberrors_login'=>$taberrors_login,
		'taberrors_registration'=>$taberrors_registration,
		'msg_connexion_login'=>$msg_connexion_login,
		'msg_connexion_registration'=>$msg_connexion_registration));

