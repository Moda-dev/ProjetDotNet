using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ProjetDotNet.Models
{
    public class LogOnModel
    {
        [Required]
        [Display(Name = "Nom d'utilisateur")]
        public String UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Mot de passe")]
        public String Password { get; set; }


    }
}