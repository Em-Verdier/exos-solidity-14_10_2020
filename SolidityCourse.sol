// SPDX-License-Identifier: MIT                 // SPDX Licence Identifier
pragma solidity ^0.7.0; // Version pragma
pragma experimental ABIEncoderV2; // Experimental pragma

import "Logger.sol" as logger; // import de ./Logger.sol pour les fonctions

/* Declaration class SolidityCourse nom du contrat*/
contract SolidityCourse is
    logger.Logger /*import qui est lié à la Class SolidityCourse*/
{
    address private owner; /*déclaration du type et de la valeur owner;*/

    constructor() public {
        /* constructeur de la Class SolidityCourse (key/pair value)*/
        owner = msg.sender; /* En l'occurence ici message de l'emetteur est lié à la variable d'état owner*/
    }

    /*déclaration de fonction whoIsOwner() (publique), retourne l'adresse publique*/
    function whoIsOwner() public returns (address) {
        /*appelle la fonction log()pousse les logs en interne*/
        log();
        /*retourne la variable owner liée à msg.sender qui retourne
        l'adresse de l'émetteur*/
        return owner;
    }

    /*déclaration de fonction getLastVisitor() visible publiquement, 
    retourne l'adresse publique*/
    function getLastVisitor() public returns (address) {
        /*définition type de la variable lastVisitor (address) liée à la fonction getLast()*/
        address lastVisitor = getLast();
        /*appelle la fonction log()pousse les logs en interne*/
        log();
        /*retourne la variable lastVisitor liée à la fonction getLast,dernier index de l'array logs*/
        return lastVisitor;
    }

    /*déclaration de fonction getNthVisitor() avec en paramètre _pos 
        de type integer 256bits (Grosse chiffre!), retourne publiquement l'adresse*/
    function getNthVisitor(uint256 _pos) public returns (address) {
        /* définition du type de variable de nthVisitor ici address
        liée à la fonction getVisitorByPosition() qui renvoie le dernier index 
        de _pos dans l'array logs sous la forme d'un integer*/
        address nthVisitor = getVisitorByPosition(_pos);
        /*appelle la fonction log()pousse les logs en interne*/
        log();
        /* donne la position le chiffre de la position du visiteur dans la session*/
        return nthVisitor;
    }

    /*déclaration de fonction getAllVisitors(), retourne publiquement l'adresse ici view déactive la modification d'état*/
    function getAllVisitors() public view returns (address[] memory) {
        require(owner == msg.sender, "Only owner can use this function."); /*application d'un modifier check 
        la condition de l'exéction de la fonction*/
        /*retourne l'array de toutes les adresses grâce à la fonction getAll()*/
        return getAll();
    }
}
