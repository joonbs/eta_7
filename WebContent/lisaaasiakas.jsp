<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Insert title here</title>
</head>
<body>
<form id="tiedot">
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>S�hk�posti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="asiakas_id" id="asiakas_id"></td>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td>
				<td><input type="submit" id="tallenna" value="Lis��"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmoitus"></span>
</body>
<script>
$(document).ready(function() {
	$("#tiedot").validate({
		rules: {
			asiakas_id: {
				required: true,
				minlength: 3,
				number: true
			},
			etunimi: {
				required: true,
				minlength: 2
				
			},
			sukunimi: {
				required: true,
				minlength: 2
				
			},
			puhelin: {
				required: true,
				number: true
			},
			sposti: {
				required: true,
				email: true
			}
		},
		messages: {
			
			asiakas_id: {
				required: "Pakollinen",
				minlength: "Liian lyhyt",
				number: "Lis�� asiakkaan ID"
			},
			etunimi: {
				required: "Pakollinen",
				minlength: "Liian lyhyt"
				
			},
			sukunimi: {
				required: "Pakollinen",
				minlength: "Lis�� sukunimi"
				
			},
			puhelin: {
				required: "Pakollinen",
				number: "Lis�� puhelinnumero"
			},
			sposti: {
				required: "Pakollinen",
				email: "Lis�� s�hk�postiosoite"
			}
		},
		submitHandler: function(form) {
			lisaaTiedot();
		}
		});
});

function lisaaTiedot() {
	var formJsonStr = formDataJsonStr($("tiedot").serializeArray());
	$.ajax({url:"asiakkaat", data:formJsonStr, type:"POST", dataType:"json" success: function(result)});
	
	if(result.response == 0) {
		$("#ilmoitus").html("Asiakkaan lis��minen ep�onnistui.");
		
	}else if(result.response == 1) {
		$("#ilmoitus").html("Asiakkaan lis��minen onnistui.");
		$("$asiakas_id", "#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
		}
	}});	
}
</script>
</html>