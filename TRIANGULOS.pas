
PROGRAM Calendar;


USES
	Crt;


CONST
	(*
	* Nombre de los meses para comparar con el requerimiento del usuario y poder generar 
	* calendario para el mes indicado.
	*)
	monthNames : Array[1..12] of String = ('ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO', 
		'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE');

	(*
	* Este arreglo contiene datos sobre cantidad de dias de cada mes (primera columna) y 
	* posicion en que inicia cada mes en el calendario (segunda columna).
	* Las filas son correspondiente a cada mes del a๑o.
	*)
	meses : Array[1..12,1..2] of Byte = ((31,4), (28,7), (31,7), (30,3), (31,5), (30,1), (31,3), 
		(31,6), (30,2), (31,4), (30,7), (31,2));

	(*
	* Este arreglo contiene los dias feriados de cada mes almacenado en las columnas.
	* Las filas son correspondiente a cada mes del a๑o.
	*)
	feriados : Array[1..12,1..3] of Byte = 	((1,0,0), (0,0,0), (0,0,0), (1,10,0), (1,21,0), 
		(29,0,0), (16,0,0), (15,0,0), (18,19,0), (12,31,0), (1,0,0), (8,13,25));

    {Color para dํas feriados y domingo (RED: const 4, LightRed: const 12).}
	holidayColor : Byte = RED;

	{Color para fondo de pantalla.}
	bgColor : Byte = WHITE;

	{Color para texto normal.}
	normalText : Byte = BLACK;


VAR
	{Almacena la estructura final del calendario.}
	calendario: Array[1..6,1..7] of ShortInt;	

	{Seleccion de mes a amostrar.}
	month : String[11];	

	{err: Identifica cuando se a ingresado un nombre de mes no vแlido. i: Itera en el rango [1,12] 
	para buscar coincidencia de meses.}
	i, err : Byte;	


(*
* Procedimiento para colocar el arreglo calendario en su estado por defecto.
*)
procedure defaultCalendar;	
	VAR
		i, j : Byte;

	BEGIN
		for i := 1 to 6 do
			for j := 1 to 7 do
				calendario[i, j] := 0;
	END;


(*
* Formato de tabla para calendario de 5 semanas.
*)
procedure drawFiveRows;
	VAR
		(*
		* i, j variables para iteraci๓n.
		* x, y variables para posicionar los n๚meros de los dํas en su correspondiente casilla.
		* dia se utiliza para controlar la cantidad de dํas que tiene el mes solicitado.
		*)
		i, j, x, y, dia : ShortInt;

	BEGIN	
writeln('ษอออออออออหอออออออออหอออออออออหอออออออออหออออออออออหอออออออออหอออออออออป ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ศอออออออออสอออออออออสอออออออออสอออออออออสออออออออออสอออออออออสอออออออออผ ');

		GotoXY(4,5);	Write('LUNES');
		GotoXY(13,5);	Write('MARTES');
		GotoXY(22,5);	Write('MIERCOLES');
		GotoXY(33,5);	Write('JUEVES');
		GotoXY(43,5);	Write('VIERNES');
		GotoXY(53,5);	Write('SABADO');
		GotoXY(63,5);	Write('DOMINGO');

		y := 5; {Movimiento en filas.}
		x := -5; {Movimiento en columnas.}
		dia := 0;	{Contador de dias.}

		for i := 1 to 5 do
			BEGIN
				y := y + 2;		
				for j := 1 to 7 do
					BEGIN
						x := x + 10;			
						GotoXY(x,y); 			
						if (calendario[i,j]<>0) then
							BEGIN				 
								if (calendario[i,j]<0) OR (x = 65)then
									BEGIN
										if calendario[i,j]<0 then
											BEGIN
												TextColor(holidayColor);
												Write(calendario[i,j]*-1)
											END
										else
											BEGIN
												TextColor(holidayColor);
												Write(calendario[i,j])
											END;
									END
								else
									BEGIN
										TextColor(normalText);
										Write(calendario[i,j]);
									END;
							END;			 
						dia := dia + 1;
					END;
				x := -5;
			END;
		TextColor(normalText);
	END;


(*
* Formato de tabla para calendario de 6 semanas.
*)
procedure drawSixRows;
	VAR
		(*
		* i, j variables para iteraci๓n.
		* x, y variables para posicionar los n๚meros de los dํas en su correspondiente casilla.
		* dia se utiliza para controlar la cantidad de dํas que tiene el mes solicitado.
		*)
		x, y, j, i, dia : ShortInt;
	BEGIN
writeln('ษอออออออออหอออออออออหอออออออออหอออออออออหออออออออออหอออออออออหอออออออออป ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮออออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ          บ         บ         บ ');
writeln('ศอออออออออสอออออออออสอออออออออสอออออออออสออออออออออสอออออออออสอออออออออผ ');
		GotoXY(4,5);	Write('LUNES');
		GotoXY(13,5);	Write('MARTES');
		GotoXY(22,5);	Write('MIERCOLES');
		GotoXY(33,5);	Write('JUEVES');
		GotoXY(43,5);	Write('VIERNES');
		GotoXY(53,5);	Write('SABADO');
		GotoXY(63,5);	Write('DOMINGO');

		y := 5;		{Movimiento en filas.}
		x := -5;	{Movimiento en columnas.}
		dia := 0;	{Contador de dias.}

		for i := 1 to 6 do
			BEGIN
				y := y + 2;		
				for j := 1 to 7 do
					BEGIN
						x := x + 10;			
						if (calendario[i,j]<>0) then
							BEGIN
								GotoXY(x,y); 
								if (calendario[i,j]<0) OR (x = 65) then
									BEGIN
										if calendario[i,j]<0 then
											BEGIN
												TextColor(holidayColor);
												Write(calendario[i,j]*-1)
											END
										else
											BEGIN
												TextColor(holidayColor);
												Write(calendario[i,j]);
											END;
									END
								else
									BEGIN
									TextColor(normalText);
									Write(calendario[i,j]);
									END;
							END; 
						dia := dia + 1;
					END;
				x := -5;
			END;
		TextColor(normalText);
	END;



(*
* Recibe como parametro el numero del mes.
*)
procedure generarCalendario(mes : Byte);
	VAR
		i, j, dia, feriado : Byte;

	BEGIN
		dia := 1;
		feriado := 1;
			for i := 1 to 6 do
				BEGIN
					for j := 1 to 7 do	
						BEGIN 		
							if (j >= meses[mes, 2]) AND (i = 1)  OR (i>1) AND (dia <= meses[mes, 1]) then				
								BEGIN
									if dia = feriados[mes, feriado] then
										BEGIN
											calendario[i, j] := dia*-1;
											feriado := feriado + 1;
										END
									else
										calendario[i, j] := dia;

									dia := dia + 1;						
								END;					
						END;		
				END;
	END;


(*
 * Funcion desarrollada por drdebcol: http://pro9ramming.com/uppercase-and-lowercase-string-t-503.html
 * La funcion Dec(a,b), decrementa el primer parametro en la cantidad especificada en el segundo parametro.
 * Si el segundo parametro no es especificado, toma por defecto el valor de 1.
 * Mแs informaci๓n sobre el funcionamiento de Dec() en http://www.freepascal.org/docs-html/rtl/system/dec.html
 *
 * En este caso, se utiliza un decremento de 32 para poder hacer la conversion de minuscula a mayuscula
 * guiandose por la tabla ASCII.
 * Ej: "A" tiene un valor decima de 65, mientras que "a" tiene un valor decimal de 97. Por lo que al restar
 * el valor decimal 32, es posible reemplazar su valor por el valor de su letra correspondiente en mayuscula.
*)
function uppercase(cadena : String) : String;
	VAR
		i : Byte;
	BEGIN
		for i := 1 to length(cadena) do
		    if (cadena[i] >= 'a') and (cadena[i] <= 'z') then
		    	dec(cadena[i], 32);
		    uppercase := cadena;
	END;

(*
* Pantalla de inicio del calendario.
*)
procedure start;
	BEGIN
		WriteLn;
		WriteLn;
		WriteLn('        oMs                sM+    ');
		WriteLn('    dooosMsoooooooooooooooosM+oooh');
		WriteLn('    M`  +No                oN+   M');
		WriteLn('    M`                           M');
		WriteLn('    MssssssssssssssssssssssssssssM');
		WriteLn('    M````````````````````````````M');
		WriteLn('    M`                          `M');
		WriteLn('    M`                          `M');
		WriteLn('    M`        BIENVENIDO        `M');
		WriteLn('    M`             A            `M');
		WriteLn('    M`        CALENDARIO        `M');
		WriteLn('    M`                          `M');
		WriteLn('    M`                          `M');
		WriteLn('    M`                          `M');
		WriteLn('    MssssssssssssssssssssssssssssM');	
		WriteLn;
		Delay(3500);
	END;


BEGIN
	TextBackground(bgColor);
	TextColor(normalText);
	clrscr;	
	start;
	REPEAT
		defaultCalendar;
		REPEAT
			(*
			*	Este ciclo se repite hasta que el usuario ingrese un nombre correcto de mes.
			*	De ingresar un nombre no valido, se devuelve  un mensaje de error.
			*)
	        clrscr;
			WriteLn;
			Write(' Escriba mes a consultar: ');
			ReadLn(month);
			month := uppercase(month);
	        i := 0;
	        err := 0;
	        REPEAT
	            i := i + 1;
	            if month = monthNames[i] then
		            BEGIN
			            clrscr;
			            WriteLn;
		                WriteLn(' Mes consultado: ', month, '/2015');
					    WriteLn;
		                err := 1;
		                generarCalendario(i);
			        END;
	        UNTIL (month = monthNames[i]) OR (i > 12);

	        if err = 0 then
		        BEGIN
		            WriteLn;
		            WriteLn(' Error. Intente nuevamente.');
		            Delay(2500);
		        END;

        UNTIL(month = 'ENERO') OR (month = 'FEBRERO') OR (month = 'MARZO') OR (month = 'ABRIL') OR
        (month = 'MAYO') OR (month = 'JUNIO') OR (month = 'JULIO') OR (month = 'AGOSTO') OR
        (month = 'SEPTIEMBRE') OR (month = 'OCTUBRE') OR (month = 'NOVIEMBRE') OR (month = 'DICIEMBRE');

		if calendario[6,1] = 0 then
			drawFiveRows
		else
			drawSixRows;

		GotoXY(1,20); 
		WriteLn('_____________________________________________________________________________');
        Write(' Para consultar otro mes presione ENTER. Para salir escriba "N" y confirme: ');
		ReadLn(month);
		month := UpperCase(month);
	UNTIL(month = 'N');

	WriteLn;
	WriteLn(' Saliendo del programa...');
	Delay(2000);
END.