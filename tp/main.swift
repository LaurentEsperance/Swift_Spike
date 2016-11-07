//
//  main.swift
//  tp
//
//  Created by Maxime Britto on 29/09/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import Foundation

///////////// TP 01 ///////////////////

//Déclarez vos fonctions en dessous de cette ligne
func exercice1() {
    print("Entrez votre prénom :")
    let valeurSaisie = readText()
    print("Bonjour \(valeurSaisie) !")
}

func exercice2(){
    print ("Entrez la première note :")
    let notePremiereSaisie:Double = readDouble()
    print ("Entrez la deuxième note :")
    let noteDeuxiemeSaisie:Double = readDouble()
    print ("Entrez la troisième note :")
    let noteTroisièmeSaisie:Double = readDouble()
    let moyenne:Double = (notePremiereSaisie + noteDeuxiemeSaisie + noteTroisièmeSaisie)/3
    print("Moyenne des notes \(moyenne)")
}

func exercice3(){
    print ("Entrez la base du triangle :")
    let base:Double = readDouble()
    print ("Entrez la hauteur du triangle:")
    let hauteur:Double = readDouble()
    let aire = (base * hauteur)/2
    print("Aire du triangle \(aire)")
}

func exercice4(){
    let PI:Double = 3.14159265
    print ("Entrez le rayon du cercle :")
    let rayon:Double = readDouble()
    let aire = PI*pow(rayon,2)
    print("Aire du cercle \(aire)")
}


func exercice5(){
    var chiffre:Int
    repeat {
        print ("Entrez un chiffre positif:")
        chiffre = readInt()
    } while chiffre < 0
    
    var factorielValeur:Int = 1;
    if (chiffre > 0) {
        for n in 1...chiffre{
            factorielValeur = factorielValeur*n
        }
    }
    print("Factoriel de \(chiffre) est \(factorielValeur)")
}

func exercice6a(){
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

func exercice6b() {
    var nbNotes:Int = 0
    var noteSaisie:Double = 0
    var sommeNotes:Double = 0
    repeat{
        print("Entrez la note \(nbNotes + 1)")
        noteSaisie = readDouble()
        if (noteSaisie >= 0) {
            sommeNotes += noteSaisie
            nbNotes += 1
        }
    } while noteSaisie >= 0
    if (nbNotes > 0){
        let moyenne = sommeNotes / Double(nbNotes)
        print("La moyenne des \(nbNotes) notes est de \(moyenne)")
    }
}

func exercice7(){
    let valChoisieParOrdinateur = generateRandomNumber(min: 1, max: 5)
    var jeuEnCours:Bool = true
    var nbTentatives:Int = 0
    while jeuEnCours {
        print ("Entrez votre nombre :")
        nbTentatives += 1
        let nbSaisi:Int = readInt()
        if (nbSaisi > valChoisieParOrdinateur) {
            print ("Moins")
        } else if (nbSaisi < valChoisieParOrdinateur) {
            print ("Plus")
        } else {
            print ("Bravo vous avez réussi en \(nbTentatives) tentatives")
            jeuEnCours = false
        }
    }
}

func exercice8(){
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
            //nbAllumettesRetirees = nbAllumettesOrdinateur(nbAllumettesEnJeu: nbAllumettesEnCours)
            nbAllumettesRetirees = nbAllumettesIA(nbAllumettesEnJeu: nbAllumettesEnCours)
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
    nbAllumettesChoisieParOrdinateur = generateRandomNumber(min: 1, max: min(3,nbAllumettesEnJeu))
    //    if (nbAllumettesEnJeu >= 3) {
    //        nbAllumettesChoisieParOrdinateur = generateRandomNumber(min: 1, max: 3)
    //    } else {
    //        nbAllumettesChoisieParOrdinateur = generateRandomNumber(min: 1, max: nbAllumettesEnJeu)
    //    }
    print("L'ordinateur a retiré \(nbAllumettesChoisieParOrdinateur) allumette" + (nbAllumettesChoisieParOrdinateur > 1 ? "s" : ""))
    return nbAllumettesChoisieParOrdinateur
}

func nbAllumettesIA(nbAllumettesEnJeu:Int)->Int{
    var nbAllumettesChoisieParOrdinateur:Int = (nbAllumettesEnJeu - 1) % 4
    if (nbAllumettesChoisieParOrdinateur == 0) {
        nbAllumettesChoisieParOrdinateur = generateRandomNumber(min: 1, max: min(3,nbAllumettesEnJeu))
    }
    print("L'ordinateur a retiré \(nbAllumettesChoisieParOrdinateur) allumette" + (nbAllumettesChoisieParOrdinateur > 1 ? "s" : ""))
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


///////////// TP 02 ///////////////////
func tp02ex01(){
    var longCot1:Double
    var longCot2:Double
    repeat{
        print("Donnez la longueur du premier côté")
        longCot1 = readDouble()
    } while longCot1 < 0
    
    repeat{
        print("Donnez la longueur du deuxième côté")
        longCot2 = readDouble()
    } while longCot2 < 0
    let longCot3 = pythagore(l1: longCot1, l2: longCot2)
    print("La longueur de l'hypothenuse est de \(longCot3)")
}

func pythagore(l1:Double, l2:Double) -> Double {
    let hypothenuse = sqrt(pow(l1, 2)+pow(l2,2))
    return hypothenuse
}

func tp02ex02() {
    demandeValeurs(diviseur: 7)
    demandeValeurs(diviseur: 4)
    demandeValeurs(diviseur: 2)
}

func demandeValeurs(diviseur:Int){
    var nbValeurs:Int = 0
    var valeurSaisie:Int = 0
    var nbValeursDivNum:Int = 0
    repeat {
        print("Entrez une nouvelle valeur")
        valeurSaisie = readInt()
        if (valeurSaisie != 0) {
            nbValeurs += 1
            if (valeurSaisie % diviseur == 0){
                nbValeursDivNum += 1
            }
        }
        
    } while valeurSaisie != 0
    print("Vous avez entré \(nbValeurs) valeurs en tout")
    print("Vous avez entré \(nbValeursDivNum) valeurs divisible par \(diviseur)")
}

func tp02ex03() {
    var nVal:Int = 0
    repeat {
        print("Veuillez saisir la dimension de la multiplication")
        nVal = readInt()
    } while nVal < 0
    if (nVal > 0) {
        for nLigne in 1...nVal {
            for nCol in 1...nVal {
                print("\(nCol*nLigne) ",terminator:"")
            }
            print("")
        }
    }
    
}

func tp02ex04() {
    var nbApproch:Int = 0
    var sommeEntierVal:Int = 0
    var iterateur:Int = 0
    
    repeat {
        print("Veuillez saisir un nombre positif")
        nbApproch = readInt()
    } while nbApproch < 0
    
    repeat {
        iterateur += 1
        sommeEntierVal += iterateur
    } while sommeEntierVal < nbApproch
    
    // on vérifie le cas ou l'écart est le plus petit avec ou sans le dernier élément ajouté 
    // dans le cas d'égalité on prend l'élément le plus petit
    if ((sommeEntierVal - nbApproch) >= (nbApproch - (sommeEntierVal - iterateur ))){
        sommeEntierVal -= iterateur
    }
    
    print("La somme la plus proche est \(sommeEntierVal)")
}

//Commencez vos instructions en dessous de cette ligne
//exercice1()
//exercice2()
//exercice5()
//exercice6a()
//exercice6b()
//exercice7()
//exercice8()
//tp02ex01()
//tp02ex02()
//tp02ex03()
tp02ex04()
