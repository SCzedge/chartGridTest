<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Demo : jqxGrid</title>
<link rel="stylesheet" href="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/styles/jqx.base.css" type="text/css" />
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/scripts/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxscrollbar.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxmenu.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxcheckbox.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxlistbox.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxdropdownlist.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxgrid.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxgrid.sort.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxgrid.pager.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxgrid.selection.js"></script>
<script type="text/javascript" src="resources/lib/jqx/jqwidgets-ver12.0.0/jqwidgets/jqxgrid.edit.js"></script>
</head>
<body>
	<h1>Demo - jqxGrid</h1>
	<hr>
<div id ="grid"></div>

</body>
<script>
$(document).ready(function () {
    var url = "../sampledata/products.xml";

    
    // prepare the data
    var source =
    {
        datatype: "xml",
        datafields: [
            { name: 'ProductName', type: 'string' },
            { name: 'QuantityPerUnit', type: 'int' },
            { name: 'UnitPrice', type: 'float' },
            { name: 'UnitsInStock', type: 'float' },
            { name: 'Discontinued', type: 'bool' }
        ],
        root: "Products",
        record: "Product",
        id: 'ProductID',
        url: url
    };

    
    var cellsrenderer = function (row, columnfield, value, defaulthtml, columnproperties, rowdata) {
        if (value < 20) {
            return '<span style="margin: 4px; margin-top:8px; float: ' + columnproperties.cellsalign + '; color: #ff0000;">' + value + '</span>';
        }
        else {
            return '<span style="margin: 4px; margin-top:8px; float: ' + columnproperties.cellsalign + '; color: #008000;">' + value + '</span>';
        }
    }

    
    var dataAdapter = new $.jqx.dataAdapter(source, {
        downloadComplete: function (data, status, xhr) { },
        loadComplete: function (data) { },
        loadError: function (xhr, status, error) { }
    });



    
    // initialize jqxGrid
    $("#grid").jqxGrid(
    {
//         width: getWidth('Grid'),
        width: '1000px',
        source: dataAdapter,                
        pageable: true,
        autoheight: true,
        sortable: true,
        altrows: true,
        enabletooltips: true,
        editable: true,
        selectionmode: 'multiplecellsadvanced',
        columns: [
          { text: 'Product Name', columngroup: 'ProductDetails', datafield: 'ProductName', width: 250 },
          { text: 'Quantity per Unit', columngroup: 'ProductDetails', datafield: 'QuantityPerUnit', cellsalign: 'right', align: 'right', width: 200 },
          { text: 'Unit Price', columngroup: 'ProductDetails', datafield: 'UnitPrice', align: 'right', cellsalign: 'right', cellsformat: 'c2', width: 200 },
          { text: 'Units In Stock', datafield: 'UnitsInStock', cellsalign: 'right', cellsrenderer: cellsrenderer, width: 100 },
          { text: 'Discontinued', columntype: 'checkbox', datafield: 'Discontinued' }
        ],
        columngroups: [
            { text: 'Product Details', align: 'center', name: 'ProductDetails' }
        ]
    });
});
</script>
</html>