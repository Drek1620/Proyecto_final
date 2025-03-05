using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MongoDB.Driver;
using MongoDB.Bson;
using Antlr.Runtime;
using System.Configuration;

namespace Proyecto_final
{
    public class ConexionMongoDB
    {
        private readonly IMongoCollection<Trabajador> _trabajadoresCollection;

        public ConexionMongoDB()
        {
            var cliente = new MongoClient(ConfigurationManager.AppSettings["MongoBDConnectionString"]);
            var database = cliente.GetDatabase(ConfigurationManager.AppSettings["MongoDBDatabaseName"]);
            _trabajadoresCollection = database.GetCollection<Trabajador>("Trabajador");
        }

        public Trabajador ObtenerTrabajador(string id)
        {
            System.Diagnostics.Debug.WriteLine("Consultando en Mongo con ID" + id);
            if (string.IsNullOrEmpty(id) || id.Length != 24 || !MongoDB.Bson.ObjectId.TryParse(id, out ObjectId objectId))
            {
                System.Diagnostics.Debug.WriteLine("Error: ID invalido para mongoDB");
                return null;
            }

            return _trabajadoresCollection.Find(t => t.Id == objectId.ToString()).FirstOrDefault();
        }

        public void AgregarTrabajador(Trabajador trabajador)
        {
            if (trabajador.Id == null)
            {
                trabajador.Id = ObjectId.GenerateNewId().ToString();
            }

            _trabajadoresCollection.InsertOne(trabajador);
        }

        public void ActualizarTrabajador(string id, Trabajador trabajador) =>
            _trabajadoresCollection.ReplaceOne(t => t.Id == id, trabajador);

        public void AgregarPagoNomina(string id, PagoNomina pago)
        {
            var filtro = Builders<Trabajador>.Filter.Eq(t => t.Id, id);
            var actualizacion = Builders<Trabajador>.Update.Push(t => t.Pagos, pago);
            _trabajadoresCollection.UpdateOne(filtro, actualizacion);
        }

        public void EliminarTrabajoador(string id) =>
            _trabajadoresCollection.DeleteOne(t => t.Id == id);

        public List<Trabajador> ObtenerTrabajadores() =>
            _trabajadoresCollection.Find(t => true).ToList();
    }
}