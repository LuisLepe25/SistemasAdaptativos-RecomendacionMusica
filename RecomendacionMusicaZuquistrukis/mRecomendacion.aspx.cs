using Microsoft.AspNet.Identity;
using RecomendacionMusicaZuquistrukis.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecomendacionMusicaZuquistrukis
{
    public partial class mRecomendacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Context.User.Identity.GetUserId() != null)
                {
                    System.Diagnostics.Debug.WriteLine("Iniciando");
                    List<Cancion> lst = new List<Cancion>();
                    using (DBManualConnection db = new DBManualConnection())
                    {
                        lst = db.getCanciones(idUsuario: Context.User.Identity.GetUserId());
                    }

                    if (lst.Count != 0)
                    {
                        AlgoritmoGenetico ag = new AlgoritmoGenetico(lst);
                        ag.calcularAptitudPoblacionInicial();
                        List<List<Tag>> lstTagsHijos = new List<List<Tag>>();
                        lstTagsHijos = ag.generarParejas();

                        //Conversion para desplagar los tags en web
                        /*
                        List<String> tagsCancionesHijas = new List<String>();
                        String renglonTag = "";
                        foreach (List<Tag> lstTag in lstTagsHijos)
                        {
                            renglonTag = "";
                            foreach (Tag tag in lstTag)
                            {
                                renglonTag += tag.Nombre + ", ";
                            }
                            tagsCancionesHijas.Add(renglonTag);
                        }
                        grd1.DataSource = tagsCancionesHijas;
                        grd1.DataBind();
                        */

                        //Obteniendo canciones recomendadas por los tags creados
                        List<Cancion> lstCancionesRecomendadas = new List<Cancion>();
                        foreach (List<Tag> lstTag in lstTagsHijos)
                        {
                            using (DBManualConnection db = new DBManualConnection())
                            {
                                lstCancionesRecomendadas.AddRange(db.obtenerListaCancionesRecomendadas(lstTag));
                            }
                        }
                        List<Cancion> lstCancionesRecomendadasSinRepetir = lstCancionesRecomendadas.GroupBy(x => x.Id).Select(x => x.First()).ToList();
                        //grd2.DataSource = lstCancionesRecomendadasSinRepetir;
                        //grd2.DataBind();
                        rep1.DataSource = lstCancionesRecomendadasSinRepetir;
                        rep1.DataBind();
                        
                    }
                }
            }

            string strGUID = Context.User.Identity.GetUserId();
        }

        protected void rep1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                List<Cancion> lstCancionesRecomendadasSinRepetir = rep1.DataSource as List<Cancion>;
                Repeater rep2 = (Repeater)e.Item.FindControl("rep2");
                List<Tag> lstTagsCancionesRecomendadasSinRepetir = new List<Tag>();
                Cancion cActual = e.Item.DataItem as Cancion;
                foreach (Cancion c in lstCancionesRecomendadasSinRepetir)
                {
                    if(c.Id == cActual.Id)
                    {
                        foreach (Tag t in c.Tags)
                        {
                            lstTagsCancionesRecomendadasSinRepetir.Add(t);
                        }
                    }
                }

                rep2.DataSource = lstTagsCancionesRecomendadasSinRepetir;
                rep2.DataBind();
            }
        }
    }
}