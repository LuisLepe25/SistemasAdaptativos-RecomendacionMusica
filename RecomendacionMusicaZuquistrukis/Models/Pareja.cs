using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecomendacionMusicaZuquistrukis.Models
{
    public class Pareja
    {
        Cancion pareja1;
        Cancion pareja2;

        public Pareja(Cancion pareja1, Cancion pareja2)
        {
            this.pareja1 = pareja1;
            this.pareja2 = pareja2;
        }

        public List<List<Tag>> cruzaTags()
        {
            List<List<Tag>> lst = new List<List<Tag>>();
            var random = new Random();
            String nameTag1;
            String nameTag2;
            int index;
            int index2;
            Cancion hijo1;
            Cancion hijo2;

            //Mezclamos genes de pareja1 con pareja2 para formar hijo1
            index = random.Next(this.pareja1.Tags.Count);
            this.pareja1.Tags.RemoveAt(index);

            index2 = random.Next(this.pareja2.Tags.Count);
            this.pareja1.AddTag(this.pareja2.Tags[index2]);
            hijo1 = this.pareja1;

            //Mezclamos genes de pareja1 con pareja2 para formar hijo2
            index2 = random.Next(this.pareja2.Tags.Count);
            this.pareja2.Tags.RemoveAt(index2);

            index = random.Next(this.pareja1.Tags.Count);
            this.pareja2.AddTag(this.pareja1.Tags[index]);
            hijo2 = this.pareja2;

            lst.Add(hijo1.Tags);
            lst.Add(hijo2.Tags);
            return lst;
        }
    }
}