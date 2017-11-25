using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecomendacionMusicaZuquistrukis.Models
{
    public class Tag
    {
        public int IdTag { get; set; }
        public String Nombre { get; set; }
        public int Aptitud { get; set; }

        public Tag(int idTag, String nombre, int aptitud)
        {
            this.IdTag = idTag;
            this.Nombre = nombre;
            this.Aptitud = aptitud;
        }
    }
}