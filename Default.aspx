<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Proyecto_final._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="pt-6 bg-600" id="home">
            <div class="container">
              <div class="row align-items-center">
                <div class="col-md-5 col-lg-6 order-0 order-md-1 text-end"><img class="pt-7 pt-md-0 w-100" src="assets/img/gallery/hero-header.jpg" width="470" alt="hero-header" /></div>
                <div class="col-md-7 col-lg-6 text-md-start text-center py-6">
                  <h4 class="fw-bold font-sans-serif">Bienvenido a Nomi-Tec</h4>
                  <h1 class="fs-6 fs-xl-7 mb-5">Pago seguro, gestión eficiente.</h1><a class="btn btn-primary me-2" href="#!" role="button">Empieza</a>
                </div>
              </div>
            </div>
          </section>

        <section class="pt-4 mt-5">
            <div class="container px-lg-5">
                <!-- Page Features-->
                <div class="row gx-lg-5">
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-collection"></i></div>
                                <h2 class="fs-4 fw-bold">Cálculo automático de nómina</h2>
                                <p class="mb-0">Genera los salarios de los empleados considerando horas trabajadas, bonos, deducciones e impuestos de manera precisa.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-cloud-download"></i></div>
                                <h2 class="fs-4 fw-bold">Gestión de deducciones y prestaciones</h2>
                                <p class="mb-0">Aplica automáticamente impuestos, seguridad social, retenciones y otros descuentos según las normativas laborales.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-card-heading"></i></div>
                                <h2 class="fs-4 fw-bold">Generación de recibos de pago</h2>
                                <p class="mb-0">Crea y distribuye recibos de nómina en formato digital o impreso, cumpliendo con regulaciones fiscales.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-bootstrap"></i></div>
                                <h2 class="fs-4 fw-bold">Pagos automatizados</h2>
                                <p class="mb-0">Facilita la dispersión de sueldos a cuentas bancarias, reduciendo tiempos y errores en los depósitos.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-code"></i></div>
                                <h2 class="fs-4 fw-bold">Reportes y análisis de costos laborales</h2>
                                <p class="mb-0">Genera informes detallados sobre costos de nómina, prestaciones y retenciones para una mejor toma de decisiones.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xxl-4 mb-5">
                        <div class="card bg-light border-0 h-100">
                            <div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
                                <div class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"><i class="bi bi-patch-check"></i></div>
                                <h2 class="fs-4 fw-bold">Cumplimiento fiscal y contable</h2>
                                <p class="mb-0">Calcula y reporta impuestos, evitando errores y garantizando el cumplimiento de normativas gubernamentales.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

</asp:Content>
