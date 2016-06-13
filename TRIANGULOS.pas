
PROGRAM Calendar;


USES
	Crt;


CONST

	Nmes : Array[1..12] of String = ('ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO',
		'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE');

	meses : Array[1..12,1..2] of Byte = ((31,4), (28,7), (31,7), (30,3), (31,5), (30,1), (31,3),
		(31,6), (30,2), (31,4), (30,7), (31,2));


	feriados : Array[1..12,1..3] of Byte = 	((1,0,0), (0,0,0), (0,0,0), (1,10,0), (1,21,0),
		(29,0,0), (16,0,0), (15,0,0), (18,19,0), (12,31,0), (1,0,0), (8,13,25));


	holidayColor : Byte = RED;
	bgColor : Byte = 11;
	normalText : Byte = BLACK;


VAR

	calendario: Array[1..6,1..7] of ShortInt;

	mes : String[11];

	i, err : Byte;


procedure Calendar0;
	VAR
		i, j : Byte;

	BEGIN
		for i := 1 to 6 do
			for j := 1 to 7 do
				calendario[i, j] := 0;
	END;



procedure cincofilas;
	VAR

		i, j, x, y, dia : ShortInt;

	BEGIN
         textbackground(7);
        textcolor(15);
writeln('ษอออออออออหอออออออออหอออออออออหอออออออออหอออออออออหอออออออออหอออออออออป ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ศอออออออออสอออออออออสอออออออออสอออออออออสอออออออออสอออออออออสอออออออออผ ');

		GotoXY(4,5);	Write('LUNES');
		GotoXY(13,5);	Write('MARTES');
		GotoXY(22,5);	Write('MIERCOLES');
		GotoXY(33,5);	Write('JUEVES');
		GotoXY(43,5);	Write('VIERNES');
		GotoXY(53,5);	Write('SABADO');
		GotoXY(63,5);	Write('DOMINGO');

		y := 5;
		x := -5;
		dia := 0;

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



procedure seisfilas;
	VAR

		x, y, j, i, dia : ShortInt;
	BEGIN
        textbackground(7);
        textcolor(15);
writeln('ษอออออออออหอออออออออหอออออออออหอออออออออหอออออออออหอออออออออหอออออออออป ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ฬอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออฮอออออออออน ');
writeln('บ         บ         บ         บ         บ         บ         บ         บ ');
writeln('ศอออออออออสอออออออออสอออออออออสอออออออออสอออออออออสอออออออออสอออออออออผ ');
		GotoXY(4,5);	Write('LUNES');
		GotoXY(13,5);	Write('MARTES');
		GotoXY(22,5);	Write('MIERCOLES');
		GotoXY(33,5);	Write('JUEVES');
		GotoXY(43,5);	Write('VIERNES');
		GotoXY(53,5);	Write('SABADO');
		GotoXY(63,5);	Write('DOMINGO');

		y := 5;
		x := -5;
		dia := 0;

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




procedure Calendarioej(mes : Byte);
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



function MAYUS(texto : String) : String;
	VAR

		AUX : String;
		pos : Byte ;
	BEGIN
		AUX :='' ;
		for pos := 1 to length(texto) do
		    AUX := AUX + Upcase(texto[pos]);

		MAYUS := AUX
	END;



BEGIN
	TextBackground(bgColor);
	TextColor(normalText);
	clrscr;

	REPEAT
		Calendar0;
		REPEAT

	        clrscr;
			WriteLn;
			WriteLn('Bienvenido a Calendario') ;
			Write(' Escriba mes a consultar: ');
			ReadLn(mes);
			mes := MAYUS(mes);
	        i := 0;
	        err := 0;
	        REPEAT
	            i := i + 1;
	            if mes = Nmes[i] then
		            BEGIN
			            clrscr;
			            WriteLn;
		                WriteLn(' Mes consultado: ', mes, '');
					    WriteLn;
		                err := 1;
		                Calendarioej(i);
			        END;
	        UNTIL (mes = Nmes[i]) OR (i > 12);

	        if err = 0 then
		        BEGIN
		            WriteLn;
		            WriteLn(' Error. Intente nuevamente.');
		            Delay(3000);
		        END;

        UNTIL(mes = 'ENERO') OR (mes = 'FEBRERO') OR (mes = 'MARZO') OR (mes = 'ABRIL') OR
        (mes = 'MAYO') OR (mes = 'JUNIO') OR (mes = 'JULIO') OR (mes = 'AGOSTO') OR
        (mes = 'SEPTIEMBRE') OR (mes = 'OCTUBRE') OR (mes = 'NOVIEMBRE') OR (mes = 'DICIEMBRE');

		if calendario[6,1] = 0 then
			cincofilas
		else
			seisfilas;

		GotoXY(1,20);
         textbackground(bgColor);
        Write(' Para consultar otro mes presione ENTER. Para salir escriba "S" : ');
		ReadLn(mes);
		mes := MAYUS(mes);
	UNTIL(mes = 'S');

	WriteLn;

	Delay(4500);
	WriteLn('  Este Clendario se ha traido a ustedes con la colaboracion de: ');
	WriteLn('                          Diego Mendoza  ');
	Delay(5000);
	WriteLn('                          Sebastian Pulgar  ');
	Delay(5000);
	WriteLn('                          Rosa Pulgar  ');
	Delay(5000);
	WriteLn('                                Gracias...');
	Delay(7000);
        textcolor(LightBlue);
	WriteLn(' Saliendo del programa...');
	Delay(4500);
END.


