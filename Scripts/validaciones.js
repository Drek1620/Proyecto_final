
function validarForm() {
    var errorCount = 0; // Contador de errores

    //variables de de los txt y labels
    var nombre = document.getElementById('txtNombre').value;
    var puesto = document.getElementById('txtPuesto').value;
    var lblNombre = document.getElementById("lblNombre");
    var lblPuesto = document.getElementById("lblPuesto");

    // Limpia mensajes de error
    lblNombre.innerText = "";
    lblPuesto.innerText = "";

    // Validar Nombre
    if (nombre.trim() === "") {
        lblNombre.innerText = "El Nombre es obligatorio.";
        errorCount++;
    } else {
        var nombreRegex = /^[a-zA-Z\s]+$/;
        if (!nombreRegex.test(nombre)) {
            lblNombre.innerText = "El Nombre solo puede contener letras y espacios.";
            errorCount++;
        }
    }

    // Validar Puesto
    if (puesto.trim() === "") {
        lblPuesto.innerText = "El Puesto es obligatorio.";
        errorCount++;
    }

    // Si hay errores se enviara falso
    return errorCount === 0;
}


function validarPago() {
    var errorCount = 0; // Contador de errores

    var fechaPago = document.getElementById('txtFechaPago').value;
    var montoPago = document.getElementById('txtMontoPago').value;
    var lblFecha = document.getElementById("lblFecha");
    var lblMonto = document.getElementById("lblMonto");

    // Limpia mensajes de error
    lblFecha.innerText = "";
    lblMonto.innerText = "";
    if (fechaPago === "") {
        lblFecha.innerText = "La fecha es obligatoria";
        errorCount++;
    }

    if (montoPago === "") {
        lblMonto.innerText = "El monto es obligatorio";
        errorCount++;
    }

    if (isNaN(montoPago)) {
        lblMonto.innerText = "Ingresa solo numeros";
        errorCount++;
    }

    if (montoPago < 0) {
        lblMonto.innerText = "El monto debe ser mayor a 0";
        errorCount++;
    }

    // Si hay errores se enviara falso
    return errorCount === 0;
}