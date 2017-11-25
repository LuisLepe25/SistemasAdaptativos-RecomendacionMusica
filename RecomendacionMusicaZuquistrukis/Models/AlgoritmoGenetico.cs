using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RecomendacionMusicaZuquistrukis.Models
{
    public class AlgoritmoGenetico
    {
        List<Cancion> Canciones;
        public AlgoritmoGenetico(List<Cancion> poblacionInicial)
        {
            this.Canciones = poblacionInicial;
        }

        public void calcularAptitudPoblacionInicial()
        {
            int aptitudTotal = 0;
            foreach(Cancion can in this.Canciones)
            {
                for(int i = 0; i < can.Tags.Count; i++)
                {
                    int iVal = can.Tags[i].Aptitud;
                    can.Aptitud += iVal;
                }
                aptitudTotal += can.Aptitud;
            }
            generarProbabilidadSeleccion(aptitudTotal);
        }

        public void generarProbabilidadSeleccion(int aptitudTotal)
        {
            float valorAnt = 0.00F;
            float valorAct = 0.00F;
            foreach (Cancion can in this.Canciones)
            {
                can.ProbabilidadSeleccion = (float) can.Aptitud / aptitudTotal * 100;
                valorAct = can.ProbabilidadSeleccion;
                can.numMin = valorAnt;
                can.numMax = valorAct + valorAnt;
                valorAnt = can.numMax;
            }
        }

        public List<List<Tag>> generarParejas()
        {
            List<List<Tag>> lstTagsHijos = new List<List<Tag>>();
            int numParejasAFormar = Canciones.Count / 2;
            Random random = new Random();
            Double numAleatorio;
            Cancion Pareja1 = new Cancion("0");
            Cancion Pareja2 = new Cancion("0");

            for(int i = 0; i <= numParejasAFormar; i++)
            {
                do
                {
                    numAleatorio = random.NextDouble() * 100;
                    foreach (Cancion can in Canciones)
                    {
                        if (numAleatorio >= can.numMin && numAleatorio < can.numMax)
                        {
                            Pareja1 = can;
                        }
                    }
                    numAleatorio = random.NextDouble() * 100;
                    foreach (Cancion can in Canciones)
                    {
                        if (numAleatorio >= can.numMin && numAleatorio < can.numMax)
                        {
                            Pareja2 = can;
                        }
                    }
                } while (Pareja1.Id == Pareja2.Id);

                Pareja pareja = new Pareja(Pareja1, Pareja2);
                lstTagsHijos.AddRange(pareja.cruzaTags());
            }
            return lstTagsHijos;

        }
    }
}