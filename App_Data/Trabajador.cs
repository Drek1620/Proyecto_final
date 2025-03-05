using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;

public class Trabajador
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string Id { get; set; }

    [BsonElement("nombre")]
    public string Nombre { get; set; }

    [BsonElement("puesto")]
    public string Puesto { get; set; }

    [BsonElement("pagos")]
    public List<PagoNomina> Pagos { get; set; } = new List<PagoNomina>();
}