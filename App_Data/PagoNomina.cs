using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;

[Serializable]
public class PagoNomina
{
    [BsonElement("fecha")]
    public DateTime Fecha { get; set; }

    [BsonElement("monto")]
    public decimal Monto { get; set; }
}