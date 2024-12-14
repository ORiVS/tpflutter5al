# TP Flutter 5AL

Ce projet Flutter est un exercice pour démontrer l'usage des patterns **Bloc** et **Repository** avec une source de données simulée (Fake DataSource). L'application permet de gérer des posts avec des fonctionnalités telles que l'affichage, la création et la modification de posts.

## Fonctionnalités

- **Voir une liste de posts** : Affiche une liste de posts fictifs récupérés depuis une source de données.
- **Créer un nouveau post** : Permet à l'utilisateur d'ajouter un post via un formulaire.
- **Modifier un post existant** : Permet à l'utilisateur de modifier un post sélectionné.
- **Gestion des états** : L'application gère les différents états comme le chargement, les erreurs et le succès pour chaque opération.

## Architecture

- **Bloc Pattern** : Utilisé pour la gestion des états de l'application.
- **Repository Pattern** : Permet de centraliser la logique d'accès aux données avec une source de données distante ou locale.
- **Source de données simulée (Fake DataSource)** : Une fausse source de données pour simuler la récupération, la création et la mise à jour des posts.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé les outils suivants sur votre machine :

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Étapes pour exécuter l'application

1. **Clonez le projet** :
   ```bash
   git clone https://github.com/ORiVS/tpflutter5al.git
   cd tpflutter5al
   ```

2. **Récupérez les dépendances** :
   ```bash
   flutter pub get
   ```

3. **Exécutez l'application** :
   ```bash
   flutter run
   ```

Cela devrait lancer l'application sur un émulateur ou un appareil physique connecté.

## Ressources utiles

Si vous êtes nouveau dans le développement Flutter, voici quelques ressources pour vous aider à démarrer :

- [Codelab : Écrivez votre première application Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook : Exemples utiles de Flutter](https://docs.flutter.dev/cookbook)

Pour toute aide supplémentaire, consultez la [documentation Flutter en ligne](https://docs.flutter.dev/), qui propose des tutoriels, des échantillons et une référence complète de l'API.
```