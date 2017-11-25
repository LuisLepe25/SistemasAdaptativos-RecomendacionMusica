using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecomendacionMusicaZuquistrukis.Models
{
    public class Cancion
    {
        public String Id { get; set; }
        public String Nombre { get; set; }
        public String Artista { get; set; }
        public List<Tag> Tags { get; set; }
        public int Aptitud { get; set; }
        public float ProbabilidadSeleccion { get; set; }
        public float numMin { get; set; }
        public float numMax { get; set; }

        public Cancion(String id)
        {
            this.Id = id;
        }
        public Cancion(String id, String nombre, String artista, List<Tag> tags)
        {
            this.Id = id;
            this.Nombre = nombre;
            this.Artista = artista;
            this.Tags = tags;
        }
        public void AddTag(Tag oTag)
        {
            foreach(Tag ot in this.Tags)
            {
                if (ot.IdTag == oTag.IdTag)
                {
                    return;
                }
            }
            this.Tags.Add(oTag);
        }
    }
}