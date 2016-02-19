using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GameServices.Entities;
using System.IO;

namespace GameServices
{
    public class ProductRepository
    {
        private string directory =
                @"U:\Documents\Visual Studio 2010\Projects\ProjetDotNet\Games";
        private string file = @"\Games.txt";

        public List<GameEntity> GetGames()
        {
            var games = new List<GameEntity>();

            // On vérifie si le dossier existe
            Boolean isExistingGameDirectory =
                Directory.Exists(directory);

            // Si le dfossier n'existe pas on le créé
            if (!isExistingGameDirectory)
            {
                Directory.CreateDirectory(directory);
            }

            // On vérifie si le fichier existe
            Boolean isExistingGameFile =
                File.Exists(directory + file);

            // Si le fichier n'existe pas, on le créé
            if (!isExistingGameFile)
            {
                File.Create(directory + file).Close(); // Il faut fermer l'accès au fichier, car dans notre exemple on ne souhaite pas écrire directement dedans
            }

            try
            {
                // On récupère le contenu du fichier ; on récupère un tableau de lignes
                string[] fileContent =
                    File.ReadAllLines(directory + file);

                // On parcours chaque ligne du tableau
                foreach (string fileLine in fileContent)
                {
                    // Si la ligne est vide, on passe à la suivante
                    if (string.IsNullOrEmpty(fileLine))
                    {
                        continue; // On indique à la boucle "for" qu'on ne souhaite pas exécuter la reste du code de la boucle, mais passer à l'itération suivante
                    }
                    // Pour chaque ligne, on récupère un tableau de la ligne splittée sur le charactère ';'
                    string[] lineValues = fileLine.Split(';');

                    // Pour chaque ligne, on créé un nouveau jeu à partir des infos que la ligne nous renvoie
                    GameEntity game = new GameEntity();
                    game.Id = Convert.ToInt32(lineValues[0]);
                    game.Name = lineValues[1];
                    game.Description = lineValues[2];
                    games.Add(game);
                }
            }
            catch (Exception ex)
            {
                // Logger l'exception
            }

            return games;
        }

        public GameEntity GetById(int id)
        {
            // On récupère l'ensemble des jeu
            var games = GetGames();

            return games // On récupère le premier qui a l'identifiant que l'on cherche
                .FirstOrDefault(game => game.Id == id);
        }

        public void CreateEntity(int id,
            string name, string description)
        {
            var games = GetGames();
            var game = new GameEntity();
            game.Id = id;
            game.Name = name;
            game.Description = description;

            games.Add(game);

            // On ajoute la ligne au fichier
            WriteGameList(games);
        }

        public void UpdateEntity(int id,
            string name, string description)
        {
            // On récupère la liste des jeux
            var games = GetGames();

            // On prend le premier jeu qui correspond à l'identifiant recherché
            var gameToUpdate = games
                .First(game => game.Id == id);

            //On met à jour le nom et la description
            gameToUpdate.Name = name;
            gameToUpdate.Description = description;

            WriteGameList(games);
        }

        public void DeleteEntity(int id)
        {
            // On récupère la liste des jeux
            var games = GetGames();

            // On prend le premier jeu qui correspond à l'identifiant recherché
            var gameToDelete = games
                .First(game => game.Id == id);

            //On met à jour le nom et la description
            games.Remove(gameToDelete);


            WriteGameList(games);
        }

        private void WriteGameList(List<GameEntity> games)
        {
            // On transforme en texte la liste de jeux
            string content = "";
            foreach (var game in games)
            {
                // Si le fichier n'est pas vide, on ajouter un retour à la ligne
                if (!string.IsNullOrEmpty(content))
                    content += "\r\n";

                content += game.Id + ";" + game.Name + ";" + game.Description;
            }

            // On écris la liste de jeu dans la fichier
            File.WriteAllText(directory + file, content);
        }
    }
}