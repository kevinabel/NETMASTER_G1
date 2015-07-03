<%@include file="WEB-INF/jspf/top.jsp"%>

<div class="row">
    <div class="col-md-7">
        <h4 allign="center"><strong>Registro de Ventas</strong></h4><br>
        <table width="480" align="left" class="table-responsive">  
            <tbody>
            <tr>
                <td width="10"><strong>Fecha:</strong></td>
                <td width="60">></td>
                <td width="30"></td>
                <td width="15"><strong>IGV:</strong></td>
                <td width="60"></td>
            </tr>
            <tr>
                <td><strong>Usuario:</strong></td>
                <td></td>
                <td></td>
                <td><strong>N&deg;. Comprob:</strong></td>
                <td width="10"></td>
            </tr>
            <tr>
                <td><strong>Cliente:</strong></td>
                <<td></td>
                <td></td>
                <td><strong>F. Pago:</strong></td>
                <td width="10"></td>
            </tr>
            <br>
            <tr>
                <td colspan="5">
                    <h4 align="center">Productos de la venta</h4>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="tab-pane">
            <table class="table table-hover table-striped table-bordered">
                <thead>
                    <tr>
                        <td width="5%" bgcolor="#FFEFCE"><strong>Cant</strong></td>
                        <td width="27%" bgcolor="#FFEFCE"><strong>Nombre del Producto</strong></td>
                        <td width="9%" align="center" bgcolor="#FFEFCE"><strong>Costo</strong></td>
                        <td width="9%" align="center" bgcolor="#FFEFCE"><strong>Importe</strong></td>
                        <td width="9%" align="center" bgcolor="#FFEFCE"><strong>Opciones</strong></td>
                    </tr>
                </thead>
                <tbody>

                    <tr> 
                        <td align="center"></td>
                        <td></td>
                        <td align="center"></td> 
                        <td align="center"></td>
                        <td>
                            <a href="Venta_detalle_1.jsp?opcion=Actualizar&id_producto=&id_venta=" title="Actualizar">
                                <button type="button" class="btn btn-info">
                                    <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                                </button>
                            </a>
                            <a href="Venta_detalle_1.jsp?opcion=Eliminar&id_producto=&id_venta=" title="Eliminar">
                                <button type="button" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                </button>
                            </a>
                        </td>
                    </tr>
                 
                </tbody>
            </table>
            <form action="Venta_detalle_1.jsp">
                <table class="table table-hover table-striped table-bordered">
                    <tbody>
                        <tr>
                            <input type="hidden" name="id_venta"  value="" size="10">
                            <td colspan="6" align="center"><input type="submit" name="opcion" class="btn btn-primary" value="Finalizar"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>

    </div>
    <div class="col-md-5">
        <h4 allign="center"><strong>Buscar Productos</strong></h4><br>
        
        <form class="form-horizontal" action="Venta_detalle_1.jsp" method="post"> 
            
            <table>
                <tr>
                    <input type="hidden" name="opcion"  value="" size="10">  
                    <input type="hidden" name="id_venta"  value="" size="10">  
                    <td width="20%"><strong>Buscar Por:</strong></td>
                    <td width="25%"><select class="form-control" name="buscar_por">
                        <option value="nombre">Nombre</option>
                        <option value="codigo">C&oacute;digo</option>
                    </select></td>
                    <td>
                        <div class="input-group">
                        <input type="text" class="form-control" placeholder="b&uacute;sca aqu&iacute;" name="buscar">
                        <span class="input-group-btn">
                          <button type="submit" class="btn btn-success">Buscar<span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                        </span>
                    </div>
                    </td>        
                </tr>
            </table>
            <div class="form-group">
        </form>       
        <div class="tab-pane">
            <table class="table table-hover table-striped table-bordered">
                <thead>
                <br>
                    <tr>
                        <td width="5%" bgcolor="#FFEFCE"><strong>#</strong></td>
                        <td width="28%" bgcolor="#FFEFCE"><strong>Producto</strong></td>
                        <td width="9%" align="center" bgcolor="#FFEFCE"><strong>Marca</strong></td>
                        <td width="7%" bgcolor="#FFEFCE"><strong>Und</strong></td>
                        <td width="7%" align="center" bgcolor="#FFEFCE"><strong>Costo</strong></td>
                        <td width="7%" align="center" bgcolor="#FFEFCE"><strong>Stock</strong></td>
                    </tr>
                </thead>
                <tbody>
        
                    <tr>     
                        <td>-</td> 
                        <td><a href="Venta_detalle_1.jsp?id_producto=&opcion=add"></a></td>
                        <td align="center"></td>
                        <td align="center"></td>
                        <td align="center"></td>
                        <td align="center"></td> 
                    </tr>

                </tbody>
            </table>
        </div>          
       <h1></h1>

        <h4 align="center">Agregando Productos</h4><br>
    
        <h4 align="center">Actualizando Productos</h4><br>

        <form action="Venta_detalle_1.jsp" method="get"> 
            <table class="table table-bordered">
                <tbody>   
                    <tr>
                        <input type="hidden" name="id_producto" size="10">
                        <input type="hidden" name="id_venta"   size="10">
                        <td>Nombre:</td>
                        <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Nombre" value="" disabled=""></div></td>
                    </tr>
                    
                    <tr>
                        <td>Marca:</td>
                        <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Marca" value="" disabled=""></div></td>
                    </tr>
                   
                    <tr>
                        <td>Cantidad:</td>
                        <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Cantidad" name="cant" value="" required></div></td>
                    </tr>
                    <tr>
                        <td>Costo:</td>
                        <td><div class="col-sm-15"><input type="text" class="form-control" placeholder="Precio Unitario" name="precio"></div></td>
                    </tr>
                   
                    <tr>
                      <td colspan="3" align="center"><input type="submit" name="opcion" class="btn btn-primary" value="Agregar"></td>
                    </tr>

                    <tr>
                      <td colspan="3" align="center"><input type="submit" name="opcion" class="btn btn-primary" value="Actualizando"></td>
                    </tr>

                </tbody>
            </table>
        </form>
        
    </div>
</div>

</div>
                    <%@include file="WEB-INF/jspf/bottom.jsp"%>