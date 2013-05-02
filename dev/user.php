<?php

	/*
	*  ICI : toutes les fonctions qui concernent les utilisateurs de la base de donnée
	*/



    /* récupère l'id de l'utilisateur en fonction de son pseudo et de son mot de passe */
	function getUserIdAtLogin($pseudo,$password) {
		$sql = 'SELECT idUtilisateur FROM Utilisateur WHERE pseudo = "'.$pseudo.'" AND mdp = "'.$password.'"';
		$result = mysql_query($sql);
		$results = NULL ;
		// on utilise mysql_fetch_array pour ranger les résultats de la requête dans un tableau associatif
		while ($ligne = mysql_fetch_array($result)) {
			$results = $ligne;
		}
		return $results;
	}



	/* Insérer un nouvel utilisateur dans la base de données retourne 0 en cas d'erreur et 1 sinon */
	function  insertUser($nom, $prenom, $pseudo, $password) {
	
		$sql = 'INSERT INTO Utilisateur(nom, prenom, pseudo, mdp) VALUES (
			"'.mysql_real_escape_string($nom).'",
			"'.mysql_real_escape_string($prenom).'",
			"'.mysql_real_escape_string($pseudo).'", 
			"'.mysql_real_escape_string($pseudo).'")';
		if (!mysql_query($sql))
		{
			die('Error: ' . mysql_error());
			return 0;
		}
		return 1;
	}





	/* fonction test formulaires vides/valides */

		//IDENTIFICATION

    function form_login_isValid() {

    	// stockage des erreurs dans un tableau
        $tabErrors = array();

        if(empty($_POST['pseudoConnexion']))  
            $tabErrors['pseudo'] = "pseudo vide";
        if(empty($_POST['passwordConnexion']))  
            $tabErrors['pwd'] = "mot de passe vide";

        if (empty($tabErrors)) return 1;
        else return $tabErrors;
    }

		// IDENTIFICATION : Actions une fois avoir appuyé sur connexion
	if (isset($_POST['connexion'])){
        $taberrors_login = form_login_isValid($_POST);


        if($taberrors_login==1){
            //echo "formulaire completé";

            $pseudo = $_POST["pseudoConnexion"];
			$password = $_POST["passwordConnexion"];
	
			$id_user = getUserIdAtLogin($pseudo,$password);

			if($id_user != NULL) {
				$_SESSION['id_user'] = $id_user["idUtilisateur"];
				header('Location: p_accueil.php');
			}
			else {
				$msg_connexion_login = "le pseudo ou le mot de passe sont inconnus";
			}
        }          
    }



		//INSCRIPTION
	
    function form_registration_isValid() {

    	// stpckage des erreurs dans un tableau
        $tabErrors = array();

        if(empty($_POST['firstNameRegistration']))  
            $tabErrors['prenom'] = "prenom vide";
        if(empty($_POST['lastNameRegistration']))  
            $tabErrors['nom'] = "nom vide";
		if(empty($_POST['pseudoRegistration']))  
            $tabErrors['pseudo'] = "pseudo vide";
		if(empty($_POST['pwdRegistration1']))  
            $tabErrors['mdp1'] = "mdp vide";
		if(empty($_POST['pwdRegistration2']))  
            $tabErrors['mdp'] = "confirmation mdp vide";

        if (empty($tabErrors)) return 1;
        else return $tabErrors;
    }

		// IINSCRIPTION: Actions une fois avoir appuyé sur inscription
	if (isset($_POST['registration'])){
        $taberrors_registration = form_registration_isValid($_POST);


        if($taberrors_registration==1){
            //echo "formulaire completé";
			$nom = $_POST['lastNameRegistration'];
			$prenom = $_POST['firstNameRegistration'];
            $pseudo = $_POST["pseudoRegistration"];
            if ($_POST['pwdRegistration1'] == $_POST['pwdRegistration2']) {
				$pwd = $_POST['pwdRegistration1'];

				$id_user = getUserIdAtLogin($pseudo,$pwd);

				if($id_user == NULL) {
					insertUser($nom, $prenom, $pseudo, $pwd);
					//$_SESSION['id_user'] = $id_user["idUtilisateur"];
					//header('Location: p_accueil.php');
					$msg_connexion_registration = "Inscritpion SUCCESS";
				}
				else {
					$msg_connexion_registration = "l'utilisateur existe deja veuillez vous identifier ou trouver un autre pseudo";
				}
            }
			else {
				$msg_connexion_registration = "pb avec la confirmation";
			}

			
        }          
    }
	