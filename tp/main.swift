//
//  main.swift
//  tp
//
//  Created by Maxime Britto on 29/09/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import Foundation

//Déclarez vos fonctions en dessous de cette ligne
func exercice1() {
    print("Entrez votre prénom :")
    let valeurSaisie = readText()
    print("Bonjour \(valeurSaisie) !")
}

func excercice2(){
    print ("Entrez la première note :")
    let notePremiereSaisie:Double = readDouble()
    print ("Entrez la deuxième note :")
    let noteDeuxiemeSaisie:Double = readDouble()
    print ("Entrez la troisième note :")
    let noteTroisièmeSaisie:Double = readDouble()
    let moyenne:Double = (notePremiereSaisie + noteDeuxiemeSaisie + noteTroisièmeSaisie)/3
    print("Moyenne des notes \(moyenne)")
}

func excercice3(){
    print ("Entrez la base du triangle :")
    let base:Double = readDouble()
    print ("Entrez la hauteur du triangle:")
    let hauteur:Double = readDouble()
    let aire = (base * hauteur)/2
    print("Aire du triangle \(aire)")
}

func excercice4(){
    let PI:Double = 3.14159265
    print ("Entrez le rayon du cercle :")
    let rayon:Double = readDouble()
    let aire = PI*pow(rayon,2)
    print("Aire du cercle \(aire)")
}


func excercice5(){
    print ("Entrez un chiffre :")
    let chiffre:Int = readInt()
    var factorielValeur:Int = 1;
    for n in 1...chiffre{
        factorielValeur = factorielValeur*n
    }
    print("Factoriel \(factorielValeur)")
}

func excercice6a(){
    print ("Entrez le nombre de notes :")
    let nbNotes:Int = readInt()
    var totalNotes:Double = 0
    for n in 0..<nbNotes{
        let ordinal:String
        if (n == 0) {
            ordinal = "ière"
        } else {
            ordinal = "ième"
        }
        print ("Entrez la \(n+1)" + ordinal + "  note :")
        let noteSaisie:Double = readDouble()
        totalNotes += noteSaisie
    }
    let moyenne:Double = totalNotes / Double(nbNotes)
    print("La moyenne des \(nbNotes) notes est de \(moyenne)")
}

func excercice7(){
    let valChoisieParOrdinateur = generateRandomNumber(min: 1, max: 5)
    var jeuEnCours:Bool = true
    while jeuEnCours {
        print ("Entrez votre nombre :")
        let nbSaisi:Int = readInt()
        if (nbSaisi > valChoisieParOrdinateur) {
            print ("Moins")
        } else if (nbSaisi < valChoisieParOrdinateur) {
            print ("Plus")
        } else {
            print ("Bravo")
            jeuEnCours = false
        }
    }
}

func excercice8(){
    var nbAllumettesEnCours : Int = 20
    var jeuEnCours:Bool = true
    var joueurEnCours :String
    let premierJoueur : Int = generateRandomNumber(min: 1, max: 2)
    var nbAllumettesRetirees : Int = 0
    // Lancement du jeu, choix aléatoire du premier joueur
    switch premierJoueur {
    case 1:
        print("Le joueur commence")
        joueurEnCours = "Joueur"
    default:
        print("L'ordinateur commence")
        joueurEnCours = "Ordinateur"
    }
    
    // Boucle principal du jeu
    while jeuEnCours {
        
        print("Il reste \(nbAllumettesEnCours) allumettes")
        
        switch joueurEnCours {
        case "Joueur":
            nbAllumettesRetirees = nbAllumettesJoueur(nbAllumettesEnJeu: nbAllumettesEnCours)
            joueurEnCours = "Ordinateur"
        default:
            nbAllumettesRetirees = nbAllumettesOrdinateur(nbAllumettesEnJeu: nbAllumettesEnCours)
            joueurEnCours = "Joueur"
        }
        
        nbAllumettesEnCours -= nbAllumettesRetirees
        
        if (nbAllumettesEnCours <= 0) {
            print("\(joueurEnCours) a gagné")
            jeuEnCours = false
        }
    }
}

func nbAllumettesOrdinateur(nbAllumettesEnJeu:Int)->Int{
    let nbAllumettesChoisieParOrdinateur:Int
    if (nbAllumettesEnJeu >= 3) {
        nbAllumettesChoisieParOrdinateur = generateRandomNumber(min: 1, max: 3)
    } else {
        nbAllumettesChoisieParOrdinateur = generateRandomNumber(min: 1, max: nbAllumettesEnJeu)
    }
    print("L'ordinateur a retiré \(nbAllumettesChoisieParOrdinateur) allumettes")
    return nbAllumettesChoisieParOrdinateur
}

func nbAllumettesJoueur(nbAllumettesEnJeu:Int) ->Int {
    var nbAllumettesRetirees:Int
    repeat {
        print("Combien d'allumettes souhaitez-vous retirer?")
        nbAllumettesRetirees = readInt()
        if (nbAllumettesRetirees > 3) {
            print("Le nombre maximum d'allumettes à prendre est de 3")
        } else if (nbAllumettesRetirees < 0){
            print("Le nombre d'allumettes doit être positif")
        }
    } while ((nbAllumettesRetirees > 3) || (nbAllumettesRetirees < 0))
    return nbAllumettesRetirees
}

//Commencez vos instructions en dessous de cette ligne
//exercice1()
//excercice2()
//excercice5()
//excercice6a()
//excercice7()
excercice8()



